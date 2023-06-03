package com.sansam.adeye.persistence;

import java.util.List;

import com.sansam.adeye.domain.Criteria;
import com.sansam.adeye.domain.DeviceDTO;

public interface IDeviceDAO {

	// 전체 기기 조회
	public List<DeviceDTO> deviceList(Criteria cri) throws Exception;
	// 기기 생성
	public void deviceInsert(DeviceDTO dDto) throws Exception;
	// 특정 기기 수정
	public int deviceUpdate(DeviceDTO dDto) throws Exception;
	// 특정 기기 삭제 (상태 변경)
	public int deviceDelete(DeviceDTO dDto) throws Exception;
	// 특정 기기 정보 조회
	public DeviceDTO deviceDetail(Integer seq) throws Exception;
	// 특정 기기 컨트롤
	public int deviceControl(DeviceDTO dDto) throws Exception;
	//특정 기기 로그 조회
	public List<DeviceDTO> deviceLog(Criteria cri) throws Exception;
}
