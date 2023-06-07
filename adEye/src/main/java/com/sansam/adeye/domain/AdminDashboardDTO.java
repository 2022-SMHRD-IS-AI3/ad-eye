package com.sansam.adeye.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AdminDashboardDTO {

	private int contact_noread_cnt;
	private int contact_total;
	private int device_use_cnt;
	private int device_total;
	private int sbs_dday;
	private int sbs_total;
	
}
