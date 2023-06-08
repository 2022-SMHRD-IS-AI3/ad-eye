package com.sansam.adeye.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ContactDTO {

	private int contact_seq;
	private String email;
	private String phone;
	private int company;
	private int contact_content;
	private Date contact_dt;
	private int contact_open;
	private int admin_id;
	
}
