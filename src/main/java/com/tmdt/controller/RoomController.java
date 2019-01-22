package com.tmdt.controller;

import com.tmdt.model.RegisterService;
import com.tmdt.model.Room;
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
        mm.addAttribute("reg", registerServices);
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
        mm.addAttribute("id_homestay", id);
        return "ad_room";
    }

    @GetMapping("/edit_room/{id}")
    public String editRoom(ModelMap mm, @PathVariable int id,
                           HttpSession session) {
        mm.addAttribute("room", roomService.getOne(id));
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

    @GetMapping("/add_room")
    public String formAddRoom(@RequestParam String homestay, ModelMap mm) {
        mm.addAttribute("id_homestay", homestay);
        return "addRoom";
    }

    @PostMapping("/add_room")
    public String saveRoom(WebRequest wr, @RequestParam(value = "room_image") MultipartFile commons,
                           RedirectAttributes rd, HttpServletRequest request) {
        int id_homestay = Integer.parseInt(wr.getParameter("id_homestay"));
        String room_name = wr.getParameter("room_name");
        String description = wr.getParameter("description");
        int price = Integer.parseInt(wr.getParameter("price"));
        int status = Integer.parseInt(wr.getParameter("status"));
        String info = wr.getParameter("info");
        String address = wr.getParameter("address");
        if (commons.isEmpty()) {
            rd.addFlashAttribute("message", "Vui lòng thêm ảnh homestay !");
            return "redirect:/room/add_room?homestay=" + id_homestay;
        }
        String nameFile = commons.getOriginalFilename();
        String root = "resources/room";
        String dirFile = request.getServletContext().getRealPath(root);
        Room room = new Room();
        room.setHomestay_id(id_homestay);
        room.setRoom_address(address);
        room.setRoom_del(1);
        room.setRoom_type(status);
        room.setRoom_information(info);
        room.setRoom_describe(description);
        room.setRoom_price(price);
        room.setRoom_name(room_name);

        try {
            roomService.updateRoom(room);
            List<Room> rooms = roomService.findAll();
            Room room1 = rooms.get(rooms.size() - 1);
            int id = room1.getRoom_id();
            String name = "room_" + id + "." + FilenameUtils.getExtension(nameFile);
            String newLink = dirFile + File.separator + name;
            commons.transferTo(new File(newLink));
            room1.setRoom_image("room/" + name);
            System.out.println("đã upload hình");
            roomService.updateRoom(room1);
        } catch (Exception r) {
            r.getStackTrace();
            rd.addFlashAttribute("message", "fail ảnh !");
            return "redirect:/room/add_room/" + id_homestay;
        }
        rd.addFlashAttribute("message", "Thêm phòng thành công!");
        return "redirect:/room/ad_room/" + id_homestay;
    }

    @GetMapping("/del_room")
    public String del_room(@RequestParam int id_homestay, @RequestParam int id_room,
                           RedirectAttributes rd) {
        Room room = roomService.getOne(id_room);
        room.setRoom_del(0);
        roomService.updateRoom(room);
        System.out.println("đã xóa");
        rd.addFlashAttribute("message", "Xóa phòng thành công!");
        return "redirect:/room/ad_room/" + id_homestay;
    }
}
