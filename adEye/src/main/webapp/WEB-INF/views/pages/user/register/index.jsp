	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<html lang="en">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>내 정보 수정 - Ad-EYE</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="${path}/resources/css/styles.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="${path}/resources/assets/img/logo.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
		<style>
		
		</style>
</head>
<body class="nav-fixed">
   	<nav class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white" id="sidenavAccordion">
	   	<button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 me-2 ms-lg-2 me-lg-0" id="sidebarToggle"><i data-feather="menu"></i></button>
	 	<a class="navbar-brand pe-3 ps-4 ps-lg-2 link-point" onClick="mySbs()">
	   		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-stack" viewBox="0 0 16 16">
	     		<path d="m14.12 10.163 1.715.858c.22.11.22.424 0 .534L8.267 15.34a.598.598 0 0 1-.534 0L.165 11.555a.299.299 0 0 1 0-.534l1.716-.858 5.317 2.659c.505.252 1.1.252 1.604 0l5.317-2.66zM7.733.063a.598.598 0 0 1 .534 0l7.568 3.784a.3.3 0 0 1 0 .535L8.267 8.165a.598.598 0 0 1-.534 0L.165 4.382a.299.299 0 0 1 0-.535L7.733.063z"/>
	     		<path d="m14.12 6.576 1.715.858c.22.11.22.424 0 .534l-7.568 3.784a.598.598 0 0 1-.534 0L.165 7.968a.299.299 0 0 1 0-.534l1.716-.858 5.317 2.659c.505.252 1.1.252 1.604 0l5.317-2.659z"/>
  		</svg> Ad-EYE
  	</a>          
    <ul class="navbar-nav align-items-center ms-auto">
      	<li class="nav-item dropdown no-caret dropdown-user me-3 me-lg-4">
          	<a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownUserImage" href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img class="img-fluid" src="${path}/resources/assets/img/user.png" /></a>
             <div class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownUserImage">
                 <h6 class="dropdown-header d-flex align-items-center">
                   	<img class="dropdown-user-img" src="${path}/resources/assets/img/user.png" />
                    <div class="dropdown-user-details">
                    	<div class="dropdown-user-details-name mem_company"></div>
                       	<div class="dropdown-user-details-email mem_id"></div>
                    </div>
                	</h6>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" onClick="myInfo()"><div class="dropdown-item-icon"><i data-feather="settings"></i></div>정보수정</a>
                   	<a class="dropdown-item" onClick="logout()"><div class="dropdown-item-icon"><i data-feather="log-out"></i></div>로그아웃</a>
               	</div>
          	</li>
     	</ul>
	</nav>

 	<div id="layoutSidenav">
     	<div id="layoutSidenav_nav">
           	<nav class="sidenav shadow-right sidenav-light">
               	<div class="sidenav-menu">
                  	<div class="nav accordion" id="accordionSidenav">
                            
                       	<!-- (내 구독 확인) -->
                       	<div class="nav-link ps-3 pt-5 fw-bolder link-point" onClick="mySbs()" style="font-size: 1rem !important;color: #606060;letter-spacing: 0.05em;">홈으로 이동</div>
                      	<div class="sidenav-menu-heading text-sm">내 구독 확인</div>
                   	</div>
              	</div>
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
                                            내 정보 수정
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
                                <div class="card mb-4">
                                    <div class="card-header">내 정보</div>
                                    	<div class="card-body">
                                    	
                                            <!-- 회사명-->
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="mem_company">회사명</label>
                                                    <input class="form-control" id="mem_company" type="text" name="mem_company" placeholder="회사명" value="" disabled />
                                                </div>
                                            </div>

                                            <!-- 아이디-->
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-7">
                                                    <label class="small mb-1" for="mem_id">아이디</label>
                                                </div>
                                                <div class="col-md-6">
                                                    <input class="form-control" id="mem_id"  type="text" name="mem_id" placeholder="아이디" value="" disabled />
                                                </div>
                                                <div class="col-md-2">
                                                    <button onclick="generateUUID('mem_id')" class="btn btn-warning w-100 refresh-btn d-none" type="button">새로고침</button>
                                                </div>
                                            </div>

                                            <!-- 비밀번호-->
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="mem_pw">* 비밀번호</label>
                                                    <input class="form-control" id="mem_pw" type="password" name="mem_pw" placeholder="비밀번호" value="1234" />
                                                </div>
                                            </div>

                                            <!-- 연락처-->
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="mem_phone">* 연락처</label>
                                                    <input class="form-control" id="mem_phone" type="text" name="mem_phone" oninput="formatPhoneNumber(this)" placeholder="010-1234-1234" value="" maxlength="13" />
                                                </div>
                                            </div>

                                            <!-- 이메일-->
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="mem_email">* 이메일</label>
                                                    <input class="form-control" id="mem_email" type="text" name="mem_email" placeholder="abc123@abc.com" value="" />
                                                </div>
                                            </div>

                                            <!-- 주소 -->
                                            <div class="row gx-3 mb-4">
                                                
                                                <div class="col-md-12">
                                                    <label class="small mb-1" for="">* 주소</label>
                                                </div>
                                                <div class="col-md-7 mt-2">
                                                    <input class="form-control" onclick="postSearch()"  id="addr1" type="text" name="addr1" placeholder="주소 검색" value="" />
                                                </div>
                                                <div class="col-md-7 mt-2">
                                                    <input class="form-control" id="addr2" type="text" name="addr2" placeholder="상세주소" value="" />
                                                </div>
                                            </div>
                                            
                                          	<input id="mem_status" name="mem_status" type="hidden" value=""/>
                                            
                                    	</div>
	                                    <div class="card-footer position-relative">
	                                        <div class="d-flex align-items-center justify-content-between">
	                                            <button class="btn btn-secondary" type="button" onclick="back()">뒤로</button>
	                                            <div class="submit-btn-wrap">
	                                                <button class="btn btn-primary del-btn" onClick="dataSubmit()" type="button">수정</button>
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
        <script src="${path}/resources/js/cus.js"></script>
        <script>
        loginSession()
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

        // 문서준비 완료 되면
        $(document).ready(function() {
        	const idValue = getQueryString('mem_id');

            // id 값 유무로 등록 수정 판단
            if(idValue){
            	
            	getDashboardData(idValue);
            	getDataDetail(idValue);
   				$('.mem_id').text(getQueryString('mem_id'))
            	
            }
        });

     	// 데이터 상세 조회
        function getDashboardData(id){
        	
       		var path = "/member/devicelist";
       		var type = "GET";
       		var data = {
    			pageNum : 1,
    			amount : 500,
    			mem_id : id
    		}
       		
       		ajaxCallBack(path, type, data, function(response){
       			
       			if(response.code == "200") {
       				$('.mem_company').text(response.result.mem_company)
       				$('.mem_id').text(id)

       				dataList = response.result.sbs_list;
       				getDataListCreate()
       				
       				if (dataList.length > 0) {

       					var sbs_alias = "";
       					dataList.forEach(function(v) {
       						
       						if(v.sbs_seq == id){
       							sbs_alias = v.sbs_alias
       						}
                                
    		            });
       					
       					$('.sbs_alias').text(sbs_alias);
    	            	
    	            }
       				
       			}
       		});
       	}
    
	 	// 데이터 상세 조회
	    function getDataDetail(id){
	    	
	   		var path = "/member/detail";
	   		var type = "GET";
	   		var data = {
	   			mem_id : id
			}
	   		
	   		ajaxCallBack(path, type, data, function(response){
	   			
	   			conLog(response)
	   			if(response.code == "200") {
	   				var info = response.result;
	   				$('#mem_company').val(info.mem_company);
	   				$('#mem_id').val(info.mem_id);
	   				$('#mem_pw').val(info.mem_pw);
	   				$('#mem_phone').val(info.mem_phone);
	   				$('#mem_email').val(info.mem_email);
	   				$('#mem_status').val(info.mem_status);
	   				var addrArr = info.company_addr.split(",");
	   				$('#addr1').val(addrArr[0]);
	   				$('#addr2').val(addrArr[1]);
	   				
	   			}
	   		});
	   	}
     	
        let dataList = [];
        function getDataListCreate(){
        	
            var createNavHTML = '';
	        var mem_id = getQueryString('mem_id');
            
            if (dataList.length > 0) {
                // 데이터가 없는 경우 처리
            	dataList.forEach(function(v) {
	                
	                createNavHTML += '<a class="nav-link link-point collapsed" onClick="movePath(\'/pages/user?mem_id='+ mem_id +'&sbs_seq='+ v.sbs_seq +'\')" data-bs-toggle="collapse" data-bs-target="#collapseDashboards" aria-expanded="false" aria-controls="collapseDashboards">'+ v.sbs_alias + '<div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div></a>';
                        
	            });
            }
            
            $('#accordionSidenav').append(createNavHTML)
            
}
        
        // 데이터 전송
        function dataSubmit(){
        	

        	if($("#mem_pw").val()== ""){
        		alert('비밀번호를 입력해주세요');
        		return
        	}else if($("#mem_phone").val()== ""){
        		alert('연락처를 입력해주세요');
        		return
        	}else if($("#mem_email").val()== ""){
        		alert('이메일을 입력해주세요');
        		return
        	}else if($("#addr1").val()== ""){
        		alert('주소를 입력해주세요');
        		return
       		}
        	
        	if(!confirm("수정하시겠습니까?")) {
        		return
        	}
        	
       		var path = "/member/update";
       		var type = "POST";
       		var data = {
              	mem_id : $('#mem_id').val(),
               	mem_pw : $('#mem_pw').val(),
              	mem_company : $('#mem_company').val(),
             	mem_phone : $('#mem_phone').val(),
              	mem_email : $('#mem_email').val(),
              	mem_status : $('#mem_status').val(),
               	company_addr : $('#addr1').val() + "," + $('#addr2').val()
           	}
       		
       		ajaxCallBack(path, type, data, function(response){
       			
       			conLog(response)
       				
       			if(response.code == "202") {
	       			alert("정보수정 완료되었습니다")
	       			location.reload();
       			}else{
	       			alert("정보수정 실패하였습니다")
	       		}
       				
       				
       		});
       	}
        
        // 내 정보 수정 페이지 이동
       	function myInfo(){
       		movePath('/pages/user/register?mem_id='+ getQueryString('mem_id'));
       	}
       	
        // 내 구독 목록 페이지 이동
       	function mySbs(){
       		movePath('/pages/user/dashboard?mem_id='+ getQueryString('mem_id'));
       	}
       	
     	
     	
        </script>
        
    </body>
</html>