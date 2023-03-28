package mg.ando.controller;

import mg.ando.dao.HibernateDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class SceneController {

	@Autowired
    public HibernateDao dao;
	
}
