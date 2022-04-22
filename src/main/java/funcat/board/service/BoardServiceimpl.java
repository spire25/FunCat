package funcat.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import funcat.board.domain.BoardVO;
import funcat.board.mapper.BoardMapper;
@Service
public class BoardServiceimpl implements BoardService{
	
	@Autowired
	private BoardMapper boardmapper;
	
	@Override
	public List<BoardVO> board(){
		return boardmapper.board();
	}
	
	@Override
	public BoardVO content(Integer community_num) {
		boardmapper.community_view(community_num);
		return boardmapper.content(community_num);
	}

	@Override
	public void delete(Integer community_num) {
		boardmapper.delete(community_num);		
	}


}
