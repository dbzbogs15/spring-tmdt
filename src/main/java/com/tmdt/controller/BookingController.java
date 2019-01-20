package com.tmdt.controller;

import com.tmdt.model.Booking;
import com.tmdt.model.Users;
import com.tmdt.service.BookingService;
import com.tmdt.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

@Controller
public class BookingController {
    @Autowired
    RoomService roomService;

    @Autowired
    BookingService bookingService;

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

    @RequestMapping(value = "/booking/success")
    public String success(@RequestParam(value = "customer_fullname") String customer_fullname,
                          @RequestParam(value = "customer_phone") String customer_phone,
                          @RequestParam(value = "customer_address") String customer_address,
                          @RequestParam(value = "customer_email") String email,
                          @RequestParam(value = "booking_price") String booking_price,
                          @RequestParam(value = "check_in") String check_in,
                          @RequestParam(value = "check_out") String check_out,
                          @RequestParam(value = "room_id") String room_id,
                          HttpSession session) throws Exception {
        System.out.println(customer_fullname);
        System.out.println(customer_phone);
        System.out.println(customer_address);
        System.out.println(email);
        System.out.println(booking_price);
        String c1 = check_in.replace("/", "-");
        String c2 = check_out.replace("/", "-");
        System.out.println(c1);
        Date c_in = new SimpleDateFormat("MM-dd-yyyy").parse(c1);
        Date c_out = new SimpleDateFormat("MM-dd-yyyy").parse(c2);
        Booking booking = new Booking();
        booking.setBooking_price(Integer.parseInt(booking_price));
        booking.setBooking_status(2);
        booking.setCheck_in(c_in);
        booking.setCheck_out(c_out);
        booking.setCreated(new Date());
        booking.setCustomer_phone(customer_phone);
        booking.setRoom_id(Integer.parseInt(room_id));
        Users u = (Users) session.getAttribute("user");
        booking.setUser_name(u.getUser_name());
        bookingService.save(booking);
        return "booking-success";
    }

    @RequestMapping("/booking/history")
    public String history(ModelMap mm, HttpSession session) {
        if (session.getAttribute("user") == null) {
            return "redirect:/login";
        }
        Users u = (Users) session.getAttribute("user");
        List<Booking> booking = bookingService.getBookingByUser(u.getUser_name());
        mm.addAttribute("booking", booking);
        return "history-booking";
    }

    @GetMapping("/booking/ad")
    public String ad_booking(ModelMap mm, HttpSession session) {
        List<Booking> list = new ArrayList<>();
        Users u = (Users) session.getAttribute("user");
        for (Booking k : bookingService.getAllBooking()) {
            if (k.getRoom().getHomestay().getUsers().getUser_name().equals(u.getUser_name())) {
                list.add(k);
            }
        }
        mm.addAttribute("list", list);
        return "yeu_cau_dat_phong";
    }

    @GetMapping("booking/ad/edit/{id}")
    public String edit(@PathVariable int id, ModelMap mm) {
        mm.addAttribute("booking", bookingService.getBookById(id));
        Booking b = bookingService.getBookById(id);
        List<Booking> allBooking = bookingService.getAllBooking();
        int i = 0;
        for(Booking count : allBooking) {
            if(count.getUsers().getUser_name().equals(b.getUsers().getUser_name())) {
                i++;
            }
        }
        mm.addAttribute("count", i);
        return "xac_nhan_dat_phong";
    }

    @PostMapping("booking/ad/edit/{id}")
    public String edited(ModelMap mm, WebRequest wr, @PathVariable int id) throws Exception{
        Booking b = bookingService.getBookById(id);
        int status = Integer.parseInt(wr.getParameter("status"));
        System.out.println(status + "Trạng Thánhs");
        String d1 = wr.getParameter("fdate");
        System.out.println(d1);
        String d2 = wr.getParameter("sdate");
        Date fDate = new SimpleDateFormat("yyyy-MM-dd").parse(d1);
        Date sDate = new  SimpleDateFormat("yyyy-MM-dd").parse(d2);
        String customer_fullname = wr.getParameter("fullname");
        String customer_phone = wr.getParameter("phone");
        int price = Integer.parseInt(wr.getParameter("price"));
        b.setBooking_status(status);
        b.setCheck_in(fDate);
        b.setCheck_out(sDate);
        b.setCustomer_fullname(customer_fullname);
        b.setCustomer_phone(customer_phone);
        b.setBooking_price(price);
        bookingService.updateBookinf(b);
        return "redirect:/booking/ad";
    }

    @GetMapping("/booking/edit_booking")
    public String edit_booking(@RequestParam int id, ModelMap mm) {
        Booking booking = bookingService.getBookById(id);
        mm.addAttribute("booking", booking);
        return "edit_booking";
    }

    @PostMapping("/booking/edit_booking")
    public String edited_booking(@RequestParam int id_booking, WebRequest wr,
                                 RedirectAttributes redirectAttributes) throws ParseException {
        Booking booking = bookingService.getBookById(id_booking);
        String customer_name = wr.getParameter("customer_name");
        String phone = wr.getParameter("phone");
        String address = wr.getParameter("address");
        String d1 = wr.getParameter("check_in");
        String d2 = wr.getParameter("check_out");
        int price = Integer.parseInt(wr.getParameter("price"));
        System.out.println(d1);
        Date fDate = new SimpleDateFormat("MM/dd/yyyy").parse(d1);
        Date sDate = new  SimpleDateFormat("MM/dd/yyyy").parse(d2);
        booking.setCustomer_fullname(customer_name);
        booking.setCustomer_phone(phone);
        booking.setCustomer_address(address);
        booking.setBooking_price(price);
        booking.setCheck_in(fDate);
        booking.setCheck_out(sDate);

        bookingService.save(booking);
        redirectAttributes.addFlashAttribute("message", "Thay đổi thông tin đăt phòng thành công!!");
        return "redirect:/booking/history";
    }

    @GetMapping("/booking/cancel_booking")
    public String cancel(@RequestParam int booking_id, RedirectAttributes r) {
        Booking booking = bookingService.getBookById(booking_id);
        booking.setBooking_status(3);
        bookingService.save(booking);
        r.addFlashAttribute("message", "Hủy đặt phòng thành công!");
        return "redirect:/booking/history";
    }
}
