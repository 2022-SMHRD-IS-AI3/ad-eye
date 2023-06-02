package com.sansam.adeye.persistence.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sansam.adeye.domain.BoardDTO;
import com.sansam.adeye.domain.Criteria;
import com.sansam.adeye.persistence.IBoardDAO;

@Repository
public class BoardDAOImpl implements IBoardDAO {

	@Autowired
	private SqlSession session;

	@Override // 추가
	public void create(BoardDTO bDto) throws Exception {
		session.insert("BoardMapper.create", bDto);
	}

	@Override // 상세
	public BoardDTO read(Integer bno) throws Exception {
		return session.selectOne("BoardMapper.read", bno);
	}

	@Override // 수정
	public int update(BoardDTO bDto) throws Exception {
		return session.update("BoardMapper.update", bDto);
	}

	@Override // 삭제
	public int delete(Integer bno) throws Exception {
		return session.delete("BoardMapper.delete", bno);
	}

	@Override // 목록
	public List<BoardDTO> listAll(Criteria cri) throws Exception {
		return session.selectList("BoardMapper.getListWithPaging", cri);
	}

	@Override
	public int getTotalCnt(Criteria cri) throws Exception {
		return session.selectOne("BoardMapper.getTotalCnt", cri);
	}

}
