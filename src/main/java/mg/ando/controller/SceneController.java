package mg.ando.controller;

import java.sql.Date;
import mg.ando.dao.HibernateDao;
import mg.ando.model.Scene;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SceneController {

	@Autowired
    public HibernateDao dao;
	
	@GetMapping("/planifier")
	public String plannifierScenes(@RequestParam String id,@RequestParam String dateplanning) {
		Scene tmp = dao.findById(Scene.class, Integer.parseInt(id));
		tmp.setDateplanification(Date.valueOf(dateplanning));
		
		dao.updateScene(tmp);
		System.out.println("---------------------------------");
		System.out.println(tmp.toString());
		System.out.println("---------------------------------");
		
		return "redirect:/films";
	}
	
}
