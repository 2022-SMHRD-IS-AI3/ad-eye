package com.sansam.adeye.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

/**
 * @author smhrd
 *
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
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
			String mem_email, String company_addr, char mem_status) {
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_company = mem_company;
		this.mem_phone = mem_phone;
		this.mem_email = mem_email;
		this.company_addr = company_addr;
		this.mem_status = mem_status;
	}
	
	// 로그인 용  생성자
	public MemberDTO(@NonNull String mem_id, @NonNull String mem_pw) {
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
	}

	// 회원 목록 용 생성자
	public MemberDTO(@NonNull String mem_id, String mem_company, String mem_phone, String mem_email, char mem_status,
			Date mem_joindate, String company_addr) {
		this.mem_id = mem_id;
		this.mem_company = mem_company;
		this.mem_phone = mem_phone;
		this.mem_email = mem_email;
		this.mem_status = mem_status;
		this.mem_joindate = mem_joindate;
		this.company_addr = company_addr;
	}

	// 회원 수정 용 생성자
	public MemberDTO(@NonNull String mem_pw, String mem_phone, String mem_email, String company_addr, char mem_status, @NonNull String mem_id) {
		this.mem_pw = mem_pw;
		this.mem_phone = mem_phone;
		this.mem_email = mem_email;
		this.company_addr = company_addr;
		this.mem_status = mem_status;
		this.mem_id = mem_id;
	}
	
	
	
	
	
}
