package com.sansam.adeye.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@RequiredArgsConstructor
public class ContactDTO {

	private int contact_seq;
	@NonNull
	private String email;
	@NonNull
	private String phone;
	@NonNull
	private String company;
	@NonNull
	private String contact_content;
	private String contact_dt;
	@NonNull
	private String contact_open;
	private String admin_id;
	
	// 전체 문의 조회 용 생성자
//	public ContactDTO(int contact_seq, @NonNull String email, @NonNull String phone, 
//			@NonNull String company, @NonNull String contact_content, @NonNull Date contact_dt,
//			@NonNull char contact_open) {
//		this.contact_seq = contact_seq;
//		this.email = email;
//		this.phone = phone;
//		this.company = company;
//		this.contact_content = contact_content;
//		this.contact_dt = contact_dt;
//		this.contact_open = contact_open;		
//	}
	
	// 문의 등록 용 생성자
	
	
	// 문의 상세 조회 용 생성자
	
	
}
