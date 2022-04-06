package team4.md.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Project {
	private long PROJECT_NUM;
	private long CREATOR_NUM;
	private long CATEGORY_NUM;
	private String PROJECT_SUB;
	private long PROJECT_GOAL;
	private String PROJECT_COMMENT;
	private String PROJECT_DETAIL;
	private long PROJECT_PRICE;
	private Date PROJECT_OPEN;
	private Date PROJECT_CLOSE;
	private Date PROJECT_DATE;
	private Date PROJECT_MDATE;
	private String PROJECT_LEVEL;
	private String PROJECT_THUMBNAIL;

}
