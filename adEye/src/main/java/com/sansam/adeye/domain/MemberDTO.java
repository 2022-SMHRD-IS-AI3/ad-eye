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
	
}
