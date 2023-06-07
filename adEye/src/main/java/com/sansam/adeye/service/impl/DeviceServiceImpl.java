package com.sansam.adeye.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sansam.adeye.domain.Criteria;
import com.sansam.adeye.domain.DeviceDTO;
import com.sansam.adeye.persistence.IDeviceDAO;
import com.sansam.adeye.service.IDeviceService;

@Service
public class DeviceServiceImpl implements IDeviceService{

	@Autowired
	private IDeviceDAO dDao;
	
	// 전체 기기 조회
	@Override
	public List<DeviceDTO> deviceList(Criteria cri) throws Exception {
		
		return dDao.deviceList(cri);
	}
	// 기기 생성
	@Override
	public int deviceInsert(DeviceDTO dDto) throws Exception {
		
		return dDao.deviceInsert(dDto);
	}
	// 특정 기기 정보 조회
	@Override
	public DeviceDTO deviceDetail(int seq) throws Exception {
		
		return dDao.deviceDetail(seq);
	}
	// 특정 기기 수정
	@Override
	public int deviceUpdate(DeviceDTO dDto) throws Exception {
		
		return dDao.deviceUpdate(dDto);
	}
	// 특정 기기 삭제 (상태 변경)
	@Override
	public int deviceDelete(int seq) throws Exception {
		
		return dDao.deviceDelete(seq);
	}
	// 특정 기기 컨트롤
	@Override
	public int deviceControl(int seq) throws Exception {
		
		return dDao.deviceControl(seq);
	}
	//특정 기기 로그 조회
	@Override
	public List<DeviceDTO> deviceLog(Criteria cri) throws Exception {
		
		return dDao.deviceLog(cri);
	}

}
