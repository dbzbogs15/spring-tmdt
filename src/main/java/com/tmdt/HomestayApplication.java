package com.tmdt;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@SpringBootApplication
public class HomestayApplication {

    public static void main(String[] args) {
        SpringApplication.run(HomestayApplication.class, args);
    }
}
