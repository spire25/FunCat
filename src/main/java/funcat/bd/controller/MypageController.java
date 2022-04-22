package funcat.bd.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import funcat.bd.domain.Mypage;
import funcat.bd.service.MypageService;
import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/member")
@AllArgsConstructor
public class MypageController {
	@Autowired
	private MypageService mypageService;
	
	//로그인
	
	//프로젝트 상세페이지
	@GetMapping("/detail.do")
	public ModelAndView detail(long project_num) {
		Mypage project = new Mypage();
		project.setProject_num(project_num);
		
		Mypage mypage = mypageService.projectForm(project);
		List<Mypage> reward = mypageService.reward(project);
		
		ModelAndView mv = new ModelAndView("mypage/detail");
		mv.addObject("mypage", mypage); 
		mv.addObject("reward", reward);
		return mv; 

	}

	//마이페이지 조회
	@GetMapping("/list.do")
	public ModelAndView list(String member_id) {
		Mypage mypageParam = new Mypage();
		mypageParam.setMember_id(member_id);
		
		Mypage mypage = mypageService.list(mypageParam);
		List<Mypage> orderList = mypageService.getMyOrderlist(mypageParam);	
		
		ModelAndView mv = new ModelAndView("mypage/list");
		mv.addObject( "mypage", mypage);
		mv.addObject( "orderList", orderList);
		return mv;	
	}
	
	//마이페이지 수정 폼
	@GetMapping("/update.do")
	public ModelAndView update(String member_id) {
		Mypage mypageParam = new Mypage();
		mypageParam.setMember_id(member_id);
		Mypage mypage = mypageService.getMypage(mypageParam);
		ModelAndView mv = new ModelAndView("mypage/update", "mypage", mypage);
		return mv;
	}
	
	//마이페이지 수정
	@PostMapping("/myUpdate.do")
	@ResponseBody
	public String update(Mypage mypage) {
		mypageService.update(mypage);
		return "ok";
	}
	
	//내 주문 취소
	@GetMapping("orderDel.do")
	@ResponseBody
	public String orderDelete(long order_num, String member_id) {
		mypageService.orderDelete(order_num);
		return "ok";
	}
	
	//크리에이터 신청
	@GetMapping("/applyCreatorForm.do")
	public ModelAndView applyCreatorForm(String member_id) {
		Mypage mypageParam = new Mypage();
		mypageParam.setMember_id(member_id);	
		Mypage mypage = mypageService.applyCreatorForm(mypageParam);
	    ModelAndView mv = new ModelAndView("mypage/applyCreatorForm");
		mv.addObject("mypage", mypage);
		return mv;
	}
	
	@PostMapping("applyCreator.do")
	@ResponseBody
	public String applyCreator(Mypage mypage) {
		mypageService.applyCreator(mypage);
		return "ok";
	}
	
	//크리에이터 조회
	@GetMapping("/creator.do")
	public ModelAndView creator(String member_id) {
		Mypage mypageParam = new Mypage();
		mypageParam.setMember_id(member_id);
		
		Mypage mypage = mypageService.getCreator(mypageParam);
		List<Mypage> projectlist = mypageService.getProjectlist(mypageParam);	
		
		ModelAndView mv = new ModelAndView("mypage/creator");
		mv.addObject( "mypage", mypage);
		mv.addObject( "projectlist", projectlist);
		return mv;	
	}
	
	@GetMapping("/creatordetail.do")
	public ModelAndView creatordetail(long creator_num) {
		Mypage mypageParam = new Mypage();
		mypageParam.setCreator_num(creator_num);
		Mypage mypage = mypageService.getCreatordetail(mypageParam);
		ModelAndView mv = new ModelAndView("mypage/creatordetail", "mypage", mypage);
		return mv;
	}
	
	@PostMapping("/creatordetailupdate.do")
	@ResponseBody
	public String creatorUpdate(Mypage mypage) {
		mypageService.creatorUpdate(mypage);
		return "ok";
	}
	
	//내 프로젝트 조회
	@GetMapping("/projectdetail.do")
	public ModelAndView projectdetail(long project_num) {
		Mypage mypageParam = new Mypage();
		mypageParam.setProject_num(project_num);
		Mypage mypage = mypageService.getProjectdetail(mypageParam);
		ModelAndView mv = new ModelAndView("mypage/projectdetail", "mypage", mypage);
		return mv;
	}
	
	//내 프로젝트 수정
	@PostMapping("/projectdetailupdate.do")
	@ResponseBody
	public String projectupdate(Mypage mypage) {
		long miliseconds = System.currentTimeMillis();
        Date date = new Date(miliseconds);
		mypage.setProject_mdate(date);
		mypageService.projectupdate(mypage);
		return "ok";
	}
	
	//내 프로젝트 삭제
	@GetMapping("del.do")
	@ResponseBody
	public String delete(long project_num, String member_id) {
		mypageService.delete(project_num);
		return "ok";
	}
}
