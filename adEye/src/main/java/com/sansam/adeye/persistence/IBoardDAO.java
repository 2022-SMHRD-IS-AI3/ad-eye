package com.sansam.adeye.persistence;

import java.util.List;

import com.sansam.adeye.domain.BoardDTO;
import com.sansam.adeye.domain.Criteria;

public interface IBoardDAO { // 인터페이스
	
	// 글 생성
	public void create(BoardDTO bDto) throws Exception;
	// 글 상세
	public BoardDTO read(Integer bno) throws Exception;
	// 글 수정
	public int update(BoardDTO bDto) throws Exception;
	// 글 삭제
	public int delete(Integer bno) throws Exception;
	// 글 목록 , 페이징 처리 기능으로 수정 
	public List<BoardDTO> listAll(Criteria cri) throws Exception;
	// 총 페이지 수
	public int getTotalCnt(Criteria cri) throws Exception;
	
	
}
