package com.sansam.adeye.domain;

import lombok.Data;

@Data
public class PageDTO {

	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri; // 객체 주입 받기
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		// ceil 반올림 : 계산은 더블 타입으로
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0)) * 10;
		
		this.startPage = endPage - 9;
		
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1; // prev 버튼 만들어 줄지 말지
		this.next = this.endPage < realEnd; // next 버튼 만들어 줄지 말지
	}
	
}
