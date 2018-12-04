package com.tmdt.controller;

import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import com.tmdt.config.PaypalPaymentIntent;
import com.tmdt.config.PaypalPaymentMethod;
import com.tmdt.model.RegisterService;
import com.tmdt.model.Users;
import com.tmdt.service.BuyService;
import com.tmdt.service.HomestayService;
import com.tmdt.service.PaypalService;
import com.tmdt.service.RegService;
import com.tmdt.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
public class ServiceController {

    public static final String URL_PAYPAL_SUCCESS = "pay/success";
    public static final String URL_PAYPAL_CANCEL = "pay/cancel";

    @Autowired
    BuyService buyService;

    @Autowired
    PaypalService paypalService;

    @Autowired
    RegService regService;

    @Autowired
    HomestayService homestayService;

    @RequestMapping("/service")
    public String service(ModelMap mm, HttpSession session) {
        Users u = (Users) session.getAttribute("user");
        System.out.println(u.getUser_name());
        List<RegisterService> list = new ArrayList<>();
        for(RegisterService r : regService.findAll()) {
            if(r.getHomestay().getUsers().getUser_name().equals(u.getUser_name())) {
                list.add(r);
            }
        }
        mm.addAttribute("homestay", homestayService.getHomestayByUser(u.getUser_name()));
        mm.addAttribute("reg", list);
        mm.addAttribute("service",buyService.getAllService());
        return "service";
    }

    @GetMapping("service/pay")
    public String buy(HttpServletRequest request, @RequestParam("price") double price,
                      @RequestParam("service_id") int service_id, HttpSession session,
                      @RequestParam("homestay_id") int homestay_id) {
        session.setAttribute("current_service", service_id);
        session.setAttribute("current_homestay", homestay_id);
        String cancelUrl = Utils.getBaseURL(request) + "/" + URL_PAYPAL_CANCEL;
        String successUrl = Utils.getBaseURL(request) + "/" + URL_PAYPAL_SUCCESS;

        try {
            Payment payment = paypalService.createPayment(price, "USD", PaypalPaymentMethod.paypal,
                    PaypalPaymentIntent.sale, "thanh toan", cancelUrl, successUrl);
            for(Links links : payment.getLinks()) {
                if(links.getRel().equals("approval_url")) {
                    return "redirect:" + links.getHref();
                }
            }
        } catch (PayPalRESTException e) {
            System.out.println(e.getMessage());
        }
        return "redirect:/";
    }
    @GetMapping(URL_PAYPAL_CANCEL)
    public String cancelPay() {
        return "cancel";
    }

    @GetMapping(URL_PAYPAL_SUCCESS)
    public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId,
                             HttpSession session) {
        try {
            Payment payment = paypalService.executePayment(paymentId, payerId);
            if (payment.getState().equals("approved")) {
                RegisterService r = new RegisterService();
                Users u = (Users) session.getAttribute("user");
                int homestay_id = (int) session.getAttribute("current_homestay");
                int service_id =(int) session.getAttribute("current_service");
                r.setHomestay_id(homestay_id);
                Calendar cal = Calendar.getInstance();
                r.setDate_started(cal.getTime());
                if(service_id == 0) {
                    cal.add(Calendar.MONTH, 1);
                    r.setDate_finished(cal.getTime());
                } else if(service_id == 1) {
                    cal.add(Calendar.MONTH, 6);
                    r.setDate_finished(cal.getTime());
                } else {
                    cal.add(Calendar.YEAR, 1);
                    r.setDate_finished(cal.getTime());
                }
                r.setService_id(service_id);
                r.setPrice(buyService.getById(service_id).getService_price());
                regService.add_regService(r);
                return "success";
            }
        } catch (PayPalRESTException e) {
            System.out.println(e.getMessage());
        }
        return "redirect:/";
    }
}
