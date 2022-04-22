package com.team4.FunCat;

import java.util.ArrayList;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import team4.md.domain.Project;
import team4.md.service.ProjectService;


@Controller
public class indexController {
	
	private static final Logger logger = LoggerFactory.getLogger(indexController.class);
	
	@Autowired
	ProjectService projectService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		ArrayList<Project> mainList = projectService.listS();
		ModelAndView mv = new ModelAndView("/index", "mainList", mainList);
		return mv;
	}
	
}
