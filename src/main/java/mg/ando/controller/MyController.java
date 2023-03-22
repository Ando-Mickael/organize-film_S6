package mg.ando.controller;

import java.sql.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import mg.ando.dao.HibernateDao;
import mg.ando.model.Acteur;
import mg.ando.model.Auteur;
import mg.ando.model.DetailsScene;
import mg.ando.model.Film;
import mg.ando.model.IndisponibiliteActeur;
import mg.ando.model.IndisponibilitePlateau;
import mg.ando.model.Plateau;
import mg.ando.model.Scene;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyController {

    @Autowired
    public HibernateDao dao;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/agenda")
    public String agenda(Model model, @RequestParam String idFilm) {
        model.addAttribute("scenes", dao.selectAgendaFilm(idFilm));
        model.addAttribute("page", "components/agenda");
        model.addAttribute("dao", dao);
        
        return "index";
    }

    @GetMapping("/films")
    public String films(Model model) {
        model.addAttribute("films", dao.findAll(Film.class));
        model.addAttribute("page", "components/films");
        model.addAttribute("dao", dao);
		dao.create(new IndisponibilitePlateau(1, Date.valueOf("2022-05-05")));
        return "index";
    }

    @GetMapping("/organiser")
    public String organiser(Model model) {
        model.addAttribute("page", "components/organiser");
        model.addAttribute("films", dao.findAll(Film.class));
        return "index";
    }

    @GetMapping("/scenes")
    public String scenes(Model model, @RequestParam int idFilm) throws Exception {
        model.addAttribute("scenes", dao.selectSceneFilm(Scene.class, idFilm));
        model.addAttribute("page", "components/scenes");
        model.addAttribute("dao", dao);
        return "index";
    }

    @GetMapping("/detailsScene")
    public String detailsScene(Model model, @RequestParam int idScene) throws Exception {
        model.addAttribute("detailsScene", dao.selectSceneDetail(DetailsScene.class, idScene));
        model.addAttribute("page", "components/detailsScene");
        model.addAttribute("dao", dao);
        return "index";
    }
    
    @GetMapping("/disponibilite")
    public String disponibilite(Model model) {
        model.addAttribute("plateaux", dao.findAll(Plateau.class));
        model.addAttribute("acteurs", dao.findAll(Acteur.class));
        model.addAttribute("page", "components/disponibilite");
        model.addAttribute("dao", dao);
        
        return "index";
    }
    
    @GetMapping("/indispoActeur")
    public String indispoActeur(Model model, @RequestParam Integer idActeur, @RequestParam String dateDebut) {
		dao.create(new IndisponibiliteActeur(idActeur, Date.valueOf(dateDebut)));
        return "index";
    }
    
    @GetMapping("/indispoPlateau")
    public String indispoPlateau(Model model, @RequestParam Integer idPlateau, @RequestParam String dateDebut) {
        dao.create(new IndisponibilitePlateau(idPlateau, java.sql.Date.valueOf(dateDebut)));
        return "index";
    }

}
