package team4.md.service;

import java.util.ArrayList;

import team4.md.domain.Member;

public interface LoginService {
	void signupS(Member member);
	Member selectByIdS(String member_id);
	ArrayList<Member> selectAllS();
}
