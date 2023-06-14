<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>회원관리 - admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="${path}/resources/css/styles.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="${path}/resources/assets/img/logo.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
        <style type="text/css">
        	.link-point{
        		cursor: pointer;
        	}
        </style>
    </head>
    <body class="nav-fixed">
        <nav class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white" id="sidenavAccordion">
            <!-- Sidenav Toggle Button-->
            <button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 me-2 ms-lg-2 me-lg-0" id="sidebarToggle"><i data-feather="menu"></i></button>
            <!-- Navbar Brand-->
            <!-- * * Tip * * You can use text or an image for your navbar brand.-->
            <!-- * * * * * * When using an image, we recommend the SVG format.-->
            <!-- * * * * * * Dimensions: Maximum height: 32px, maximum width: 240px-->
            <a class="navbar-brand pe-3 ps-4 ps-lg-2"  href="#">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-stack" viewBox="0 0 16 16">
                    <path d="m14.12 10.163 1.715.858c.22.11.22.424 0 .534L8.267 15.34a.598.598 0 0 1-.534 0L.165 11.555a.299.299 0 0 1 0-.534l1.716-.858 5.317 2.659c.505.252 1.1.252 1.604 0l5.317-2.66zM7.733.063a.598.598 0 0 1 .534 0l7.568 3.784a.3.3 0 0 1 0 .535L8.267 8.165a.598.598 0 0 1-.534 0L.165 4.382a.299.299 0 0 1 0-.535L7.733.063z"/>
                    <path d="m14.12 6.576 1.715.858c.22.11.22.424 0 .534l-7.568 3.784a.598.598 0 0 1-.534 0L.165 7.968a.299.299 0 0 1 0-.534l1.716-.858 5.317 2.659c.505.252 1.1.252 1.604 0l5.317-2.659z"/>
                  </svg> Ad-EYE</a>
                
           
            <!-- Navbar Items-->
            <ul class="navbar-nav align-items-center ms-auto">
                
                <!-- User Dropdown-->
                <li class="nav-item dropdown no-caret dropdown-user me-3 me-lg-4">
                    <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownUserImage" href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img class="img-fluid" src="${path}/resources/assets/img/user-gear.png" /></a>
                    <div class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownUserImage">
                        <h6 class="dropdown-header d-flex align-items-center">
                            <img class="dropdown-user-img" src="${path}/resources/assets/img/user-gear.png" />
                            <div class="dropdown-user-details">
                                <div class="dropdown-user-details-name">admin</div>
                                <div class="dropdown-user-details-email">admin</div>
                            </div>
                        </h6>
                        <div class="dropdown-divider"></div>
                        <!-- <a class="dropdown-item" href="#!">
                            <div class="dropdown-item-icon"><i data-feather="settings"></i></div>
                            정보수정
                        </a> -->
                        <a class="dropdown-item" href="#!">
                            <div class="dropdown-item-icon"><i data-feather="log-out"></i></div>
                            로그아웃
                        </a>
                    </div>
                </li>
            </ul>
        </nav>
        <!-- side menu -->
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sidenav shadow-right sidenav-light">
                    <div class="sidenav-menu">
                        <div class="nav accordion" id="accordionSidenav">
                            <!-- Sidenav Menu Heading (상단 공백) -->
                            <div class="sidenav-menu-heading"></div>
                            <!-- Sidenav Accordion (기기)-->
                            <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#collapseDashboards" aria-expanded="false" aria-controls="collapseDashboards">
                                기기 관리
                                <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseDashboards" data-bs-parent="#accordionSidenav">
                                <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavPages">
                                    <a class="nav-link" href="#!">기기 목록</a>
                                    <a class="nav-link" href="#!">기기 등록</a>
                                </nav>
                            </div>
                            <!-- Sidenav Accordion (회원)-->
                            <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAccount" aria-expanded="false" aria-controls="pagesCollapseAccount">
                                회원 관리
                                <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                           	<div class="collapse" id="pagesCollapseAccount" data-bs-parent="#accordionSidenav">
                                <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavPages">
                                    <a class="nav-link" href="/pages/user_management">회원 목록</a>
                                    <a class="nav-link" href="/pages/user_register">회원 등록</a>
                                </nav>
                            </div>
                            <!-- Sidenav Accordion (구독)-->
                            <a class="nav-link collapsed" href="javascript:void(0);" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuthBasic" aria-expanded="false" aria-controls="pagesCollapseAuthBasic">
                                구독 관리
                                <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="pagesCollapseAuthBasic" data-bs-parent="#accordionSidenav">
                                <nav class="sidenav-menu-nested nav accordion" id="accordionSidenavPages">
                                    <a class="nav-link" href="/pages/subscription">구독 목록</a>
                                    <a class="nav-link" href="/pages/subscription_register">구독 등록</a>
                                </nav>
                            </div>
                            <!-- Sidenav Link (로그)-->
                            <a class="nav-link" href="#!">
                                로그 관리
                            <!-- Sidenav Link (문의)-->
                            <a class="nav-link" href="#!">
                                문의 관리
                            </a>
                        </nav>
                    </div>               
            <!-- content -->
            <!-- header -->
            <div id="layoutSidenav_content">
                <main>
                <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                        <div class="container-fluid px-4">
                            <div class="page-header-content">
                                <div class="row align-items-center justify-content-between pt-3">
                                    <div class="col-auto mb-3">
                                        <h1 class="page-header-title">
                                            <b>회원 관리</b>
                                        </h1>
                                    </div>
                                    <div class="col-12 col-xl-auto mb-3">
                                        <a class="btn btn-sm btn-light text-primary" href="#!">
                                            <i class="me-1" data-feather="user-plus"></i>
                                            회원 등록
                                        </a>
                                    </div>
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
                                   		<select class="form-select" name="key" disabled>
                                   			<option value="">--- 선택 ---</option>
                                   			<option value="company" selected>회사명</option>
                                   			
                                   		</select>
                                    </div>
                                   	<div class="col-md-3">
                                        <input class="form-control" id="keword" type="text" name="keword" placeholder="내용을 입력해주세요" value="" />
                                    </div>
                                    
                                   <!--  <div class="col-md-2">
                                   		<select class="form-select" name="sbs_grade" disabled>
                                   			<option value="">--- 등급 ---</option>
                                   			<option value="standard" selected>standard</option>
                                   		</select>
                                    </div>
                                    <div class="col-md-2">
                                   		<select class="form-select" name="sbs_status">
                                   			<option value="">--- 상태 ---</option>
                                   			<option value="Y">사용</option>
                                   			<option value="N">중지</option>
                                   		</select>
                                    </div> -->
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
                                <table id="datatable" class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>회사명</th>
                                            <th>연락처</th>
                                            <th>아이디</th>
                                            <th>이메일</th>
                                            <th>가입일</th>
                                            <th>구독 수</th>
                                            <th>삭제</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody id="dataList">
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="footer-admin mt-auto footer-light">
                    <div class="container-xl px-4">
                        <div class="row">
                            <div class="col-md-6 small">Copyright &copy; Ad-EYE 2023</div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/scripts.js"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <script src="${path}/resources/js/cus.js"></script>
        <script type="text/javascript">
        
     	// 문서준비 완료 되면
        $(document).ready(function() {

            // 유무 page 값 가져오기
            const page = getQueryString('page');

            // page 값 유무로 페이지체크
            getDataList()

        });
        
        // 데이터 목록 가져오기
        function getDataList(){
        	
       		var path = "/member/";
       		var type = "GET";
       		var data = {
    			pageNum : 1,
    			amount : 10,
    			type : "",
    			keyword : ""
    		}
       		
       		ajaxCallBack(path, type, data, function(response){
       			
       			conLog(response)
       			if(response.code == "200") {
       				dataList = response.result;
       	            getDataListCreate();
       			}
       		});
       	}
        
        // 회원삭제
        function dataDel(id){
        	
        	var checkMSG = "삭제하시겠습니까?";
        	if(!confirm(checkMSG)){
        		return
        	}
        	
       		var path = "/member/delete";
       		var type = "GET";
       		var data = {
				mem_id : id
			}
       		
       		ajaxCallBack(path, type, data, function(response){
       			
       			conLog(response)
       			if(response.code == "201") {
       				getDataList()
       				alert("처리가 완료 되었습니다.")
				}
       		});
       	}
        
        let dataList = [];
        function getDataListCreate(){
        	
            createHTML = '';
            
            if (dataList.length === 0) {
                // 데이터가 없는 경우 처리
                createHTML = '<tr><td colspan="7">데이터가 없습니다.</td></tr>';
            } else {
            	dataList.forEach(function(v ) {
	                var timestamp = v.mem_joindate; // 밀리초 단위의 시간 값
	            
	                var date = new Date(timestamp);
	                var year = date.getFullYear();
	                var month = String(date.getMonth() + 1).padStart(2, '0');
	                var day = String(date.getDate()).padStart(2, '0');
	            
	                var formattedDate = year + '-' + month + '-' + day;
	                console.log(formattedDate);
	                var delBtn = '<button class="btn btn-danger btn-sm" onClick="dataDel(\''+ v.mem_id +'\')" type="button ">삭제</button>';
	                createHTML += '<tr><td class="text-primary link-point" style="" onClick="movePath(\'/pages/user_register?id='+v.mem_id+'\')">'+ v.mem_company +'</td><td>'+ v.mem_phone +'</td><td class="text-primary link-point" onClick="movePath(\'/pages/user_register?id='+v.mem_id+'\')">'+ v.mem_id +'</td><td>'+ v.mem_email +'</td><td>'+ formattedDate +'</td><td>'+ 3 +'</td><td>'+ delBtn +'</td></tr>'
	            });
            }
            
            $('#dataList').html(createHTML)
            
        }
        </script>
    </body>
</html>
