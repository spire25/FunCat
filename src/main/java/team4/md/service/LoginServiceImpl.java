package team4.md.service;

import java.util.ArrayList;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import team4.md.domain.Member;
import team4.md.mapper.LoginMapper;
import static team4.md.model.LoginConst.*;

@Log4j
@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginMapper loginMapper;
	
	// 회원가입
	@Override
	public void signupS(Member member) {
		log.info("#LoginServiceImpl signupS() member: "+ member);
		loginMapper.insert(member);
	}
	
	// id로 회원찾기
	@Override
	public Member selectByIdS(String member_id) {
		Member member = loginMapper.selectById(member_id); 
		return member;
	}
	
	// name으로 회원찾기
	@Override
	public Member selectByNameS(String member_name) {
		return loginMapper.selectByName(member_name);
	}

	@Override
	public ArrayList<Member> selectAllS() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int idCheckS(String member_id) {
		int cnt = loginMapper.idCheck(member_id);
		return cnt;
	}

	// 로그인 서비스
	@Override
	public int loginS(Member member) {
		String member_id = member.getMember_id();
		String member_pw = member.getMember_pw();
		
		Member member2 = loginMapper.selectById(member_id);
		
		if(member2 == null) {
			return NO_ID;
		} else {
			String dbPw = member2.getMember_pw();
			if(dbPw != null) dbPw.trim();
			
			if(dbPw.equals(member_pw)) {
				System.out.println("service ///////////////?   member  "+member);
				return CORRECT_ID_PWD; 
			} else {
				System.out.println("db pwd"+dbPw);
				System.out.println("pwd "+member_pw);
				log.info("dbow / member_pw: "+dbPw+" / "+ member_pw);
				return NO_PWD; 
			}
		}
	} // end of loginS()
	
	// user정보 pw제거
	@Override
	public Member getUserS(Member member) {
		String member_id = member.getMember_id();
		
		Member user = loginMapper.selectById(member_id);
		user.setMember_pw("");
		
		return user;
	}
	
	
	
	// email 전송
	public void sendEmail() {
		// Mail Server 설정
				String charSet = "utf-8";
				String hostSMTP = "smtp.naver.com";		
				String hostSMTPid = "dyy25@naver.com"; // 본인의 아이디 입력		
				String hostSMTPpwd = "ekdud.6034"; // 비밀번호 입력
				
				// 보내는 사람 EMail, 제목, 내용 
				String fromEmail = "dyy25@naver.com"; // 보내는 사람 eamil
				String fromName = "Funcat";  // 보내는 사람 이름
				String subject = "이메일 발송 테스트"; // 제목
				
				// 받는 사람 E-Mail 주소
				String mail = "dyyg25@gmail.com";  // 받는 사람 email		
				
				try {
					HtmlEmail email = new HtmlEmail();
					email.setDebug(true);
					email.setCharset(charSet);
					email.setSSL(true);
					email.setHostName(hostSMTP);
					email.setSmtpPort(465);	// SMTP 포트 번호 입력

					email.setAuthentication(hostSMTPid, hostSMTPpwd);
					email.setTLS(true);
					email.addTo(mail, charSet);
					email.setFrom(fromEmail, fromName, charSet);
					email.setSubject(subject);
					email.setHtmlMsg("<p>이메일 발송 테스트 입니다. plz...</p>"); // 본문 내용
					email.send();			
				} catch (Exception e) {
					System.out.println(e);
				}
	} // end of sendEmail()
}
