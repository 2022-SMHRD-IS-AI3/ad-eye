package com.sansam.adeye.persistence.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sansam.adeye.domain.Criteria;
import com.sansam.adeye.domain.DeviceDTO;
import com.sansam.adeye.persistence.IDeviceDAO;

@Repository
public class DeviceDAO implements IDeviceDAO{
	
	@Autowired
	private SqlSession session;

	// 전체 기기 조회 : /
	@Override
	public List<DeviceDTO> deviceList(Criteria cri) throws Exception {
		return session.selectList("DeviceMapper.list", cri);
	}
	// 기기 생성 : /insert
	@Override
	public int deviceInsert(DeviceDTO dDto) throws Exception {
		
		int result = 0;
		
		try {
			result = session.insert("DeviceMapper.create", dDto);
		} catch (Exception e) {
		}
		
		return result;
	}
	// 특정 기기 조회 : /detail
	public DeviceDTO deviceDetail(int seq) throws Exception {
		return session.selectOne("DeviceMapper.detail", seq);
	}	
	// 특정 기기 수정 : /update
	@Override
	public int deviceUpdate(DeviceDTO dDto) throws Exception {
		return session.update("DeviceMapper.update", dDto);
	}
	// 특정 기기 삭제 (상태 변경) : /delete
	@Override
	public int deviceDelete(int seq) throws Exception {
		return session.update("DeviceMapper.delete", seq);
	}
	// 특정 기기 컨트롤 : /control
	@Override
	public int deviceControl(DeviceDTO dDto) throws Exception {
		return session.update("DeviceMapper.control", dDto);
	}		
	// 특정 기기 로그 조회 : /log
	@Override
	public List<DeviceDTO> deviceLog(Criteria cri) throws Exception {
		return session.selectList("DeviceMapper.logList", cri);
	}
}
