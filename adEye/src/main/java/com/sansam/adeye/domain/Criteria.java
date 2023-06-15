package com.sansam.adeye.domain;

import lombok.Data;

@Data
public class Criteria {

	private int pageNum; // 보여줄 페이지
	private int amount; // 페이지별 보여줄 데이터 행 수
	
	// 검색 조건 추가
		private String type; // 검색 시 입력 될 value값(구분값)
		private String keyword; // type 에 해당하는 키워드
		private String seq; // 특정 조회 시 사용 할 seq 값
		private String status; // 상태값
		private String date; // 일자값
		private String grade; // 등급값
		
		
		public Criteria() {
			this(1,10); // 자기 자신 생성자
		}
		
		public Criteria(int pageNum, int amount) {
			this.pageNum = pageNum;
			this.amount = amount;
		}
		
		public String[] getTypeArr() {
			return type == null ? new String[] {} : type.split("");
		}
		
		public String[] getStatusArr() {
		    return status == null ? new String[] {} : status.split("");
		}
		
		public String[] getDateArr() {
		    return date == null ? new String[] {} : date.split("");
		}
		
		public String[] getGradeArr() {
		    return grade == null ? new String[] {} : grade.split("");
		}

		public Criteria(int pageNum, int amount, String type, String keyword, String seq, String status, String date, String grade) {
			this.pageNum = pageNum;
			this.amount = amount;
			this.type = type;
			this.keyword = keyword;
			this.seq = seq;
			this.status = status;
			this.date = date;
			this.grade = grade;
		}
}
