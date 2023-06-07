package com.sansam.adeye.persistence.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.sansam.adeye.domain.AdminDashboardDTO;
import com.sansam.adeye.persistence.IAdminDashboardDAO;

public class AdminDashboardDAO implements IAdminDashboardDAO{

	@Autowired
	private SqlSession session;
	
	@Override
	public AdminDashboardDTO adminView(char admin_yn) throws Exception {
		
		return session.selectOne("AdminDashboardMapper.adminView", admin_yn);
	}

}
