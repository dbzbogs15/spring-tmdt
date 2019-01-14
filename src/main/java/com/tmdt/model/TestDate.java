package com.tmdt.model;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.stream.Collectors;

public class TestDate {
    public static void main(String[] args) throws Exception {
        Map<Integer, Integer> maps = new HashMap<Integer, Integer>();
        maps.put(1,5);
        maps.put(2,2);
        LinkedHashMap<Integer, Integer> sortedMap =
                maps.entrySet().stream().
                        sorted(Map.Entry.comparingByValue()).
                        collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue,
                                (e1, e2) -> e1, LinkedHashMap::new));
        for(Map.Entry<Integer, Integer> loop : sortedMap.entrySet()) {
            System.out.println("Key->" + loop.getKey() + "Value->" + loop.getValue());
        }
    }
}
