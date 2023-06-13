package com.sansam.adeye.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AcquisitionDashboardDTO {

	private String acq_date;
	private String acq_hour;
	private int total_cnt;
	private int interest_total_cnt;

}
