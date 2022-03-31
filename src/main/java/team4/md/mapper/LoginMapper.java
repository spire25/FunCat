package team4.md.mapper;

import java.util.ArrayList;

import team4.md.domain.Member;

public interface LoginMapper {
	void insert(Member member);
	Member selectById(String member_id);
	ArrayList<Member> selectAll();
}
