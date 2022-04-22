package funcat.board.service;

import java.util.List;

import funcat.board.domain.BoardVO;

public interface BoardService {
	List<BoardVO> board();
	BoardVO content(Integer community_num);
	void delete(Integer community_num);

}
