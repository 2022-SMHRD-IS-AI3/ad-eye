package com.sansam.adeye.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.sansam.adeye.domain.AdminDashboardDTO;
import com.sansam.adeye.persistence.IAdminDashboardDAO;
import com.sansam.adeye.service.IAdminDashboardService;

public class AdminDashboardServiceImpl implements IAdminDashboardService{

	@Autowired
	private IAdminDashboardDAO adDao;
	
	// 관리자 페이지 기본 화면 구성
	@Override
	public AdminDashboardDTO adminView(char admin_yn) throws Exception {
		
		return adDao.adminView(admin_yn);
	}
	
}
