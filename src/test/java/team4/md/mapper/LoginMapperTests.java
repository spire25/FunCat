package team4.md.mapper;

import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import team4.md.domain.Member;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class LoginMapperTests {
	@Autowired
	private LoginMapper loginMapper;
	
	@Test
	public void testSelectById() {
		String member_id = "kosmo01@naver.com";
		Member member = loginMapper.selectById(member_id);
		log.info("#LoginMapperTests testSelectById() member: "+member);
		
	}
	
	@Test
	public void testSelectAll() {
		ArrayList<Member> list = loginMapper.selectAll();
		log.info("@@@@@@@@@list "+list);
	}

}
