package ru.javarest_api.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserRestController {

    @GetMapping("/")
    public String root() {
        return "index";
    }

}
