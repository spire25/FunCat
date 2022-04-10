package team4.login.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import team4.md.domain.Member;
import team4.md.service.LoginService;

@Log4j
@Controller
@RequestMapping("/user")
public class LoginController {
	@Autowired
	private LoginService loginService;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@GetMapping("login.do")
	public String login(Locale locale, Model model) {
		//log.info("#LoginController login()");
		//ModelAndView mv = new ModelAndView("user/login");
		//return mv;
		return "user/login";
	}
	
	@GetMapping("signup.do")
	public String signup() {
		//log.info("#LoginController signup()");
		//ModelAndView mv = new ModelAndView("user/signup");
		//return mv;
		return "user/signup";
	}
	
	@GetMapping("logout.do")
	public void logout(HttpSession session, HttpServletResponse response) throws IOException {
		session.removeAttribute("user");
		response.sendRedirect("login.do");
	}
	
	@GetMapping("findPw.do")
	public String findPw() {
		log.info("#LoginController findPw() log");
		System.out.println("#LoginController findPw() print");
		
		return "user/findPw";
	}
	
	@GetMapping("findEmail.do")
	public String findEmail() {
		log.info("#LoginController findEmail() log");
		System.out.println("#LoginController findEmail() print");
		
		return "user/findEmail";
	}
	

	
	
	
//	@PostMapping("login")
//	public Object login(@RequestParam("member_id") String member_id, @RequestParam("member_pw") String member_pw) {
//		log.info("#LoginController login()__ member(id, pw): "+ member_id +", "+member_pw);
////		ModelAndView mv = new ModelAndView("../");
//		Object result = 0;
//		return result;
//	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/vip")
	public String vip() {
		log.info("#LoginController  vip() ");
		return "vip";
	}
	
	@RequestMapping("/admin")
	public String admin() {
		log.info("#LoginController  admin() ");
		return "admin";
	}
}
