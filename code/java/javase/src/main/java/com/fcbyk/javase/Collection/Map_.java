package com.fcbyk.javase.Collection;

import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.Map;

public class Map_ {

    @Test
    public void map(){
        // #region map
        Map<String, Integer> studentMap = new HashMap<>();

        studentMap.put("Alice", 101);
        studentMap.put("Bob", 102);
        studentMap.put("Charlie", 103);

        int num = studentMap.get("Bob");

        boolean containsKey = studentMap.containsKey("Alice");
        boolean containsValue = studentMap.containsValue(104);

        studentMap.remove("Charlie");

        System.out.println(studentMap);

        for (Map.Entry<String, Integer> entry : studentMap.entrySet()) ;

        studentMap.clear();
        // #endregion map
    }
}
