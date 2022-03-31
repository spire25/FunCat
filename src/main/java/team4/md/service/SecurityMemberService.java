package team4.md.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import team4.md.domain.security.SecurityMember;
import team4.md.mapper.LoginMapper;

public class SecurityMemberService implements UserDetailsService{
	@Autowired
	LoginMapper loginMapper;

	@Override
	public UserDetails loadUserByUsername(String member_id) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		SecurityMember member = new SecurityMember(loginMapper.selectById(member_id));
		return member;
	}
	
	

}
