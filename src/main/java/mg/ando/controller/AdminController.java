package mg.ando.controller;

import java.time.LocalDateTime;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.ui.Model;

import mg.ando.dao.HibernateDao;
import mg.ando.model.Admin;
import mg.ando.model.Element;

@Controller
public class AdminController {

    @Autowired
    HibernateDao dao;

    @GetMapping("/loginAdmin")
    public String login() {
        return "loginAdmin";
    }

    @GetMapping("/admin")
    public String admin(Model model) throws Exception {
        List<Element> listPublications = dao.selectFavoris();
        listPublications.addAll(dao.selectNotFavoris());
        model.addAttribute("listPublications", listPublications);
        return "admin";
    }

    @PostMapping("/verifLoginAdmin")
    public String verifLogin(Model model, String email, String mdp) throws Exception {
        Admin admin = (Admin) dao.login(Admin.class, email, mdp);
        if (admin == null) {
            return "loginAdmin";
        }
        model.addAttribute("listPublications", dao.selectNonPubliees(Element.class));
        return "admin";
    }

    @GetMapping("/publicationsNonPubliees")
    public String publicationsNonPubliees(Model model) throws Exception {
        model.addAttribute("listPublications", dao.selectNonPubliees(Element.class));
        return "admin";
    }

    @GetMapping("/publierPublication")
    public String publier(Model model, String dateP, int id) throws Exception {
        Element element = dao.findById(Element.class, id);
        LocalDateTime date = LocalDateTime.parse(dateP);
        element.setStatut(1);
        element.setDate_publication(date);
        dao.update(element);
        model.addAttribute("listPublications", dao.selectNonPubliees(Element.class));

        return "admin";
    }

    @GetMapping("/favories")
    public String getFavories(Model model) throws Exception {
        model.addAttribute("listPublications", dao.selectFavoris());
        return "admin";
    }

    @GetMapping("/parametres")
    public String parametres() {
        return "parametres";
    }

}
