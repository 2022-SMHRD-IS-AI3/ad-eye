package com.sansam.adeye.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@RequiredArgsConstructor
public class MemberDTO {
	
	@NonNull
	private String mem_id;
	@NonNull
	private String mem_pw;
	private String mem_company;
	private String mem_phone;
	private String mem_email;
	private char mem_status;
	private Date mem_joindate;
	private String company_addr;
	private char admin_yn;
	
	
	// 회원 가입요청 용  생성자
	public MemberDTO(@NonNull String mem_id, @NonNull String mem_pw, String mem_company, String mem_phone,
			String mem_email, String company_addr) {
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_company = mem_company;
		this.mem_phone = mem_phone;
		this.mem_email = mem_email;
		this.company_addr = company_addr;
	}
	
	
	
}
