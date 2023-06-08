package com.sansam.adeye.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class AcquisitionSubmitDTO {
	private String device_uid;
	private String acq_tid;
	private String acq_start_dt;
	private String acq_end_dt;
	private String acq_interest;
	private String acq_gender;
}
