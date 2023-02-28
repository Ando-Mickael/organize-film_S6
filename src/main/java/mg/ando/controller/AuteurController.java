package mg.ando.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.http.HttpSession;

import mg.ando.dao.HibernateDao;
import mg.ando.model.Element;
import mg.ando.model.Auteur;

@Controller
public class AuteurController {

    @Autowired
    HibernateDao dao;

    @GetMapping("/loginAuteur")
    public String login() {
        return "loginAuteur";
    }

    @PostMapping("/verifLoginAuteur")
    public String verifLogin(Model model, HttpSession session, String email, String mdp) throws Exception {
        Auteur a = (Auteur) dao.login(Auteur.class, email, mdp);
        if (a != null) {
            model.addAttribute("listPublications", dao.selectWpagination(Element.class, 0, 4));
            session.setAttribute("id_auteur", a.getId());
            return "auteur";
        }
        return "loginAuteur";
    }
    
    @GetMapping("/auteur")
    public String auteur(Model model) throws Exception {
        List<Element> listPublications = dao.selectFavoris();
        listPublications.addAll(dao.selectNotFavoris());
        model.addAttribute("listPublications", listPublications);
        return "auteur";
    }

    @GetMapping("/publicationsByAuteur/{id_auteur}")
    public String getPublicationsByAuteur(@PathVariable String id_auteur, Model model) throws Exception {
        model.addAttribute("listPublications", dao.selectByAuteur(Integer.parseInt(id_auteur)));
        return "auteur";
    }

    @GetMapping("/formAddPublication")
    public String formAddPublication() {
        return "ajoutPublication";
    }

    @PostMapping("/addPublication")
    public String addPublication(String titre,
        String photo,
        String description,
        Date date_debut,
        Date date_fin,
        String type,
        LocalDateTime date_publication,
        Integer id_auteur) throws Exception {
        Element e = new Element(titre, photo, description, date_debut, date_fin, type, date_publication, id_auteur);
        if (dao.create(e) != null) {
            return "ajoutPublication";
        }
        return "ajoutPublication";
    }

    @GetMapping("/formUpdatePub/{id}")
    public String formUpdatePub(@PathVariable String id, Model model) {
        Element e = dao.findById(Element.class, Integer.parseInt(id));
        model.addAttribute("publication", e);

        return "modifierPublication";
    }

    @PostMapping("/updatePub")
    public String updatePub(String id, String titre, String photo, String description, Boolean favorie, Model model) throws Exception {
        Element e = dao.findById(Element.class, Integer.parseInt(id));
        e.setTitre(titre);
        e.setPhoto(photo);
        e.setDescription(description);
        dao.update(e);

        model.addAttribute("listeElement", dao.selectWpagination(Element.class, 0, 4));
        return "publications";
    }

    //
    @GetMapping("/paginate/{num_page}")
    public String pagination(Model model, @PathVariable Integer num_page) throws Exception {
        model.addAttribute("listeElement", dao.selectWpagination(Element.class, (num_page - 1) * 4, 4));
        return "publications";
    }

}
