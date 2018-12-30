package com.tmdt.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TestDate {
    public static void main(String[] args) throws Exception {
        String sDate = "12/07/2017";
        Date date = new SimpleDateFormat("dd/MM/yyyy").parse(sDate);
        System.out.println(sDate + "\t" + date);
        System.out.println(date.getDay() +"/"+date.getMonth()+"/"+date.getYear());
    }
}
