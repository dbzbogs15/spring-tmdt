package com.tmdt.controller;

import com.tmdt.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

@Controller
public class BookingController {
    @Autowired
    RoomService roomService;

    @RequestMapping("/booking")
    public String booking(@RequestParam(value = "room_id") int id,
                          @RequestParam(value = "c_in") String check_in,
                          @RequestParam(value = "c_out") String check_out,
                          @RequestParam(value = "guest") String guest,
                          HttpSession session, RedirectAttributes rm,
                          ModelMap mm) throws Exception {
        if (session.getAttribute("user") == null) {
            rm.addFlashAttribute("message", "Vui lòng đăng nhập để tiếp tục");
            session.setAttribute("booking", "room/search/" + id);
            return "redirect:/login";
        }

        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH);
        Date ngay_nhan = sdf.parse(check_in);
        Date ngay_tra = sdf.parse(check_out);

        long diffInMillies = Math.abs(ngay_tra.getTime() - ngay_nhan.getTime());
        long result = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
        mm.addAttribute("room", roomService.getOne(id));
        System.out.println(result);
        mm.addAttribute("days", result);
        mm.addAttribute("check_out", check_out);
        mm.addAttribute("check_in", check_in);

        return "booking";
    }
}
