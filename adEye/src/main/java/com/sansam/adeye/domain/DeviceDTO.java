package com.sansam.adeye.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class DeviceDTO {

	private int device_seq;
	private String device_uid;
	private String device_NM;
	private char device_onoff;
	private char device_status;
	private Date device_dt;
}
