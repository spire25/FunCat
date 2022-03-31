package team4.login.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import team4.md.domain.Member;
import team4.md.service.LoginService;

@Log4j
@RestController
@RequestMapping("/user")
public class LoginRestController {
	@Autowired
	private LoginService loginService;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginRestController.class);
	
	@PostMapping(value="signup")
	public String signup(@RequestBody Member member) {
		log.info("#LoginController signup() member: "+ member);
		member.setMember_pw(new BCryptPasswordEncoder().encode(member.getMember_pw())); 
		loginService.signupS(member);
		String str = "success";
		return str;
	}
	
	
}
