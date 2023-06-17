package com.sansam.adeye.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AcqDashboardDTO {
	
	private int male_total_cnt;
	private int male_interest_cnt;
	private int female_total_cnt;
	private int female_interest_cnt;

}
