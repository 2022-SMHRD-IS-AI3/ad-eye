package com.sansam.adeye.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class AcquisitionSubmitDTO {
	private String tid;
	private String uid;
	private String start_data_time;
	private String end_data_time;
	private int effect;
	private String gender;
}
