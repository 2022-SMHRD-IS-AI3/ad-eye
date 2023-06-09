package com.sansam.adeye.service;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.sansam.adeye.domain.Criteria;
import com.sansam.adeye.domain.DeviceDTO;
import com.sansam.adeye.domain.LogDTO;

public interface IDeviceService {
	
	// 전체 기기 조회
	public List<DeviceDTO> deviceList(Criteria cri) throws Exception;
	// 기기 생성
	public int deviceInsert(DeviceDTO dDto) throws Exception;
	// 특정 기기 정보 조회
	public DeviceDTO deviceDetail(int seq) throws Exception;
	// 특정 기기 수정
	public int deviceUpdate(DeviceDTO dDto) throws Exception;
	// 특정 기기 삭제 (상태 변경)
	public int deviceDelete(int seq) throws Exception;
	// 특정 기기 컨트롤
	public int deviceControl(DeviceDTO dDto) throws Exception;
	//특정 기기 로그 조회
	public List<LogDTO> deviceLog(Criteria cri) throws Exception;
	// 전체 로그 조회
	public List<LogDTO> LogList(Criteria cri) throws Exception;
	// 기기 목록 페이징
	public int totalCnt(Criteria cri) throws Exception;
	// 전체 로그 목록 페이징
	public int logTotalCnt(Criteria cri) throws Exception;
	// 특정 기기 로그 조회 페이징
	public int devLogCnt(Criteria cri) throws Exception;
	// 기기 간단 목록
	public List<DeviceDTO> deviceSimpleList() throws Exception;
}
