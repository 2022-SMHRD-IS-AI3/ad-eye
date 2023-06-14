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
        <title>구독 - admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="${path}/resources/css/styles.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="${path}/resources/assets/img/logo.png" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
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
                <!-- Navbar Search Dropdown-->
                <!-- * * Note: * * Visible only below the lg breakpoint-->
                <li class="nav-item dropdown no-caret me-3 d-lg-none">
                    <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="searchDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="search"></i></a>
                    <!-- Dropdown - Search-->
                    <div class="dropdown-menu dropdown-menu-end p-3 shadow animated--fade-in-up" aria-labelledby="searchDropdown">
                        <form class="form-inline me-auto w-100">
                            <div class="input-group input-group-joined input-group-solid">
                                <input class="form-control pe-0" type="text" placeholder="검색어를 입력하세요" aria-label="Search" aria-describedby="basic-addon2" />
                                <div class="input-group-text"><i data-feather="search"></i></div>
                            </div>
                        </form>
                    </div>
                </li>
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
            <div id="layoutSidenav_content">
                <main>
                    <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                        <div class="container-xl px-4">
                            <div class="page-header-content">
                                <div class="row align-items-center justify-content-between pt-3">
                                    <div class="col-auto mb-3">
                                        <h1 class="page-header-title">
                                            <div class="page-header-icon"><i data-feather="plus-circle"></i></div>
                                            구독 등록
                                        </h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- Main page content-->
                    <div class="container-xl px-4 mt-4">
                        <div class="row">
                            
                            <div class="col-xl-12">
                                <!-- Account details card-->
                                <div class="card mb-4">
                                    <div class="card-header">구독 정보</div>
                                    <div class="card-body">
                                        <form>

                                            <!-- 아이디-->
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-12">
                                                    <label class="small mb-1" for="mem_id">* 아이디</label>
                                                </div>
                                                <div class="col-md-4">
                                                    <input class="form-control" id="mem_id"  type="text" name="mem_id" placeholder="아이디" value="" />
                                                </div>
                                                <div class="col-md-2">
                                                    <button onclick="memberCheck()" class="btn btn-warning w-100 refresh-btn" type="button">계정 확인</button>
                                                </div>
                                                <label for="" id="member_check" class="col-sm-6 col-form-label fw-bolder "></label>
                                            </div>

                                            <!-- 기기 번호-->
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-4">
                                                	<label class="small mb-1" for="device_seq">* 기기</label>
                                                    <select class="form-select" name="device_seq" id="device_seq">
			                                   			<option value="">--- 기기선택 ---</option>
			                                   			<option value="1">cam_device_001</option>
			                                   			<option value="2">cam_device_002</option>
			                                   		</select>
                                                    
                                                </div>
                                            </div>

                                            <!-- 구독 등급-->
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-4">
                                                	<label class="small mb-1" for="sbs_grade">* 구독등급</label>
                                                    <select class="form-select" name="sbs_grade" disabled>
			                                   			<option value="">--- 등급 ---</option>
			                                   			<option value="standard" selected>standard</option>
			                                   		</select>
                                                    
                                                </div>
                                            </div>

                                            <!-- 매체 이름 -->
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="sbs_alias">* 매체이름</label>
                                                    <input class="form-control" id="sbs_alias" type="text" name="sbs_alias" placeholder="매체 이름" value="" />
                                                </div>
                                            </div>

                                            <!-- 매체 위치 -->
                                            <div class="row gx-3 mb-4">
                                                
                                                <div class="col-md-12">
                                                    <label class="small mb-1" for="">* 매체위치</label>
                                                </div>
                                                
                                                <div class="col-md-4">
                                                    <input class="form-control" id="post_num" type="text" name="post_num" placeholder="우편번호" value="" />
                                                </div>
                                                <div class="col-md-3">
                                                    <button onclick="postSearch()" class="btn btn-info w-100" type="button">우편번호 검색</button>
                                                </div>
                                                <div class="col-md-7 mt-2">
                                                    <input class="form-control" id="addr1" type="text" name="addr1" placeholder="주소" value="" />
                                                </div>
                                                <div class="col-md-7 mt-2">
                                                    <input class="form-control" id="addr2" type="text" name="addr2" placeholder="상세주소" value="" />
                                                </div>
                                            </div>
                                            
                                            <!-- 구독 기간 -->
                                            <div class="row gx-3 mb-3">
                                                <label class="col-md-12 small mb-1" for="">* 구독기간</label>
                                                <div class="col-md-7">
                                                	<div class="d-flex flex-row">
                                                		<input class="form-control w-50" id="sbs_start_dt" type="text" name="sbs_alias" placeholder="0000-00-00" value="" />
                                                		<label class="col-form-label fw-bolder me-3 ms-3"> ~ </label>
                                                    	<input class="form-control w-50" id="sbs_end_dt" type="text" name="sbs_alias" placeholder="0000-00-00" value="" />
                                                	</div>
                                                	
                                                </div>
                                            </div>
                                            
                                            <!-- 구독 상태 -->
                                            <div class="mb-3">
                                                <label class="small mb-1">* 구독상태</label>
                                                <br>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" id="sbs_status_y" name="sbs_status" type="radio" value="Y" checked/>
                                                    <label class="form-check-label" for="sbs_status_y">구독중</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" id="sbs_status_n" name="sbs_status" type="radio" value="N" />
                                                    <label class="form-check-label" for="sbs_status_n">구독중지</label>
                                                </div>
                                            </div>
                                            
                                            

                                            <!-- Submit button-->

                                            
                                        </form>
                                    </div>
                                    <div class="card-footer position-relative">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <button class="btn btn-secondary" type="button" onclick="moveUri('/pages/user_management')">목록</button>
                                            <div class="submit-btn-wrap">
                                                <button class="btn btn-primary del-btn" type="button">등록</button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
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
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/datatables/datatables-simple-demo.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
        <script>
     		// 시작일
     		var sbs_start_dt = document.querySelector('#sbs_start_dt');
            var sbs_end_dt_f = flatpickr(sbs_start_dt,{
                defaultDate: new Date(),
                local: 'ko',
                dateFormat : "Y-m-d",
                onChange: function(selectDates, dateStr, instance){
                    $('#sbs_start_dt').val(dateStr)
                },
            });
            
     		var sbs_end_dt = document.querySelector('#sbs_end_dt');
            var sbs_end_dt_f = flatpickr(sbs_end_dt,{
                local: 'ko',
                dateFormat : "Y-m-d",
                onChange: function(selectDates, dateStr, instance){
                    $('#sbs_end_dt').val(dateStr)
                },
            });
            
        	 // 쿼리스트링 값 가져오기
            function getQueryParameterValue(parameterName) {

                const queryString = window.location.search;
                const urlParams = new URLSearchParams(queryString);
                return urlParams.get(parameterName);

            }
        	 
            // 문서준비 완료 되면
            $(document).ready(function() {

                // 등록, 수정 유무 id 값 가져오기
                const idValue = getQueryString('id');

                // id 값 유무로 등록 수정 판단
                if(idValue){

                    // 삭제, 수정 버튼
                    const changebtn = '<button class="btn btn-danger me-2" type="button ">삭제</button>'+
                            '<button class="btn btn-primary" type="button">수정</button>';
                    $('.submit-btn-wrap').html(changebtn)
                    $('.refresh-btn').addClass('d-none')
                    
                    $('#mem_id').val(idValue);
                    $('#mem_id').prop('disabled',true);
                
                }else{ // 값 없으면 회원 등록

                    // uuid 셋팅
                    generateUUID('sbs_seq');
                }

            });
            
         	// 데이터 상세 조회
            function getDataDetail(id){
            	
           		var path = "/subscription/detail";
           		var type = "GET";
           		var data = {
           			sbs_seq : id
        		}
           		
           		ajaxCallBack(path, type, data, function(response){
           			
           			conLog(response)
           			if(response.code == "200") {
           				var info = response.result;
           				$('#mem_company').val(info.mem_company);
           				$('#mem_pw').val(info.mem_pw);
           				$('#mem_phone').val(info.mem_phone);
           				$('#mem_email').val(info.mem_email);
           				var addrArr = info.company_addr.split(",");
           				$('#addr1').val(addrArr[0]);
           				$('#addr2').val(addrArr[1]);
           				
           				if(info.mem_status === 'N') {
           					$('#mem_status_n').prop("checked", true);
           				}
           				
           				
           			}
           		});
           	}
            
         	
	        // 주소검색 api
	        function postSearch(){
	
	            new daum.Postcode({
	                oncomplete: function(data) {
	                    // $('#post_num').val(data.zonecode)
	                    $('#addr1').val(data.address)
	                    $('#addr2').val('')
	                    $('#addr2').focus()
	                }
	            }).open();
	        }
            
            // 계정유무 확인
            function memberCheck(){

                if($('#mem_id').val() === '11test01') {
                	$('#member_check').html('애드컴퍼니')
                }else{
                	$('#member_check').html('<span style="color:#f44336;">존재하지 않는 아이디입니다</span>')
                }
                
            }
	        
        </script>
    </body>
</html>
