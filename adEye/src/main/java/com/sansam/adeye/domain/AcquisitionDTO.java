package com.sansam.adeye.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AcquisitionDTO {

	private int acq_seq;
	private int sbs_deq;
	private char acq_gender;
	private String acq_interest;
	private Date acq_dt;

}
