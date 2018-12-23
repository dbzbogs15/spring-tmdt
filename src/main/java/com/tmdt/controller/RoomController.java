package com.tmdt.controller;

import com.tmdt.model.RegisterService;
import com.tmdt.model.Room;
import com.tmdt.service.LocationService;
import com.tmdt.service.RegService;
import com.tmdt.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    @GetMapping("/search")
    public String search(@RequestParam(value = "location") int location,
                         @RequestParam(value = "check-in") String c_in,
                         @RequestParam(value = "check-out") String c_out,
                         @RequestParam(value = "guest") String guest,
                         HttpSession session,
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
}
