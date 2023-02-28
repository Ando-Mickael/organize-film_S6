package mg.ando.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import mg.ando.dao.HibernateDao;
import mg.ando.model.Element;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyController {

    @Autowired
    HibernateDao dao;

    @GetMapping("/test")
    public String test() {
        return "test";
    }

    @GetMapping("/logout")
    public String logout() {
        return "page2connexion";
    }

    //
    @GetMapping("/pubs")
    public String getPubs(Model model) throws Exception {
        model.addAttribute("listeElement", dao.selectWpagination(Element.class, 0, 4));
        return "publications";
    }

}
