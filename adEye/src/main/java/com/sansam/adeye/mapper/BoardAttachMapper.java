package com.sansam.adeye.mapper;

import java.util.List;

import com.sansam.adeye.domain.BoardAttachDTO;

public interface BoardAttachMapper {

	public void insert(BoardAttachDTO boardAttachDto);
	public void delete(String uuid);
	
	// 특정 게시물의 번호로 첨부파일을 취득
	public List<BoardAttachDTO> findByBno(int bno);
	
	// 삭제기능 - 부모삭제시 자식첨부파일도 전부 삭제
	public void deleteAll(int bno);
}
