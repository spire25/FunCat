package team4.md.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import team4.md.domain.Project;
import team4.md.mapper.ProjectMapper;

@Log4j
@Service
public class ProjectServiceImpl implements ProjectService {
	@Autowired
	private ProjectMapper projectMapper;

	@Override
	public ArrayList<Project> listS() {
		return projectMapper.list();
	}

	@Override
	public ArrayList<Project> searchListS(String search_sub) {
		return projectMapper.searchList(search_sub);
	}

	@Override
	public ArrayList<Project> categoryListS(String category) {
		return projectMapper.categoryList(category);
	}

}
