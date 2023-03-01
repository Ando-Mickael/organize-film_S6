package mg.ando.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import mg.ando.dao.HibernateDao;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyController {

    @Autowired
    HibernateDao dao;

    @GetMapping("/test")
    public String test() {
        return "index";
    }
    
    @GetMapping("/login")
    public String login() {
        return "login";
    }

}
