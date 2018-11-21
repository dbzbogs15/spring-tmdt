package com.tmdt.controller;

import com.tmdt.model.Room;
import com.tmdt.service.LocationService;
import com.tmdt.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/room")
public class RoomController {
    @Autowired
    RoomService roomService;

    @Autowired
    LocationService locationService;

    @GetMapping("/search")
    public String search(@RequestParam(value = "location") int location,
                         @RequestParam(value = "check-in") String c_in,
                         @RequestParam(value = "check-out") String c_out,
                         @RequestParam(value = "guest") String guest,
                         HttpSession session,
                         ModelMap mm) {
        if(c_in.length()>0 && c_out.length()>0){
            session.setAttribute("check_in", c_in);
            session.setAttribute("check_out", c_out);
        }
        List<Room> result = new ArrayList<>();
        for(Room room : roomService.findAll()) {
            System.out.println(room.getHomestay().getLocation().getLocation_id());
            if (room.getHomestay().getLocation().getLocation_id() == location) {
                result.add(room);
            }
        }
        mm.addAttribute("location", locationService.findAll());
        mm.addAttribute("location_s", location);
        mm.addAttribute("room", result);
        return "room";
    }

//    @GetMapping("/search")
//    public String search2(ModelMap mm) {
//        System.out.println(roomService.findAll().size());
//        mm.addAttribute("room", roomService.findAll());
//        System.out.println(roomService.findAll().get(0).getRoom_image());
//        return "room";
//    }
}
