package funcat.bd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import funcat.bd.domain.Mypage;
import funcat.bd.mapper.MypageMapper;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MypageMapper mypageMapper;
	
	//로그인

	//마이페이지 조회
	@Override
	public Mypage list(Mypage mypage) {
		return mypageMapper.mylist(mypage);
	}
	
	//마이페이지 수정폼
	@Override
	public Mypage getMypage(Mypage mypage) {
		return mypageMapper.selectByID(mypage);
	}
	
	//마이페이지 수정하기
	@Override
	public void update(Mypage mypage) {
		mypageMapper.update(mypage);
	}
	
	// 내 주문내역 조회
	@Override
	public List<Mypage> getMyOrderlist(Mypage mypage) {
		return mypageMapper.orderlist(mypage);
	}
	
	//내 주문 취소
	@Override
	public void orderDelete(long order_num) {
		mypageMapper.orderDelete(order_num);				
	}
	
	//크리에이터 신청
	@Override
	public Mypage applyCreatorForm(Mypage mypage) {
		return mypageMapper.applyCreatorForm(mypage);
	}
	
	@Override
	public void applyCreator(Mypage mypage) {
		mypageMapper.applyCreator(mypage);
	}
	
	//크리에이터 관리 화면(프로젝트조회)
	@Override
	public Mypage getCreator(Mypage mypage) {
		return mypageMapper.creator(mypage);
	}
	
	@Override
	public List<Mypage> getProjectlist(Mypage mypage) {
		return mypageMapper.projectlist(mypage);
	}
	
	//크리에이터 관리 화면(크리에이터 정보 수정폼)
	@Override
	public Mypage getCreatordetail(Mypage mypage) {
		return mypageMapper.creatorDetail(mypage);
	}
	
	//크리에이터 관리 화면(크리에이터 수정)
	@Override
	public void creatorUpdate(Mypage mypage) {
		mypageMapper.creatorUpdate(mypage);
	}
	
	//크리에이터 관리 화면(프로젝트수정폼)
	@Override
	public Mypage getProjectdetail(Mypage mypage) {
		return mypageMapper.projectdetail(mypage);
	}
	
	//크리에이터 관리 화면(프로젝트수정)
	@Override
	public void projectupdate(Mypage mypage) {
		mypageMapper.projectUpdate(mypage);
	}
	
	//크리에이터 관리 화면(프로젝트삭제)
	@Override
	public void delete(long project_num) {
		mypageMapper.delete(project_num);				
	}
	
	//프로젝트 상세페이지
	@Override
	public Mypage projectForm(Mypage mypage) {
		return mypageMapper.projectForm(mypage);
	}
	
	@Override
	public List<Mypage> reward(Mypage mypage) {
		return mypageMapper.reward(mypage);
	}
}
