package team4.md.service;

import java.util.ArrayList;

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

	@Override
	public Member selectByIdS(String member_id) {
		Member member = loginMapper.selectById(member_id); 
		
		if(member == null) {
			
		}
		// null id 없음
		// null 아니면 pw 비교 -> 아

		return null;
	}

	@Override
	public ArrayList<Member> selectAllS() {
		// TODO Auto-generated method stub
		return null;
	}

}
