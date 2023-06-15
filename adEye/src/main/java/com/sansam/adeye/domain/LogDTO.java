package com.sansam.adeye.domain;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class LogDTO {

	private int log_seq;
	private String device_uid;
	private String log_msg;
	private Date log_dt;
	private String sbs_loc;
}
