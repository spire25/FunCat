package team4.md.service;

import java.util.ArrayList;

import team4.md.domain.Project;

public interface ProjectService {
	ArrayList<Project> listS();
	ArrayList<Project> searchListS(String search_sub);
	ArrayList<Project> categoryListS(String category);
}
