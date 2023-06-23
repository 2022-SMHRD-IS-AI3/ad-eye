package com.sansam.adeye.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AcqDTO { // ai 전송용 DTO
	private String device_uid;
	private List<AcquisitionSubmitDTO> acq_list;
}
