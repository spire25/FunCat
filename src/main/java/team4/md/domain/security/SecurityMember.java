package team4.md.domain.security;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import team4.md.domain.Member;

public class SecurityMember extends User{

	public SecurityMember(Member member) {
		super(
			member.getMember_id(), 
			member.getMember_pw(),
			AuthorityUtils.createAuthorityList(member.getMember_role())
		);
	}
}
