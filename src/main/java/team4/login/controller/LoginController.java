package team4.login.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import team4.md.domain.Member;

@Log4j
@RestController
@RequestMapping("/user")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping("login.do")
	public ModelAndView login(Locale locale, Model model) {
		//log.info("#LoginController login()");
		ModelAndView mv = new ModelAndView("user/login");
		return mv;
	}
	
	@RequestMapping("signup.do")
	public ModelAndView signup() {
		//log.info("#LoginController signup()");
		ModelAndView mv = new ModelAndView("user/signup");
		return mv;
	}
	
	
	@PostMapping("login")
	public void login(@RequestBody Member member) {
		log.info("#LoginController login() member(id, pw): "+ member);
//		ModelAndView mv = new ModelAndView("../");
//		return mv;
	}
	
	@PostMapping("signup")
	public void signup(Member member) {
		log.info("#LoginController signup() member: "+ member);
//		ModelAndView mv = new ModelAndView("user/login");
//		return mv;
	}
	
	
}