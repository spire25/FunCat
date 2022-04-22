package fc.noticeboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fc.noticeboard.domain.ProjectBoardVO;
import fc.noticeboard.mapper.ProjectBoardMapper;

@Service
public class ProjectBoardServiceImpl implements ProjectBoardService{
	
	@Autowired
	private ProjectBoardMapper mapper;
	
	@Override
	public void penroll(ProjectBoardVO pr) {
		
		mapper.penroll(pr);
	}

}
