package mg.ando.controller;

import mg.ando.dao.HibernateDao;
import mg.ando.model.Film;
import mg.ando.model.IndisponibilitePlateau;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PlateauController {

	@Autowired
    public HibernateDao dao;
	
	@GetMapping("/indispoPlateau")
    public String indispoPlateau(Model model, @RequestParam Integer idPlateau, @RequestParam String dateDebut) {
        dao.create(new IndisponibilitePlateau(idPlateau, java.sql.Date.valueOf(dateDebut)));
		model.addAttribute("films", dao.findAll(Film.class));
        model.addAttribute("page", "components/films");
        model.addAttribute("dao", dao);
        return "index";
    }
	
}
