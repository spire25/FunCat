package team4.md.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import team4.md.domain.Member;
import team4.md.mapper.LoginMapper;

@Log4j
@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginMapper loginMapper;

	@Override
	public void signupS(Member member) {
		log.info("#LoginServiceImpl signupS() member: "+ member);
		loginMapper.insert(member);
	}

}
