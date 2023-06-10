package com.sansam.adeye.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AcquisitionDTO {

	@NonNull
	private int acq_seq;
	private char acq_gender;
	private String acq_interest;
	private Date acq_start_dt;
	private Date acq_end_dt;
	private int acq_tid;
	private int sbs_seq;
	
	// 데이터 등록용
	public AcquisitionDTO(char acq_gender, String acq_interest, Date acq_start_dt, Date acq_end_dt, int acq_tid, int sbs_seq) {
		this.acq_gender = acq_gender;
		this.acq_interest = acq_interest;
		this.acq_start_dt = acq_start_dt;
		this.acq_end_dt = acq_end_dt;
		this.acq_tid = acq_tid;
		this.sbs_seq = sbs_seq;
	}


}
