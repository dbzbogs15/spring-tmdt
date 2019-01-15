package com.tmdt.model;

import java.util.*;
import java.util.stream.Collectors;

public class TestDate {
    public static void main(String[] args) throws Exception {
        List<Integer> list = new ArrayList<>();
        list.add(5);
        list.add(3);
        list.add(4);
        Collections.sort(list);
        Collections.reverse(list);
        System.out.println(list);
    }
}
