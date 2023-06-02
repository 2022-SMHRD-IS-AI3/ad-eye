package com.sansam.adeye.sansamapi;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sansam.adeye.command.Command;
import com.sansam.adeye.controller.AcquisitionCon;
import com.sansam.adeye.controller.AdminDashboardCon;
import com.sansam.adeye.controller.AnalyzeCon;
import com.sansam.adeye.controller.ContactCon;
import com.sansam.adeye.controller.ContactDetailCon;
import com.sansam.adeye.controller.ContactSendCon;
import com.sansam.adeye.controller.DeviceCon;
import com.sansam.adeye.controller.DeviceControlCon;
import com.sansam.adeye.controller.DeviceDeleteCon;
import com.sansam.adeye.controller.DeviceDetailCon;
import com.sansam.adeye.controller.DeviceInsertCon;
import com.sansam.adeye.controller.DeviceLogCon;
import com.sansam.adeye.controller.DeviceUpdateCon;
import com.sansam.adeye.controller.LoginCon;
import com.sansam.adeye.controller.LogoutCon;
import com.sansam.adeye.controller.MemberCon;
import com.sansam.adeye.controller.MemberDeleteCon;
import com.sansam.adeye.controller.MemberDetailCon;
import com.sansam.adeye.controller.MemberInsertCon;
import com.sansam.adeye.controller.MemberUpdateCon;
import com.sansam.adeye.controller.SubscriptionCon;
import com.sansam.adeye.controller.SubscriptionDeleteCon;
import com.sansam.adeye.controller.SubscriptionDetailCon;
import com.sansam.adeye.controller.SubscriptionInsertCon;
import com.sansam.adeye.controller.SubscriptionUpdateCon;

public class SansamApi extends HttpServlet {
	// *.do --> 앞에 어떤 text가 오든 .do라는 확장자를 가지고 있는 요청이라면
	// 모두 SansamApi 로 올 수 있도록 지정
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
System.out.println("Welcome SansamAPI");
		
		// POST방식 인코딩
		request.setCharacterEncoding("UTF-8");
		// 요청한 위치
		String reqUrl = request.getRequestURI();
		// ContextRoot
		String contextPath = request.getContextPath();
		// substring(start) : start 위치부터 끝까지 문자열 자르기
		String result = reqUrl.substring(contextPath.length()+1);
		Command con = null;
		
		if(result.equals("login.do")) {
			con = new LoginCon();
		}else if(result.equals("logout.do")) {
			con = new LogoutCon();
		// 문의
		}else if(result.equals("contact.do")) {
			con = new ContactCon();
		}else if(result.equals("contact/send.do")) {
			con = new ContactSendCon();
		}else if(result.equals("contact/detail.do")) {
			con = new ContactDetailCon();
		// 회원 정보
		}else if(result.equals("member.do")) {
			con = new MemberCon();
		}else if(result.equals("member/insert.do")) {
			con = new MemberInsertCon();
		}else if(result.equals("member/detail.do")) {
			con = new MemberDetailCon();
		}else if(result.equals("member/update.do")) {
			con = new MemberUpdateCon();
		}else if(result.equals("member/delete.do")) {
			con = new MemberDeleteCon();
		// 구독 관리
		}else if(result.equals("subscription.do")) {
			con = new SubscriptionCon();
		}else if(result.equals("subscription/insert.do")) {
			con = new SubscriptionInsertCon();
		}else if(result.equals("subscription/detail.do")) {
			con = new SubscriptionDetailCon();
		}else if(result.equals("subscription/update.do")) {
			con = new SubscriptionUpdateCon();
		}else if(result.equals("subscription/delete.do")) {
			con = new SubscriptionDeleteCon();
		// 기기 정보
		}else if(result.equals("device.do")) {
			con = new DeviceCon();
		}else if(result.equals("device/insert.do")) {
			con = new DeviceInsertCon();
		}else if(result.equals("device/detail.do")) {
			con = new DeviceDetailCon();
		}else if(result.equals("device/update.do")) {
			con = new DeviceUpdateCon();
		}else if(result.equals("device/delete.do")) {
			con = new DeviceDeleteCon();
		}else if(result.equals("device/control.do")) {
			con = new DeviceControlCon();
		}else if(result.equals("device/log.do")) {
			con = new DeviceLogCon();
		// 관리자 기본 화면 구성
		}else if(result.equals("admin/dashboard.do")) {
			con = new AdminDashboardCon();
		// 분석페이지 화면 구성
		}else if(result.equals("analyze.do")) {
			con = new AnalyzeCon();
		// 데이터 수집
		}else if(result.equals("acquisition.do")) {
			con = new AcquisitionCon();
		}
		
		response.sendRedirect(con.execute(request, response));		
	}

}
