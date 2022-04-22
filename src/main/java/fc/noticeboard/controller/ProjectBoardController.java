package fc.noticeboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import fc.noticeboard.domain.ProjectBoardVO;
import fc.noticeboard.service.ProjectBoardService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller	
@RequestMapping("/project")
public class ProjectBoardController {
/*
	@Autowired
	private ProjectBoardService service;
	*/
	
	@GetMapping("/plist")
    // => @RequestMapping(value="list", method=RequestMethod.GET)
    public void ProjectboardListGET() {
        
        log.info("프로젝트 목록 페이지 진입");
        
    }
    
    @GetMapping("/penroll")
    // => @RequestMapping(value="enroll", method=RequestMethod.GET)
    public void ProjectboardPenrollGET() {
        
        log.info("프로젝트 등록 페이지 진입");
        
    }
    
    /* 게시판 등록 */
    @PostMapping("/penroll")
    public void boardPenrollPOST(ProjectBoardVO pr) {
        
        log.info("ProjectBoardVO : " + pr);	
        
    }
}