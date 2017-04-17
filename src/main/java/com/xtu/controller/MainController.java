package com.xtu.controller;

import com.xtu.tools.OUT;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;

/**
 * Created by Ilovezilian on 2017/4/13.
 */
@Controller
public class MainController {

    @RequestMapping(value = {"/", "index"}, method = RequestMethod.GET)
    public String index(){
        OUT.prt("request:", "index");
        return "index";
    }

    @RequestMapping(value = {"/", "index"}, method = RequestMethod.POST)
    public String indexPost(@RequestPart("picture")byte[] profilePicture){
        OUT.prt("post:", "index");
        return "index";
    }

}
