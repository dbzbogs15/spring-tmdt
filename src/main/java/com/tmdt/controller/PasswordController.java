package com.tmdt.controller;

import com.tmdt.model.MD5;
import com.tmdt.model.Users;
import com.tmdt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.internet.InternetAddress;
import javax.servlet.http.HttpSession;
import java.util.Optional;
import java.util.UUID;

@Controller
public class PasswordController {

    @Autowired
    private UserService userService;

    @Autowired
    private JavaMailSender emailService;

    @RequestMapping(value = "/forgot", method = RequestMethod.GET)
    public String displayForgotPasswordPage() {
        return "forgotPassword";
    }

    @PostMapping(value = "/forgot")
    public String processForgotPasswordForm(@RequestParam("email") String userEmail,
                                            RedirectAttributes rd) {
        Optional<Users> optional = userService.findUserByEmail(userEmail);
        if(!optional.isPresent()) {
            System.out.println("Không tìm thấy email");
        } else {
            Users users = optional.get();
            users.setReset_token(UUID.randomUUID().toString());

            userService.save(users);

//            String appUrl = "http://localhost:8080";
            String appUrl = "http://ngohongthai.herokuapp.com";

            SimpleMailMessage passwordResetEmail = new SimpleMailMessage();
            passwordResetEmail.setFrom("dbzbogs15@gmail.com");
            passwordResetEmail.setTo(users.getUser_email());
            passwordResetEmail.setSubject("Password Reset Request");
            passwordResetEmail.setText("To reset your password, click the link below:\n" + appUrl
                    + "/reset?token=" + users.getReset_token());

            emailService.send(passwordResetEmail);
            System.out.println("Đã gửi mail");
            rd.addFlashAttribute("message", "Một liên kết vừa gửi vào hộp thư của bạn, vui lòng kiểm tra esmail để reset mật khẩu !");
        }
        return "redirect:/login";
    }

    @GetMapping(value = "/reset")
    public String displayResetPasswordPage(@RequestParam("token") String token,
                                           ModelMap mm) {
        Optional<Users> user = userService.findUserByResetToken(token);
        if(user.isPresent()) { // Token found in DB
            mm.addAttribute("token", token);
        } else {
            mm.addAttribute("message", "Oops!  This is an invalid password reset link.");
        }
        return "resetPassword";
    }
    @PostMapping(value = "reset")
    public String setNewPassword(WebRequest wr, ModelMap mm, RedirectAttributes redir) {
        // Find the user associated with the reset token
        Optional<Users> user = userService.findUserByResetToken(wr.getParameter("token"));

        // This should always be non-null but we check just in case
        if(user.isPresent()) {
            Users resetUser = user.get();

            //Set new pass
            String pass = wr.getParameter("password");
            String encodePass = MD5.md5(pass);
            resetUser.setUser_password(encodePass);

            // Set the reset token to null so it cannot be used again
            resetUser.setReset_token(null);

            //Save user
            userService.save(resetUser);

            // In order to set a model attribute on a redirect, we must use
            // RedirectAttributes
            redir.addFlashAttribute("message", "Bạn đã thiết lập lại mật khẩu thành công. Bây giờ bạn có thể đăng nhập.");
            System.out.println("Đổi mk thành công");
            return "redirect:/login";
        } else {
            mm.addAttribute("message", "Oops!  This is an invalid password reset link.");
            return "resetPassword";
        }
    }
    @GetMapping("/change_pwd")
    public String change() {
        return "changePassword";
    }

    @ResponseBody
    @PostMapping("/change_pwd")
    public String exc_change(WebRequest wr, HttpSession session) {
        String pwd = MD5.md5(wr.getParameter("old_pwd"));
        String new_pwd = wr.getParameter("new_pwd");
        String confirm_pwd = wr.getParameter("confirm_pwd");
        System.out.println("Old: " + pwd);
        Users users = (Users) session.getAttribute("user");
        if(!pwd.equals(users.getUser_password())) {
            return "Mật khẩu cũ không chính xác!";
        }
        if(!new_pwd.equals(confirm_pwd)) {
            return "Xác nhận mật khẩu không trùng khớp !";
        }
        if(pwd.equals(users.getUser_password()) && new_pwd.equals(confirm_pwd)) {
            users.setUser_password(MD5.md5(new_pwd));
            userService.save(users);
            return "Mật khẩu thay đổi thành công!";
        }
        return "Error";
    }
}
