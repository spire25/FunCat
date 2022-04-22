package funcat.board.mapper;

import java.util.List;

import funcat.board.domain.ReplyVO;

public interface ReplyMapper {
	List<ReplyVO> reply(ReplyVO replyvo);

}
