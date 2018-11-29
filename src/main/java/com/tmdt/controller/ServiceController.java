package com.tmdt.controller;

import com.tmdt.service.BuyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ServiceController {

    @Autowired
    BuyService buyService;

    @RequestMapping("/service")
    public String service(ModelMap mm) {
        mm.addAttribute("service",buyService.getAllService());
        return "service";
    }
}
