package team4.login.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView login(Locale locale, Model model) {
		//log.info("#LoginController login()");
		ModelAndView mv = new ModelAndView("user/login");
		return mv;
	}
	
	@GetMapping("signup.do")
	public ModelAndView signup() {
		//log.info("#LoginController signup()");
		ModelAndView mv = new ModelAndView("user/signup");
		return mv;
	}
	
	
//	@PostMapping("login")
//	public void login(@RequestParam("member_id") String member_id, @RequestParam("member_pw") String member_pw) {
//		log.info("#LoginController login()__ member(id, pw): "+ member_id +", "+member_pw);
////		ModelAndView mv = new ModelAndView("../");
////		return mv;
//	}
	
	@GetMapping("../")
	
	
	
	
	
	
	
	
	
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
