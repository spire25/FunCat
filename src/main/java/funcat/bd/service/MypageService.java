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
	
	//크리에이터 관리 화면(프로젝트조회)
	Mypage getCreator(Mypage mypage);
	List<Mypage> getProjectlist(Mypage mypage);
	
	Mypage getCreatordetail(Mypage mypage);
	void creatorUpdate(Mypage mypage);
	
	Mypage getProjectdetail(Mypage mypage);
	void projectupdate(Mypage mypage);
	void delete(long project_num);

}
