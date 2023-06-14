<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>문의 - admin</title>
		<%@ include file="../../../includes/header.jsp" %>
		<!-- content -->
            <div id="layoutSidenav_content">
                <main>
                    <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                        <div class="container-fluid px-4">
                            <div class="page-header-content">
                                <div class="row align-items-center justify-content-between pt-3">
                                    <div class="col-auto mb-3">
                                        <h1 class="page-header-title">
                                            <b>문의 관리</b>
                                        </h1>
                                    </div>
                                    <!-- <div class="col-12 col-xl-auto mb-3">
                                        <a class="btn btn-sm btn-light text-primary" href="#!">
                                            <i class="me-1" data-feather="plus-circle"></i>
                                            회원 등록
                                        </a>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- 검색 -->
                    <div class="container-fluid px-4 mb-4">
                        <div class="card">
                            <div class="card-body">
                            	<div class="row gx-3">
                                   	<label for="" class="col-sm-1 col-form-label fw-bolder text-center">검색</label>
                                   	<div class="col-md-2">
                                   		<select class="form-select" name="key">
                                   			<option value="">--- 선택 ---</option>
                                   			<option value="company">회사명</option>
                                   			<option value="phone">연락처</option>
                                   			<option value="email">이메일</option>
                                   			<option value="content">내용</option>
                                   		</select>
                                   		
                                    </div>
                                   	<div class="col-md-2">
                                        <input class="form-control" id="keword" type="text" name="keword" placeholder="내용을 입력해주세요" value="" />
                                    </div>
                                   <div class="col-md-2">
                                   		<select class="form-select" name="sbs_status">
                                   			<option value="">--- 상태 ---</option>
                                   			<option value="Y">Y</option>
                                   			<option value="N">N</option>
                                   		</select>
                                   		</div>
                                   		 <!-- Date Range Picker Example-->
               <label for="" class="col-sm-1 col-form-label fw-bolder text-center">기간</label>
                <div class="col-md-2">
                <div class="input-group input-group-joined">
                    <input class="form-control ps-0" id="litepickerRangePlugin" placeholder="날짜를 선택하세요">
                    <span class="input-group-text">
                        <i data-feather="calendar"></i>
                    </span>
                
                </div>
                </div>
                                    <div class="col-md-2">
                                   		<button class="btn btn-dark" id="search_btn">검색</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Main page content-->
                    <div class="container-fluid px-4">
                        <div class="card">
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                        	<th>No.</th>
                                            <th>회사명</th>
                                            <th>연락처</th>
                                            <th>이메일</th>
                                            <th>내용</th>
                                            <th>날짜</th>
                                            <th>확인</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        
                                        	<th>No.</th>
                                            <th>회사명</th>
                                            <th>연락처</th>
                                            <th>이메일</th>
                                            <th>내용</th>
                                            <th>날짜</th>
                                            <th>확인</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                        <!-- for문 돌릴 곳!! -->
                                       		<td>1</td>
                                            <td>서울교통공사</td>
                                            <td>02-000-0000</td>
                                            <td>kkk@kkkk.kk</td>
                                            <td>집에 보내줘</td>
                                            <td>2023-05-01</td>
                                            <td>Y</td>
                                            
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
	<%@ include file="../../../includes/footer.jsp" %> 
	</body>
</html>