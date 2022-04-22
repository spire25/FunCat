package team4.md.mapper;

import java.util.ArrayList;

import team4.md.domain.Project;

public interface ProjectMapper {
	ArrayList<Project> list();
	ArrayList<Project> searchList(String search_sub);
	ArrayList<Project> categoryList(String category);
}
