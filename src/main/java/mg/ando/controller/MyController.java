package mg.ando.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import mg.ando.dao.HibernateDao;
import mg.ando.model.Acteur;
import mg.ando.model.DetailsScene;
import mg.ando.model.Film;
import mg.ando.model.Plateau;
import mg.ando.model.Scene;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyController {

	@Autowired
	public HibernateDao dao;

	@GetMapping("/films")
	public String films(Model model) {
		model.addAttribute("films", dao.findAll(Film.class));
		model.addAttribute("page", "components/films");
		model.addAttribute("dao", dao);

		return "index";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
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

	@GetMapping("/agenda")
	public String agenda(Model model, @RequestParam String idFilm) throws Exception {
		model.addAttribute("scenes", dao.selectAgendaFilm(idFilm));
		model.addAttribute("page", "components/agenda");
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
	
	@GetMapping("/addFilm")
	public String addFilm(@RequestParam String nom, @RequestParam String id) {
		Film film = dao.findById(Film.class, Integer.parseInt(id));
		film.setNom(nom);
		dao.update(film);
		
		System.out.println(film.toString());
		
		return "redirect:/films";
	}
}
