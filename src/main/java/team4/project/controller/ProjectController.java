package team4.project.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;
import team4.md.domain.Project;
import team4.md.service.ProjectService;

@Log4j
@RestController
@RequestMapping("/project")
public class ProjectController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@Autowired
	ProjectService projectService;
	
	@GetMapping("list")
	@ResponseBody
	public ArrayList<Project> list() {
		logger.info("projectController logger test");
		
		ArrayList<Project> projectList = projectService.listS();
		return projectList;
	}
}
