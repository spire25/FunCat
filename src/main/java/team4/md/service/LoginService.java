package team4.md.service;

import java.util.ArrayList;

import team4.md.domain.Member;

public interface LoginService {
	void signupS(Member member);
	Member selectByIdS(String member_id);
	Member selectByNameS(String member_name);
	ArrayList<Member> selectAllS();
	int idCheckS(String member_id);
	
	int loginS(Member member);
	Member getUserS(Member member);
}
