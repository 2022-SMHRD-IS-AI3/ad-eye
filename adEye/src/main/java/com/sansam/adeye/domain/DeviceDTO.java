package com.sansam.adeye.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class DeviceDTO {

	   
	   private int device_seq;
	   private String device_uid;
	   private char device_onoff;
	   private char device_status;
	   private Date device_dt;
	   
	   private String mem_company;
	   private int   sbs_seq;
	   private String sbs_alias;
	   private int data_check;
	   
	   public DeviceDTO(int device_seq, char device_onoff) {
	      this.device_seq = device_seq;
	      this.device_onoff = device_onoff;
	   }
	}


