package com.sansam.adeye.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

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

	private String mem_company;
	private int sbs_total_man;
	private int sbs_total_interest;
	private int sbs_male_per;
	private int sbs_female_per;
	
	private int sbs_total;
	
	// 회원 구독 전체 조회 : sbsList 용 생성자
	public SubscriptionDTO(int sbs_seq, String sbs_alias, String sbs_loc, int sbs_total_man, int sbs_total_interest,
			int sbs_male_per, int sbs_female_per) {
		this.sbs_seq = sbs_seq;
		this.sbs_alias = sbs_alias;
		this.sbs_loc = sbs_loc;
		this.sbs_total_man = sbs_total_man;
		this.sbs_total_interest = sbs_total_interest;
		this.sbs_male_per = sbs_male_per;
		this.sbs_female_per = sbs_female_per;
	}
	
}
