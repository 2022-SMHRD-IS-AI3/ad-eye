package com.sansam.adeye.persistence.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sansam.adeye.domain.AdminDashboardDTO;
import com.sansam.adeye.persistence.IAdminDashboardDAO;

@Repository
public class AdminDashboardDAO implements IAdminDashboardDAO{

	@Autowired
	private SqlSession session;
	
	@Override
	public AdminDashboardDTO adminView(char admin_yn) throws Exception {
		
		return session.selectOne("AdminDashboardMapper.adminView", admin_yn);
	}

}
