<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>기기 - admin</title>
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
                                            <b>기기 목록</b>
                                        </h1>
                                    </div>
                                    <div class="col-12 col-xl-auto mb-3">
                                        <a class="btn btn-sm btn-light text-primary" onClick="moveCode('dinsert')">
                                            <i class="me-1" data-feather="plus-circle"></i>
                                            기기 등록
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- Main page content-->
                    <div class="container-fluid px-4 mb-4">
                        <div class="card">
                            <div class="card-body">
                            	<div class="row gx-3">
                                   	<label for="" class="col-sm-1 col-form-label fw-bolder text-center">검색</label>
                                   	<div class="col-md-2">
                                   		<select class="form-select" name="key">
                                   			<option value="">--- 선택 ---</option>
                                   			<option value="device_num">기기번호</option>
                                   			<option value="company">회사명</option>
                                   			<option value="alias">매체이름</option>
                                   		</select>
                                    </div>
                                   	<div class="col-md-3">
                                        <input class="form-control" id="keword" type="text" name="keword" placeholder="내용을 입력해주세요" value="" />
                                    </div>
                                    
                                    <div class="col-md-2">
                                   		<button class="btn btn-dark" id="search_btn">검색</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
 
                    <div class="container-fluid px-4">
                        <div class="card">
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>기기 번호</th>
                                            <th>시리얼</th>
                                            <th>회사명</th>
                                            <th>매체 이름</th>
                                            <th>전원 상태</th>
                                            <th>로그 확인</th>
                                            
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>기기 번호</th>
                                            <th>시리얼</th>
                                            <th>회사명</th>
                                            <th>매체 이름</th>
                                            <th>전원 상태</th>
                                            <th>로그 확인</th>
                                            
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>010101</td>
                                            <td>서울교통공사</td>
                                            <td>암튼입구역1번출구1</td>
                                            <td>off</td>
                                            <td>0</td>
                                            
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>020202</td>
                                            <td>애드</td>
                                            <td>출구1</td>
                                            <td>on</td>
                                            <td>553</td>
                                            
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
			<%@ include file="../../../includes/footer.jsp" %> 