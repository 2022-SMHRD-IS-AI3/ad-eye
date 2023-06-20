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
<title>내 구독 목록 - Ad-EYE</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="${path}/resources/css/styles.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="${path}/resources/assets/img/logo.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
		<style>
		.info1 {
			
		}
		</style>
</head>
<body class="nav-fixed">
<!-- * * Tip * * 경로설정 ${path}/resources/ -->
        <nav class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white" id="sidenavAccordion">
            <!-- Sidenav Toggle Button-->
            <button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 me-2 ms-lg-2 me-lg-0" id="sidebarToggle"><i data-feather="menu"></i></button>
            <!-- Navbar Brand-->
            <!-- * * Tip * * You can use text or an image for your navbar brand.-->
            <!-- * * * * * * When using an image, we recommend the SVG format.-->
            <!-- * * * * * * Dimensions: Maximum height: 32px, maximum width: 240px-->
             <a class="navbar-brand pe-3 ps-4 ps-lg-2 link-point" onClick="mySbs()">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-stack" viewBox="0 0 16 16">
                    <path d="m14.12 10.163 1.715.858c.22.11.22.424 0 .534L8.267 15.34a.598.598 0 0 1-.534 0L.165 11.555a.299.299 0 0 1 0-.534l1.716-.858 5.317 2.659c.505.252 1.1.252 1.604 0l5.317-2.66zM7.733.063a.598.598 0 0 1 .534 0l7.568 3.784a.3.3 0 0 1 0 .535L8.267 8.165a.598.598 0 0 1-.534 0L.165 4.382a.299.299 0 0 1 0-.535L7.733.063z"/>
                    <path d="m14.12 6.576 1.715.858c.22.11.22.424 0 .534l-7.568 3.784a.598.598 0 0 1-.534 0L.165 7.968a.299.299 0 0 1 0-.534l1.716-.858 5.317 2.659c.505.252 1.1.252 1.604 0l5.317-2.659z"/>
                  </svg> Ad-EYE</a>
            
            <!-- Navbar Items-->
            <ul class="navbar-nav align-items-center ms-auto">
                <!-- User Dropdown-->
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
                        <a class="dropdown-item" onClick="myInfo()">
                            <div class="dropdown-item-icon"><i data-feather="settings"></i></div>
                            정보수정
                        </a>
                        <a class="dropdown-item" onClick="logout()">
                            <div class="dropdown-item-icon"><i data-feather="log-out"></i></div>
                            로그아웃
                        </a>
                    </div>
                </li>
            </ul>
        </nav>

		<!-- sidenavbar -->
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sidenav shadow-right sidenav-light">
                    <div class="sidenav-menu">
                        <div class="nav accordion" id="accordionSidenav">
                            
                            <!-- (내 구독 확인) -->
                            <div class="nav-link ps-3 pt-5 fw-bolder link-point" onClick="mySbs()" style="font-size: 1rem !important;color: #606060;letter-spacing: 0.05em;">홈으로 이동</div>
                            <div class="sidenav-menu-heading text-sm">내 구독 확인</div>
                            <!-- Sidenav Accordion (Dashboard)-->
                           </div>
                      </div>
                </nav>
            </div>
           
           
           <!-- content -->
            <div id="layoutSidenav_content">
                <main>
                	<header class="page-header pb-10">
                        <div class="container-xl px-4">
                            <div class="page-header-content pt-4">
                                <div class="row align-items-center justify-content-between">
                                    <div class="col-auto mt-4">
                                        <h1 class="page-header-title fw-bolder mb-5">
                                            홈
                                        </h1>
                                        <h1 class="fw-bolder">
                                            <div class="page-header mem_company"></div>
                                        </h1>
                                        <div class="page-header-subtitle">총 구독 수 : <span class="sbs_total"></span> 개</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- Main page content-->
                    <div class="container-xl px-4 mt-n10">
                        <div class="card mb-4">
                            <div class="card-header text-dark fw-bolder fs-3">
	                            <div class="row">
	                                <div class="col-7">내 구독 확인</div>
	                                <div class="col-3">
	                                    <input type="text" class="form-control" id="keyword" placeholder="매체 이름을 검색하세요" onkeypress="submitEnter(event)">
	                                </div>
	                                <div class="col-2 ">
	                                    <button type="button" class="btn btn-dark bi bi-search" onClick="getDataList()">검색</button>
	                                </div>
	                            </div>
	                        </div>
                            <div class="card-body">
                                <table id="datatable" class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>매체 이름</th>
                                            <th>매체 위치</th>
                                            <th class="text-center">광고 노출 인구(명)
                                            <span data-bs-toggle="tooltip" data-bs-placement="top" title="광고물 앞을 지나간 모든 사람의 수"><i data-feather="info"></i></span>
                                            </br>당일 / 누적</th>
                                            <th class="text-center">광고 주목 인구(명)
                                            <span data-bs-toggle="tooltip" data-bs-placement="top" title="광고 노출 인구 중 정면과 측면으로 측정된 사람의 수"><i data-feather="info"></i></span>
                                            </br>당일 / 누적</th>
                                            <th class="text-center">전체 남녀 비율(%)
                                            <span data-bs-toggle="tooltip" data-bs-placement="top" title="광고 노출 인구의 남녀 비율 (남:여)"><i data-feather="info"></i></span>
                                            </br>당일 / 누적</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody id="dataList">
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
            			<nav aria-label="Page navigation" id="page-wrap" class="mt-3"></nav>
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
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <script src="${path}/resources/js/cus.js"></script>
       	<script type="text/javascript">

        	loginSession()
	     	// 문서준비 완료 되면
	        $(document).ready(function() {
	
	        	getDashboardData()
	            getDataList()
	
	        });
        	
        	var page = getQueryString('page') || 1;
	        // 데이터 목록 가져오기
	        function getDataList(){
	        	
	       		var path = "/member/devicelist";
	       		var type = "GET";
	       		var data = {
	    			pageNum : page,
	    			amount : 5,
	    			mem_id : getQueryString('mem_id'),
	    			type : 'A',
	    			keyword : $('#keyword').val()
	    		}
	       		
	       		ajaxCallBack(path, type, data, function(response){
	       			
	       			conLog(response)
	       			if(response.code == "200") {
	       				
	       				$('.mem_company').text(response.result.mem_company)
	       				$('.mem_id').text(getQueryString('mem_id'))
	       				$('.sbs_total').text(response.result.sbs_total)
	       				dataList = response.result.sbs_list;
	       				makePagination(response.pageMaker)
	       	            getDataListCreate();
	       			}
	       		});
	        }
	        
	        let dataList = [];
	        function getDataListCreate(){
	        	
	            var createHTML = '';
	            
	            if (dataList.length === 0) {
	                // 데이터가 없는 경우 처리
	                createHTML = '<tr><td colspan="5">데이터가 없습니다.</td></tr>';
	            } else {
	            	
	            	dataList.forEach(function(v) {
		                
		                
		                // 당일
		                var t_total = v.today_total_man;
		                var t_count1 = v.today_male_cnt;
		                var t_count2 = v.today_female_cnt;
		                var t_per1 = ((t_count1 / t_total) * 100) || 0;
		                var t_per2 = ((t_count2 / t_total) * 100) || 0;
		                var t_per = Math.round(t_per1) + '% : ' +  Math.round(t_per2) + '%';
		                if(t_total == 0) {
		                	t_per	= '-';
		                }
		                
	            		// 누적
		                var total = v.sbs_total_man;
		                var count1 = v.sbs_male_per;
		                var count2 = v.sbs_female_per;
		                var per1 = ((count1 / total) * 100) || 0;
		                var per2 = ((count2 / total) * 100) || 0;
		                var per = Math.round(per1) + '% : ' +  Math.round(per2) + '%';
		                if(total == 0) {
		                	per	= '-';
		                }
		                
		                var man_per = t_per +' / '+ per;
		                
		                var interest = v.today_total_interest +' / '+ v.sbs_total_interest;
		                if(v.today_total_interest == 0 && v.sbs_total_interest == 0) {
		                	interest	= '-';
		                }
		                var man = v.today_total_man +' / '+ v.sbs_total_man;
		                if(v.today_total_man == 0 && v.sbs_total_man == 0) {
		                	man	= '-';
		                }
		                
		                var addrArr = v.sbs_loc.split(",");
		                var sbs_loc = addrArr[0] + (addrArr[1]? ' '+ addrArr[1] : '');
		                
		                var mem_id = getQueryString('mem_id');
		                
		                createHTML += '<tr class="link-point" onClick="movePath(\'/pages/user?mem_id='+ mem_id +'&sbs_seq='+v.sbs_seq+'\')"><td>'+ v.sbs_alias +'</td><td>'+ sbs_loc +'</td><td class="text-center">'+ man +'</td><td class="text-center">'+ interest +'</td><td class="text-center">'+ man_per +'</td></tr>'
		                 
		            });
	            }
	            
	            $('#dataList').html(createHTML)
	            
	            
	        }
	        

            
         	// 데이터 상세 조회
            function getDashboardData(){
            	
	       		var path = "/member/devicelist";
	       		var type = "GET";
	       		var data = {
	    			pageNum : 1,
	    			amount : 500,
	    			mem_id : getQueryString('mem_id')
	    		}
           		
           		ajaxCallBack(path, type, data, function(response){
           			
           			if(response.code == "200") {

           				var sbs_list = response.result.sbs_list;
           				var createNavHTML = '';
        		        var mem_id = getQueryString('mem_id');
           				
           				
           				if(sbs_list.length > 0) {
           					
           					sbs_list.forEach(function(v) {
        	            		
        	            		var active = '';
        		                if(v.sbs_seq == getQueryString('sbs_seq')){
        		                	active = 'active';
        		                }
        		                createNavHTML += '<a class="nav-link link-point collapsed '+ active +'" onClick="movePath(\'/pages/user?mem_id='+ mem_id +'&sbs_seq='+ v.sbs_seq +'\')" data-bs-toggle="collapse" data-bs-target="#collapseDashboards" aria-expanded="false" aria-controls="collapseDashboards">'+ v.sbs_alias + '<div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div></a>';
                                    
        		            });
           				}
           				
           				if($('#accordionSidenav').children().length == 2){
        		            $('#accordionSidenav').append(createNavHTML)
        	            }
           				
           			}
           		});
           	}
	        
	        function pageMove(p){
	        	page = p
	        	getDataList()
	        }
	        
	     	// 엔터 검색
			function submitEnter(e){
				if(e.keyCode === 13) {
					getDataList()
				}
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