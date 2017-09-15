package ru.javarest_api.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.javarest_api.service.UserService;

@Controller
public class UserRestController {

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String root() {
        return "index";
    }
    @GetMapping("/users")

    public String users(Model model) {
        model.addAttribute("users", userService.getAll());
        return "users";
    }
}
