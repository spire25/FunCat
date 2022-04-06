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
	
	//크리에이터 관리 화면(프로젝트)
	Mypage creator(Mypage mypage);
	List<Mypage> projectlist(Mypage mypage);
	
	Mypage creatorDetail(Mypage mypage);
	void creatorUpdate(Mypage mypage);
	
	Mypage projectdetail(Mypage mypage);
	void projectUpdate(Mypage mypage);
	void delete(long project_num);
	
}
