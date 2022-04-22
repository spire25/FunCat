package funcat.bd.mapper;

import java.util.List;

import funcat.bd.domain.Mypage;

public interface MypageMapper {
	
	//로그인
	
	//마이페이지 조회
	Mypage mylist(Mypage mypage);
	Mypage selectByID(Mypage mypage);
	void update(Mypage mypage);
	
	//내 주문내역 조회
	List<Mypage> orderlist(Mypage mypage);
	void orderDelete(long order_num);
	
	//크리에이터 신청 
	Mypage applyCreatorForm(Mypage mypage);
	void applyCreator(Mypage mypage);
	
	//크리에이터 관리 화면
	Mypage creator(Mypage mypage);
	List<Mypage> projectlist(Mypage mypage);
	
	Mypage creatorDetail(Mypage mypage);
	void creatorUpdate(Mypage mypage);
	
	// 프로젝트 조회, 수정
	Mypage projectdetail(Mypage mypage);
	void projectUpdate(Mypage mypage);
	void delete(long project_num);
	
	// 프로젝트 상세페이지
	Mypage projectForm(Mypage mypage);
	List<Mypage> reward(Mypage mypage);
	
}
