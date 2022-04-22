package team4.md.service;

import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
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
				System.out.println("loginService member  "+member);
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
	
	
	
	
	
	@Override
	public void findPw(Member member, HttpServletResponse response) {
		log.info("##LoginService findPw() log");
		System.out.println("##LoginService findPw() print member: "+member);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		
		try {
			out = response.getWriter();
		} catch(IOException ie) {
			log.info("#LoginService findPw() logexception()"+ie);
			System.out.println("#LoginService findPw() exception()"+ie);
		}
			
		if(loginMapper.idCheck(member.getMember_id()) == 0) {
			// 존재하지 않는 이메일
			out.print("가입되지 않은 이메일입니다.");
			out.close();
		} else {
			// 임시 비밀번호 생성
			String newPw = "";
			for (int i=0; i<10; i++){
				newPw += (char) ((Math.random()*26) + 97); // 0~25 / 아스키 97번부터 소문자
			}
			
			member.setMember_pw(newPw);
			loginMapper.update_pw(member); // pw 변경
			
			// pw 변경 메일 전송
			sendEmail(member, "findPw");
			
			out.print("이메일로 임시 비밀번호를 전송하였습니다.");
			out.close();
		}
	} // end of findPw()
	// email 전송
		public void sendEmail(Member member, String flag) {
			log.info("##LoginService sendEmail() log member: "+member);
			System.out.println("##LoginService sendEmail() print member: "+member+", flag: "+flag);
			
			//LoginService 내 이메일, 비밀번호 없애고 보내기...
			// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.gmail.com";		
			String hostSMTPid = "pjfuncat@gmail.com"; // 본인의 아이디 입력		
			String hostSMTPpwd = "pjFuncat!1"; // 비밀번호 입력
					
			// 보내는 사람 EMail, 제목, 내용 
			String fromEmail = "pjfuncat@gmail.com"; // 보내는 사람 eamil
			String fromName = "Funcat";  // 보내는 사람 이름
			String subject = ""; // 제목 밑에 설정
			String msg = ""; // 내용 밑에 설정
			
			
			// msg 조합 if문
			if(flag.equals("findPw")) {
				// String = String+"" 이렇게 가공X 메모리차지함(중간과정 객체 계속 만들어짐)
				subject = "FunCat 임시 비밀번호 안내";
				StringBuilder sb = new StringBuilder();
				sb.append("<p align='center' style='text-align: center;'><b>FunCat 임시비밀번호입니다.</b></p>");
				sb.append("<p align='center' style='text-align: center; '><b>로그인 후 비밀번호를 변경해주세요.</b></p>");
				sb.append("<br>");
				sb.append("<p align='center' style='text-align: center; '>임시비밀번호: ");
				sb.append(member.getMember_pw());
				sb.append("</p>");
				msg = sb.toString();
			}
			
			
			// 받는 사람 E-Mail 주소
			String mail = member.getMember_id();  // 받는 사람 email	
			
			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(587);	// SMTP 포트 번호 입력

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg(msg); // 본문 내용
				email.send();			
			} catch (Exception e) {
				System.out.println("loginService sendEmail() 예외"+e);
			}
		} // end of sendEmail()

		
		@Override
		public void findEmail(Member member, HttpServletResponse response) {
			log.info("##LoginService findEmail() log");
			System.out.println("##LoginService findEmail() print member: "+member);
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = null;
			
			try {
				out = response.getWriter();
			} catch(IOException ie) {
				log.info("#LoginService findEmail() logexception()"+ie);
				System.out.println("#LoginService findEmail() exception()"+ie);
			}
			
			if(loginMapper.idCheck(member.getMember_id()) == 0) {
				out.print("미등록");
				out.close();
			} else {
				out.print("등록");
				out.close();
			}
		} // end of findEmail()
}
