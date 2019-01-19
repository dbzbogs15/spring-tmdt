package com.tmdt.controller;

import com.tmdt.model.MD5;
import com.tmdt.model.Users;
import com.tmdt.service.UserService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @PostMapping("/register")
    public String register(WebRequest request, RedirectAttributes rm, HttpSession session) throws Exception {
        String user_name = request.getParameter("username");
        String password = request.getParameter("password");
        String user_password = MD5.md5(password);
        String user_email = request.getParameter("email");
        Date user_created = new Date();
        String user_image = "/resources/user/default.png";
        String user_fullname = request.getParameter("fullname");
        String user_phone = request.getParameter("phone");
        String user_address = request.getParameter("address");
        String user_card_number = request.getParameter("card");
        String birth = request.getParameter("birth");
        System.out.println(birth);
        Date user_date_of_birth = new SimpleDateFormat("yyyy-dd-MM").parse(birth);
        Users u = new Users(user_name, user_password, user_email, user_created, user_fullname,
                user_phone, user_address, user_image, user_card_number, user_date_of_birth, null);
        List<Users> list = userService.findAll();
        for (Users us : list) {
            if (us.getUser_name().equalsIgnoreCase(user_name)) {
                rm.addFlashAttribute("message", "Username đã tồn tại");
                return "redirect:/register";
            }
        }
        try {
            userService.save(u);
            session.setAttribute("user", u);
        } catch (Exception e) {
            rm.addFlashAttribute("message", "Thông tin không hợp lệ");
            return "redirect:/register";
        }
        System.out.println(userService.findAll().size());
        return "redirect:/welcome";
    }

    @GetMapping("/welcome")
    public String welcome() {
        return "welcome";
    }

    @GetMapping("/register")
    public String registered() {
        return "register";
    }

    @PostMapping("/login")
    public String logined(WebRequest wr, HttpSession session, RedirectAttributes redirectAttributes) {
        String user_name = wr.getParameter("username");
        String password = wr.getParameter("password");
        if (userService.login(user_name, MD5.md5(password)) == null) {
            redirectAttributes.addFlashAttribute("message", "Tài khoản hoặc mật khẩu không chính xác");
            return "redirect:/login";
        }
        session.setAttribute("user", userService.login(user_name, MD5.md5(password)));
        if (session.getAttribute("booking") != null) {
            return "redirect:/" + session.getAttribute("booking").toString();
        }
        return "redirect:/";
    }

    @GetMapping("/login")
    public String login() {
        return "loginpage";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/ucp")
    public String ucp() {
        return "ucp";
    }

    @PostMapping("/ucp")
    public String ucp_update(WebRequest wr, RedirectAttributes rd,
                             HttpSession session, HttpServletRequest request,
                             @RequestParam(value = "avatar") MultipartFile commons) {
        //Get user đang login
        Users users = (Users) session.getAttribute("user");
        String mail = wr.getParameter("email");
        String name = wr.getParameter("name");
        String address = wr.getParameter("address");
        String phone = wr.getParameter("phone");
        users.setUser_address(address);
        users.setUser_fullname(name);
        users.setUser_phone(phone);
        users.setUser_email(mail);
        String root = "resources/user";
        String nameFile = commons.getOriginalFilename();
        String dirFile = request.getServletContext().getRealPath(root);
        try {
            //Tên ảnh
            String avatar = "user_" + users.getUser_name() + "." + FilenameUtils.getExtension(nameFile);
            //Link tới ảnh
            String newLink = dirFile + File.separator + avatar;
            if (!commons.isEmpty()) {
                //Đổ dử liệu
                commons.transferTo(new File(newLink));
                users.setUser_image("/resources/user/" + avatar);
                //Update user
                userService.save(users);
            }
            if(commons.isEmpty()) {
                users.setUser_image(users.getUser_image());
                userService.save(users);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        rd.addFlashAttribute("message", "Thay đổi thông tin thành công!");
        return "redirect:/ucp";
    }
}
