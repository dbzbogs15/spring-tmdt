package com.tmdt.controller;

import com.tmdt.model.Users;
import com.tmdt.service.HomestayService;
import com.tmdt.service.LocationService;
import com.tmdt.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
        if(session.getAttribute("user") == null) {
            return "redirect:/login";
        }
        Users u = (Users) session.getAttribute("user");
        mm.addAttribute("homestay", homestayService.getHomestayByUser(u.getUser_name()));
        return "ad_homestay";
    }

    @GetMapping("/homestay/add_homestay")
    public String add_homestay(ModelMap mm) {
        mm.addAttribute("location",locationService.findAll());
        return "add_homestay";
    }

    @GetMapping("homestay/edit_homestay/{id}")
    public String edit(ModelMap mm, @PathVariable int id) {
        mm.addAttribute("homestay", homestayService.getOne(id));
        mm.addAttribute("location",locationService.findAll());
        return "edit_homestay";
    }

    @PostMapping("/homestay/add_homestay")
    public String add_homestay_proc(WebRequest wr, HttpSession session,
                                    @RequestParam(value = "data_image") MultipartFile commons,
                                    RedirectAttributes rd, HttpServletRequest request) {
        if(commons.isEmpty()) {
            rd.addFlashAttribute("message","Vui lòng thêm ảnh homestay !");
            return "redirect:/homestay/add_homestay";
        }
        String nameFile = commons.getOriginalFilename();
        if(!"".equals(nameFile)) {

        }
        String root = "resources/homestay";
        System.out.println(request.getServletContext().getRealPath(root));
        System.out.println(nameFile);
//        String homestay_name = wr.getParameter("homestay_name");
//        String homestay_description = wr.getParameter("homestay_description");
//        String homestay_location = wr.getParameter("homestay_location");
//        System.out.println(homestay_description + "/" + homestay_location + "/" + homestay_name);
        return "redirect:/homestay/my_homestay";
    }
}
