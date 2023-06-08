package com.sansam.adeye.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@AllArgsConstructor
@NoArgsConstructor
@Data
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
	private Date contact_dt;
	private char contact_open;
	private String admin_id;
	
}
