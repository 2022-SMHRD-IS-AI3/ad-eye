package com.sansam.adeye.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class LogDTO {

	private int log_seq;
	private int device_seq;
	private String log_msg;
	private Date log_dt;
}
