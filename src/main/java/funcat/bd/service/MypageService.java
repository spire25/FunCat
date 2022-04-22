package funcat.bd.service;

import java.util.List;
import funcat.bd.domain.Mypage;

public interface MypageService {
	
	//로그인
	
	//마이페이지 조회
	Mypage list(Mypage mypage);
	Mypage getMypage(Mypage mypage);
	void update(Mypage mypage);
	
	//내 주문내역 조회
	List<Mypage> getMyOrderlist(Mypage mypage);
	void orderDelete(long order_num);
	
	//크리에이터 신청
	Mypage applyCreatorForm(Mypage mypage);
	void applyCreator(Mypage mypage);
	
	//크리에이터 관리 화면
	Mypage getCreator(Mypage mypage);
	List<Mypage> getProjectlist(Mypage mypage);
	
	//크리에이터 정보 수정
	Mypage getCreatordetail(Mypage mypage);
	void creatorUpdate(Mypage mypage);
	
	//크리에이터 프로젝트 수정
	Mypage getProjectdetail(Mypage mypage);
	void projectupdate(Mypage mypage);
	void delete(long project_num);
	
	//프로젝트 상세페이지
	Mypage projectForm(Mypage mypage);
	List<Mypage> reward(Mypage mypage);

}
