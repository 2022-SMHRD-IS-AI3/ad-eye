package com.sansam.adeye.domain;

import lombok.Data;

@Data
public class Criteria {

	private int pageNum; // 보여줄 페이지ㄹv
	private int amount; // 페이지별 보여줄 데이터 행 수ㅇ
	
	// 검색 조건 추가
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1,10); // 자기 자신 생성자ㅇ
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
}
