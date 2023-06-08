package com.sansam.adeye.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SubscriptionDTO {

	private int sbs_seq;
	private String mem_id;
	private int device_seq;
	private String sbs_loc;
	private String sbs_alias;
	private Date sbs_start_dt;
	private Date sbs_end_dt;
	private Date sbs_reg_dt;
	private String sbs_grade;
	private char sbs_status;
	
}
