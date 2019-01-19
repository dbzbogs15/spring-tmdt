package com.tmdt.controller;

import com.tmdt.model.Booking;
import com.tmdt.model.Homestay;
import com.tmdt.model.RegisterService;
import com.tmdt.model.Room;
import com.tmdt.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;

@Controller
public class MainController {

    @Autowired
    HomestayService homestayService;

    @Autowired
    RegService regService;

    @Autowired
    LocationService locationService;

    @Autowired
    BookingService bookingService;

    @Autowired
    RoomService roomService;

    @RequestMapping("/")
    public String index(ModelMap mm) {
        List<RegisterService> list = regService.findDate();
        List<Homestay> listHomestay = new ArrayList<>();
        for (RegisterService r : list) {
            listHomestay.add(homestayService.getOne(r.getHomestay_id()));
        }
        int rand = 0;
        List<Homestay> arr = new ArrayList<>();
        while (arr.size() < 4) {
            rand = new Random().nextInt(listHomestay.size());
            if (arr.contains(listHomestay.get(rand))) {
                continue;
            } else {
                arr.add(listHomestay.get(rand));
            }
        }
        System.out.println(regService.findDate().get(0).getDate_finished());
        mm.addAttribute("homestay", arr);
        mm.addAttribute("location", locationService.findAll());

        List<Booking> bookings = bookingService.getAllBooking();
        Map<Integer, Integer> maps = new HashMap<>();
        for(Booking booking : bookings) {
            if(!maps.containsKey(booking.getRoom_id())) {
                maps.put(booking.getRoom_id(), 1);
            } else {
                maps.put(booking.getRoom_id(), maps.get(booking.getRoom_id()) + 1);
            }
        }
        List<Integer> listRoom = new ArrayList<>();
        List<Room> listBestRoom = new ArrayList<>();
        maps.forEach((k,v)->
                        listRoom.add(k)
                );
        Collections.sort(listRoom);
        Collections.reverse(listRoom);
        ;
        listRoom.subList(0,4).forEach((i) ->
                listBestRoom.add(roomService.getOne(i))

        );
        System.out.println(Calendar.getInstance().getTime());
        mm.addAttribute("room",listBestRoom);
        return "index";
    }

}
