package com.tmdt.controller;

import com.tmdt.model.RegisterService;
import com.tmdt.model.Room;
import com.tmdt.model.Users;
import com.tmdt.service.HomestayService;
import com.tmdt.service.LocationService;
import com.tmdt.service.RegService;
import com.tmdt.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/room")
public class RoomController {
    @Autowired
    RoomService roomService;

    @Autowired
    LocationService locationService;

    @Autowired
    RegService regService;

    @Autowired
    HomestayService homestayService;

    @GetMapping("/search")
    public String search(@RequestParam(value = "location") int location,
                         @RequestParam(value = "check-in") String c_in,
                         @RequestParam(value = "check-out") String c_out,
                         @RequestParam(value = "guest") String guest,
                         HttpSession session, HttpServletRequest request,
                         ModelMap mm) {
        if (c_in.length() > 0 && c_out.length() > 0) {
            session.setAttribute("check_in", c_in);
            session.setAttribute("check_out", c_out);
        }

        System.out.println(guest + "v");
        session.setAttribute("guest", Integer.parseInt(guest));
        List<Room> result = new ArrayList<>();
        List<Integer> registerServices = new ArrayList<>();
        for (RegisterService r : regService.findDate()) {
            registerServices.add(r.getHomestay_id());
        }
        for (Room room : roomService.findAll()) {
            System.out.println(room.getHomestay().getLocation().getLocation_id());
            if (room.getHomestay().getLocation().getLocation_id() == location &&
                    registerServices.contains(room.getHomestay_id()) == true
            ) {
                result.add(room);
            }
        }
        for (Room room : roomService.findAll()) {
            System.out.println(room.getHomestay().getLocation().getLocation_id());
            if (room.getHomestay().getLocation().getLocation_id() == location &&
                    registerServices.contains(room.getHomestay_id()) == false
            ) {
                result.add(room);
            }
        }
        mm.addAttribute("reg",registerServices);
        mm.addAttribute("location", locationService.findAll());
        mm.addAttribute("location_s", location);
        mm.addAttribute("room", result);
        mm.addAttribute("link", "");
        return "room";
    }

    @GetMapping("/search/{id}")
    public String roomDetails(@PathVariable int id, ModelMap mm) {
        mm.addAttribute("room", roomService.getOne(id));
        return "room-detail";
    }

    @GetMapping("/ad_room/{id}")
    public String getAllRoom(ModelMap mm, @PathVariable int id) {
        mm.addAttribute("room", roomService.getRoomByHomestay(id));
        System.out.println("ABC");
        return "ad_room";
    }

    @GetMapping("/edit_room/{id}")
    public String editRoom(ModelMap mm, @PathVariable int id,
                           HttpSession session) {
        mm.addAttribute("room",roomService.getOne(id));
        Users users = (Users) session.getAttribute("user");
        mm.addAttribute("homestay", homestayService.getHomestayByUser(users.getUser_name()));
        return "edit_room";
    }

    @PostMapping("/edit_room/{id}")
    public String editedRoom(@PathVariable int id, WebRequest wr,
                             RedirectAttributes redirectAttributes) {
        Room room = roomService.getOne(id);
        String room_name = wr.getParameter("room_name");
        String address = wr.getParameter("address");
        int status = Integer.parseInt(wr.getParameter("status"));
        int price = Integer.parseInt(wr.getParameter("price"));
        String description = wr.getParameter("description");
        String info = wr.getParameter("info");
        int id_homestay = Integer.parseInt(wr.getParameter("homestay_id"));
        room.setRoom_name(room_name);
        room.setRoom_address(address);
        room.setRoom_price(price);
        room.setRoom_describe(description);
        room.setRoom_information(info);
        room.setRoom_status(status);
        room.setHomestay_id(id_homestay);
        roomService.updateRoom(room);
        redirectAttributes.addFlashAttribute("message", "Thay đổi thông tin phòng thành công!");
        return "redirect:/room/ad_room/" + room.getHomestay_id();
    }
}
