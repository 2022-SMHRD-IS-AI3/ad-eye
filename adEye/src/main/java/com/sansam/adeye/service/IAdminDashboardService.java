package com.sansam.adeye.service;

import com.sansam.adeye.domain.AdminDashboardDTO;

public interface IAdminDashboardService {

	// 관리자 페이지 기본 화면 구성
	public AdminDashboardDTO adminView(char admin_yn) throws Exception;
	
}
