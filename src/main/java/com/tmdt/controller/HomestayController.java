package com.tmdt.controller;

import com.tmdt.model.Homestay;
import com.tmdt.model.Users;
import com.tmdt.service.HomestayService;
import com.tmdt.service.LocationService;
import com.tmdt.service.RegService;
import com.tmdt.service.RoomService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Controller
public class HomestayController {
    @Autowired
    HomestayService homestayService;

    @Autowired
    LocationService locationService;

    @Autowired
    RoomService roomService;

    @RequestMapping("/homestay")
    public String all_homestay(ModelMap mm, @RequestParam int id) {
        mm.addAttribute("room", roomService.getRoomByHomestay(id));
        return "homestay";
    }

    @RequestMapping("/homestay/my_homestay")
    public String homestay(ModelMap mm, HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:/login";
        }
        Users u = (Users) session.getAttribute("user");
        mm.addAttribute("homestay", homestayService.getHomestayByUser(u.getUser_name()));
        return "ad_homestay";
    }

    @GetMapping("/homestay/add_homestay")
    public String add_homestay(ModelMap mm) {
        mm.addAttribute("location", locationService.findAll());
        return "add_homestay";
    }

    @GetMapping("homestay/edit_homestay/{id}")
    public String edit(ModelMap mm, @PathVariable int id) {
        mm.addAttribute("homestay", homestayService.getOne(id));
        mm.addAttribute("location", locationService.findAll());
        return "edit_homestay";
    }

    @PostMapping("homestay/edit_homestay/{id}")
    public String edited(ModelMap mm, WebRequest wr, @PathVariable int id,
                         RedirectAttributes redirectAttributes) {
        String homestay_name = wr.getParameter("homestay_name");
        String description = wr.getParameter("description");
        int location = Integer.parseInt(wr.getParameter("location"));
        Homestay homestay = homestayService.getOne(id);
        homestay.setHomestay_name(homestay_name);
        homestay.setHomestay_description(description);
        homestay.setHomestay_location(location);

        homestayService.update(homestay);
        redirectAttributes.addFlashAttribute("message", "Thay đổi thông tin homestay thành công!");
        return "redirect:/homestay/my_homestay";
    }

    @PostMapping("/homestay/add_homestay")
    public String add_homestay_proc(WebRequest wr, HttpSession session,
                                    @RequestParam(value = "data_image") MultipartFile commons,
                                    RedirectAttributes rd, HttpServletRequest request) {
        Users users = (Users) session.getAttribute("user");
        if (commons.isEmpty()) {
            rd.addFlashAttribute("message", "Vui lòng thêm ảnh homestay !");
            return "redirect:/homestay/add_homestay";
        }
        String homestay_name = request.getParameter("homestay_name");
        String description = request.getParameter("homestay_description");
        int address = Integer.parseInt(request.getParameter("homestay_location"));
        String nameFile = commons.getOriginalFilename();

        Homestay homestay = new Homestay();
        homestay.setHomestay_location(address);
        homestay.setHomestay_description(description);
        homestay.setHomestay_name(homestay_name);
        homestay.setHomestay_master(users.getUser_name());
        homestay.setHomestay_number_reviews(0);
        homestay.setHomestay_reviews(0);
        String root = "resources/homestay";
        String dirFile = request.getServletContext().getRealPath(root);
        try {
            homestayService.update(homestay);
            List<Homestay> homestays = homestayService.findAll();
            Homestay homestay1 = homestays.get(homestays.size() - 1);
            int id = homestay1.getHomestay_id();
            String name = "homestay_" + id + "." + FilenameUtils.getExtension(nameFile);
            String newLink = dirFile + File.separator + name;
            commons.transferTo(new File(newLink));
            homestay1.setHomestay_image("homestay/" + name);
            homestayService.update(homestay1);
        } catch (Exception r) {
            r.getStackTrace();
            rd.addFlashAttribute("message", "Vui fail ảnh !");
            return "redirect:/homestay/add_homestay";
        }
        System.out.println(request.getServletContext().getRealPath(root));
        System.out.println(nameFile);
//        String homestay_name = wr.getParameter("homestay_name");
//        String homestay_description = wr.getParameter("homestay_description");
//        String homestay_location = wr.getParameter("homestay_location");
//        System.out.println(homestay_description + "/" + homestay_location + "/" + homestay_name);
        return "redirect:/homestay/my_homestay";
    }


    @Autowired
    RegService regService;

    @GetMapping("/all_homestay")
    public String allHomestay(ModelMap mm) {
        List<Integer> listID = new ArrayList<>();
        regService.findDate().forEach((i) ->
                listID.add(i.getHomestay_id())
        );
        List<Homestay> h = homestayService.findAll();
        List<Homestay> arr = new ArrayList<>();
        for (Homestay homestay : h) {
            if (listID.contains(homestay.getHomestay_id())) {
                arr.add(homestay);
            }
        }
        for (Homestay homestay : h) {
            if (!listID.contains(homestay.getHomestay_id())) {
                arr.add(homestay);
            }
        }
        mm.addAttribute("homestay", arr);
        return "allHomestay";
    }
}
