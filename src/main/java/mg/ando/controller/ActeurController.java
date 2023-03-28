package mg.ando.controller;

import java.sql.Date;
import mg.ando.dao.HibernateDao;
import mg.ando.model.Film;
import mg.ando.model.IndisponibiliteActeur;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ActeurController {

	@Autowired
	public HibernateDao dao;

	@GetMapping("/indispoActeur")
	public String indispoActeur(Model model, @RequestParam Integer idActeur, @RequestParam String dateDebut) {
		dao.create(new IndisponibiliteActeur(idActeur, Date.valueOf(dateDebut)));
		model.addAttribute("films", dao.findAll(Film.class));
		model.addAttribute("page", "components/films");
		model.addAttribute("dao", dao);
		return "index";
	}

}
