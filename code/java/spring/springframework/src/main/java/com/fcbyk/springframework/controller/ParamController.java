package com.fcbyk.springframework.controller;

import com.fcbyk.springframework.bean.Book;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;

// #region index
@Controller
@ResponseBody
public class ParamController {

    // http://localhost/commonParamDifferentName?name=张三&age=18
    // 当形参与地址参数名不一致时，使用@RequestParam注解
    @RequestMapping("/commonParamDifferentName")
    public String commonParamDifferentName(@RequestParam("name") String userName , int age){
        return userName + age;
    }

    // http://localhost/pojoParam?name=三国&price=18
    //POJO参数：请求参数与形参对象中的属性对应即可完成参数传递
    @RequestMapping("/pojoParam")
    public Book pojoParam(Book book){
        return book;
    }

    // http://localhost/arrayParam?likes=打球&likes=画画
    //数组参数：同名请求参数可以直接映射到对应名称的形参数组对象中
    @RequestMapping("/arrayParam")
    public String arrayParam(String[] likes){
        return Arrays.toString(likes);
    }

    //集合参数：同名请求参数可以使用@RequestParam注解映射到对应名称的集合对象中作为数据
    @RequestMapping("/listParam")
    public String listParam(List<String> likes){
        return likes.toString();
    }

    // 需添加jackson依赖 + 配置类添加@EnableWebMvc
    // 使用@RequestBody注解将外部传递的json数组数据映射到形参的集合对象中作为数据
    @RequestMapping("/listParamForJson")
    public String listParamForJson(@RequestBody List<String> likes){
        return likes.toString();
    }
}
// #endregion index