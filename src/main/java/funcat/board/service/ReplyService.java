package funcat.board.service;

import java.util.List;

import funcat.board.domain.ReplyVO;

public interface ReplyService {
	//댓글조회
	public List<ReplyVO> list(int community_num) throws Exception;
	
	//댓글조회
	public void write(ReplyVO vo) throws Exception;
	
	//댓글수정
	public void modify(ReplyVO vo) throws Exception;
	
	//댓글삭제
	public void delete(ReplyVO vo) throws Exception;
}
