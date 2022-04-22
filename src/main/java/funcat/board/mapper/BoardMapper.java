package funcat.board.mapper;

import java.util.List;

import funcat.board.domain.BoardVO;

public interface BoardMapper {
	List<BoardVO> board();
	BoardVO content(Integer community_num); //상세보기
	void delete(Integer community_num); //삭제
	public int community_view(int community_num);  //조회수 업데이트
}
