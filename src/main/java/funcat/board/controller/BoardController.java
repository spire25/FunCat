package funcat.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import funcat.board.domain.BoardVO;
import funcat.board.service.BoardService;

@Controller
@RequestMapping("funcat/community")
public class BoardController {
	@Autowired
	private BoardService boardservice;
	
	@GetMapping("/boardlist")
	public ModelAndView board() {		
		List<BoardVO> boardlist = boardservice.board();
		ModelAndView mv = new ModelAndView("board/list","boardlist", boardlist);
		return mv;
	}
	
	@GetMapping("/content")
	public ModelAndView content(Integer community_num) {
		BoardVO content = boardservice.content(community_num);
		ModelAndView mv = new ModelAndView("board/content","content", content);
		return mv;
	}
	@GetMapping("/content/delete") //삭제 실행창 뜨게 aJax 처리 해야됨
	public String delete(Integer community_num) {
		boardservice.delete(community_num);
		return "redirect:/funcat/community/boardlist";
	}
	
}
