package team4.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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
	
//	@GetMapping("list")
//	@ResponseBody
//	public ArrayList<Project> list() {
//		logger.info("projectController logger test");
//		
//		ArrayList<Project> projectList = projectService.listS();
//		return projectList;
//	}
	
	// 제목 검색
	@GetMapping("search")
	public ModelAndView search(String search_sub) {
		logger.info("#projectController search()");
		
		ArrayList<Project> searchList = projectService.searchListS(search_sub);
	
		ModelAndView mv = new ModelAndView("/project/list", "searchList", searchList);
	
		return mv;
	}
	
	// 카테고리
	@GetMapping("category")
	public ModelAndView category(String category) {
		logger.info("#projectController category()");
		
		ArrayList<Project> categoryList = projectService.categoryListS(category);
		
		ModelAndView mv = new ModelAndView("/project/list", "categoryList", categoryList);
		return mv;
	}

}
