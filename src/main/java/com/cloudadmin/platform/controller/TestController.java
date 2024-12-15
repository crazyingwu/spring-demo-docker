package com.cloudadmin.platform.controller;

import com.cloudadmin.platform.service.RedisService;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
public class TestController {

    @Resource
    private RedisService redisService;

    @GetMapping("/test")
    public String test() {
        String value = redisService.getValue("hello");
        return StringUtils.hasText(value)? value : "nil";
    }
}
