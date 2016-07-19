package com.courage.accountmanage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by courage on 2016/7/16.
 */

@Controller
public class mainCtr {

    @RequestMapping("/")
    public ModelAndView index(){
        ModelAndView mv = new ModelAndView("accountManage");
        return mv;
    }
}
