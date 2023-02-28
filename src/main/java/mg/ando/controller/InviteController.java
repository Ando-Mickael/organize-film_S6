package mg.ando.controller;

import java.util.List;
import mg.ando.dao.HibernateDao;
import mg.ando.model.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class InviteController {

    @Autowired
    HibernateDao dao;
    
    @GetMapping("/invite")
    public String invite(Model model) throws Exception {
        List<Element> listPublications = dao.selectFavoris();
        listPublications.addAll(dao.selectNotFavoris());
        model.addAttribute("listPublications", listPublications);
        return "invite";
    }
    
    @PostMapping("/recherche")
    public String recherche(Model model, String recherche) throws Exception {
        model.addAttribute("listeElement", dao.selectWhere(Element.class, recherche));
        return "publications";
    }
    
}
