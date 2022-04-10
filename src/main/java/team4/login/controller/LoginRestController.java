package team4.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import team4.md.domain.Member;
import team4.md.service.LoginService;
import static team4.md.model.LoginConst.*;

@Log4j
@RestController
@RequestMapping("/user")
public class LoginRestController {
	@Autowired
	private LoginService loginService;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginRestController.class);
	
	@PostMapping(value="signup")
	public String signup(@RequestBody Member member) {
		//log.info("#LoginController signup() member: "+ member);
		loginService.signupS(member);
		String str = "success";
		return str;
	}
	
	@PostMapping(value="login")
	@ResponseBody
	public Object login(Member member, HttpServletRequest request) {
		log.info("#LoginController login() member: "+ member);
		
		HttpSession session = request.getSession();
		if(session.getAttribute("user") != null) {
			session.removeAttribute("user");
		}
		
		int result = loginService.loginS(member);
		
		if(result == CORRECT_ID_PWD) {
			Member user = loginService.getUserS(member);
			System.out.println("controller-- user: "+user);
			session.setAttribute("user", user);
		}
		
		return result;
	}
	
	@PostMapping("idcheck")
	@ResponseBody
	public Member idcheck(@RequestParam("member_id") String member_id) {
		log.info("idcheck"+member_id);
		log.debug("idcheck"+member_id);
		Member result = loginService.selectByIdS(member_id);
		return result;
	}
	
	@PostMapping("namecheck")
	@ResponseBody
	public Member namecheck(@RequestParam("member_name") String member_name) {
		Member result = loginService.selectByNameS(member_name);
		return result;
	}
	
	@PostMapping("findPw")
	public void findPw(Member member, HttpServletResponse response) {
		log.info("#LoginRestController forgetPw() log");
		System.out.println("#LoginRestController forgetPw() print member: "+member);
		loginService.findPw(member, response);
		//response.sendRedirect("login.do");
	}
	
	@PostMapping("findEmail")
	public void findEmail(Member member, HttpServletResponse response) {
		log.info("#LoginRestController findEmail() log");
		System.out.println("#LoginRestController findEmail() print member: "+member);
		loginService.findEmail(member, response);
		//response.sendRedirect("login.do");
	}
}
