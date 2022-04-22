package fc.noticeboard.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import fc.noticeboard.domain.ProjectBoardVO;

	
	@RunWith(SpringJUnit4ClassRunner.class)
	@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
	public class ProjectBoardMapperTests {
	 
	     private static final Logger log = LoggerFactory.getLogger(ProjectBoardMapperTests.class);
	     
	     @Autowired
	     private ProjectBoardMapper mapper;
	 
	     @Test
	     public void testPenroll() {
	         
	         ProjectBoardVO vo = new ProjectBoardVO();
	         
	         vo.setProject_num(0);
	         vo.setCreator_num(1);
	         vo.setCategory_num(3);
	         vo.setProject_sub("안녕하세요");
	         vo.setProject_goal(5000000);
	         vo.setProject_comment("팝니다");
	         vo.setProject_detail("안녕하세유");
	         vo.setProject_price(200000000);
	         vo.setProject_level("펀딩대기");
	         vo.setProject_thumbnail("사진 주셈");
	         
	         
	         
	    
	         mapper.penroll(vo);
	         
	     }
	}

