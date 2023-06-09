<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<html lang="en">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>대시보드 - Ad-EYE</title>
    	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="${path}/resources/css/styles.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="${path}/resources/assets/img/logo.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
		<style>
	        .dateSelector{
	            width: 8rem;
	            text-align: center;
	            border: none;
	            background: none;
	            color: #777777;
	            outline: none;
	        }
	        #man_total, #interest_total {
	        	font-size: 3.3rem !important;
    			font-weight: 700 !important;
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
                <li class="nav-item  me-3 me-lg-4"><span class="fw-bolder sbs_alias"></span></li>
                <li class="nav-item  me-3 me-lg-4 sbs_period"></li>
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
                           </div>
                      </div>
                </nav>
            </div>

        <!-- content -->
            <div id="layoutSidenav_content">
                <main>

                    <!-- 날짜 이동 -->
                    <header class="page-header pb-10">
                        <div class="container-xl px-4">
                            <div class="pt-2 pb-3">
                                <div class="row align-items-center justify-content-between">
                                    <div class="col-auto mt-4">
                                        <h1 class="sbs_alias fw-bolder fs-1"></h1>
                                        <h7 class="sbs_loc"></h7>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="container-xl px-4">
                            <div class=" pt-4">
                                <div class="row align-items-center justify-content-between">
                                    <div class="col-md-12 text-end text-muted small">
		                                <span>최근 업데이트 날짜</span>
		                                ·
		                                <span id="updateDate"></span>
		                            </div>
                                </div>
                            </div>
                        </div>
                        <div class="container-xl px-4 text-lg mb-3">
                            <div class="text-center">
                                <div class="">
                                    <i class="fa-solid fa-chevron-left" onclick="changeDay('m')"></i>
                                    <input type="text" class="dateSelector"/>
                                    <input type="hidden" name="search_date" id="search_date">
                                    <i class="fa-solid fa-chevron-right" onclick="changeDay('p')"></i>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- 날짜 이동 끝 -->

                    <!-- Main page content-->
                    <div class="container-xl px-4 mt-n10">

                        <!-- 멀티 그래프 -->
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="chart-area">
                                    <canvas id="myCombinedChart" width="100%" height="30"></canvas>
                                </div>
                                <div class="mt-5 text-muted text-center fw-700">
                                    <span style="color: #0061f2;">■</span> 
                                	<span>시간 별 광고 노출 인구 (명)</span>
                                    <span style="color: #a9cd3e;">■</span>
                                    <span>시간 별 광고 주목 인구 (명)</span>
                                </div>
                            </div>
                        </div>
                        <!-- 멀티 그래프 끝 -->

                        <div class="row">

                            <!-- 남여 파이 그래프  -->
                            <div class="col-lg-6">
                                <!-- Pie chart example-->
                                <div class="card mb-4">
                                    <div class="card-body">
                                        <div class="chart-pie">
                                            <canvas id="myPieChart" width="100%" height="50"></canvas>
                                        </div>
                                        <div class="mt-5 text-muted text-center fw-500">
		                                	<span>총 광고 노출 인구 남녀 비율</span>
		                                </div>                                        
                                    </div>
                                    <div class="card-footer small text-center text-muted">
                                        <span style="color: rgb(54, 162, 235);">■</span> 
                                        <span>남</span>
                                        <span class="male_total_cnt"></span>
                                        <span style="color: rgb(255, 128, 122);">■</span> 
                                        <span>여</span>
                                        <span class="female_total_cnt"></span>
                                    </div>
                                </div>
                            </div>
                            <!-- 남여 파이그래프 끝  -->

                            <!-- 총 유동인구 주요시청횟수 -->
                            <div class="col-lg-6 mb-4">
                                <div class="card h-100 pt-4 p-3">
                                    <div class="mb-4">

                                        <div class="card border-start-lg border-start-primary h-100">
                                            <div class="card-body">
                                                <div class="d-flex align-items-center">
                                                    <div class="flex-grow-1">
                                                        
                                                        <div class="h1 text-center">
                                                            <span id="man_total">0</span> 명
                                                        </div>
                                                        <h4 class="text-success text-center  fw-bolder">총 광고 노출 인구
                                                            </h4>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="">

                                        <div class="card border-start-lg border-start-primary h-100">
                                            <div class="card-body">
                                                <div class="d-flex align-items-center">
                                                    <div class="flex-grow-1">
                                                        
                                                        <div class="h1 text-center">
                                                            <span id="interest_total">0</span> 명
                                                        </div>
                                                        <h4 class="text-success text-center  fw-bolder">총 광고 주목 인구
                                                            </h4>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                

                            </div>
                            <!-- 총 유동인구 주요시청횟수 끝 -->

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
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
        <script src="${path}/resources/assets/demo/chart-pie-demo.js"></script>
        <script src="${path}/resources/assets/demo/multi-chart.js"></script>
        <script src="${path}/resources/js/cus.js"></script>
        <script>
        	loginSession()
        	var nowDay = "" // 1
            var search_date = $('#search_date') // 2
            var dateSelector = document.querySelector('.dateSelector'); // 3
            var te = null;
            

            // 화살표꺽쇠 날짜 변경
            function changeDay(c){

                var cDate = new Date(search_date.val())
                sDate = new Date(formatDate(sbs_start_dt))
                var gDate = new Date(cDate);
                
                var chflag = false
                if(c === 'm' && sDate < cDate){
                    gDate.setDate(cDate.getDate() - 1)
                    chflag = true
                }else if(c === 'p' &&  search_date.val() != nowDay){
                    gDate.setDate(cDate.getDate() + 1)
                    
                    chflag = true
                }
                
                if(chflag){
	                search_date.val(getYMD(gDate));
	                te.setDate(getYMD(gDate))
	                changeAPI('userDashboard', getQueryString('sbs_seq'))
                	
                }
                
            }

            function getYMD(d){

                var year = d.getFullYear();
                var month = ('0' + (d.getMonth() + 1)).slice(-2);
                var day = ('0' + d.getDate()).slice(-2);

    
                nowDay = year+"-"+month+"-"+day
                
                return nowDay;
            }
            
            function getNowTime(){
                var today = new Date();	// 현재 날짜 및 시간
                var year = today.getFullYear();
                var month = ('0' + (today.getMonth() + 1)).slice(-2);
                var day = ('0' + today.getDate()).slice(-2);

                var hours = ('0' + today.getHours()).slice(-2); 
                var minutes = ('0' + today.getMinutes()).slice(-2);
                var seconds = ('0' + today.getSeconds()).slice(-2); 
	            var nowTime = year +"년 "+ month +"월 "+ day +"일 "+ hours +":"+ minutes + ":" +seconds
	            nowDay = year+"-"+month+"-"+day
                dateObj = {
                    year : year,
                    month : month,
                    day : day
                }  

                return nowTime;
            }
            
            
            
            document.getElementById('updateDate').innerText = getNowTime()
			var dashboardData = {}

            // 문서준비 완료 되면
            $(document).ready(function() {
            	const idValue = getQueryString('sbs_seq');

            	
                // id 값 유무로 등록 수정 판단
                if(idValue){
                	
                	getDataDetail(idValue)
                	getDashboardData(idValue);
                	

                	
       				$('.mem_id').text(getQueryString('mem_id'))
       				
		            getNowTime() // 4
		            search_date.val(nowDay) // 5
		            
                	changeAPI("userDashboard", idValue);
       				
                	// 5초마다 실행
                	setInterval(function() {
                	  changeAPI("userDashboard", idValue);
                	//}, 60000);
                	}, 10000);
                }
                
			});
            
            let sbs_start_dt = ''
            let sbs_end_dt = ''
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
           				var dday = info.d_day <= 0 ? 0 : info.d_day;
           				sbs_start_dt = info.sbs_start_dt;
           				
           				var period = '<span class="text-muted">'+ formatDate(info.sbs_start_dt) +' ~ '+ formatDate(info.sbs_end_dt) +'</span> <span class="text-danger fw-bolder">('+ info.d_day +'일)</span>';
           				$('.sbs_period').html(period);
           				
           				conLog(sbs_start_dt)
           				te = flatpickr(dateSelector,{ // 6
           	                defaultDate: $('#search_date').val(),
           	                local: 'ko',
           	                enable: [
           	                    {
           	                      from: formatDate(new Date(sbs_start_dt)),
           	                      to: new Date()
           	                    },
           	                ],
           	                dateFormat : "Y-m-d",
           	                onChange: function(selectDates, dateStr, instance){
           	                	
           	                    $('#search_date').val(dateStr)
           	                    changeAPI('userDashboard', getQueryString('sbs_seq'))
           	                },
           	            });
           			}
           		});
           	}
            
         	// 데이터 상세 조회
            function getDashboardData(id){
            	
	       		var path = "/member/devicelist";
	       		var type = "GET";
	       		var data = {
	    			pageNum : 1,
	    			amount : 500,
	    			mem_id : getQueryString('mem_id')
	    		}
           		
           		ajaxCallBack(path, type, data, function(response){
           			
           			if(response.code == "200") {
           				$('.mem_company').text(response.result.mem_company)
	       				$('.mem_id').text(getQueryString('mem_id'))

           				dataList = response.result.sbs_list;
           				getDataListCreate()
           				
           				if (dataList.length > 0) {

           					var sbs_alias = "";
           					var sbs_loc = "";
           					dataList.forEach(function(v) {
           						
           						if(v.sbs_seq == id){
           							sbs_alias = v.sbs_alias
           							var addrArr = v.sbs_loc.split(",");
           			                sbs_loc = addrArr[0] + (addrArr[1]? ' '+ addrArr[1] : '');
           						}
                                    
        		            });
           					
           					$('.sbs_alias').text(sbs_alias);
           					$('.sbs_loc').text(sbs_loc);
        	            	
        	            }
           				
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
	            		
	            		var active = '';
		                if(v.sbs_seq == getQueryString('sbs_seq')){
		                	active = 'active';
		                }
		                createNavHTML += '<a class="nav-link link-point collapsed '+ active +'" onClick="movePath(\'/pages/user?mem_id='+ mem_id +'&sbs_seq='+ v.sbs_seq +'\')" data-bs-toggle="collapse" data-bs-target="#collapseDashboards" aria-expanded="false" aria-controls="collapseDashboards">'+ v.sbs_alias + '<div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div></a>';
                            
		            });
	            }
	            
	            $('#accordionSidenav').append(createNavHTML)
	            
	            
	        }
            
            const changeAPI = (code,val) => {
            	
                let aDatas
                let aUri = ""
                let aType = ""
            
                if(code == "userDashboard"){
                    aUri = "/acq/acqDashboard"
                    aType = "GET"
                    aDatas = "sbs_seq="+ val +"&search_date="+$('#search_date').val()
                }
                // ajax문
                $.ajax({ // url, success, error 는 무조건 있어야한다
                    // 어디랑 통신 할건지
                    url: url+'/acq/acqDashboard',
                    type: aType,
                    data: aDatas,
                    // 통신에 성공했을 때 실행할 로직
                    success: function (response) {
                    	conLog(response)
	                	if(response.code == "200") {
	                		
	                		dashboardData = response.result;
	                		getNowTime()
	                		var t = dashboardData.update_time != null ? korTimeChange(dashboardData.update_time) : '-'
	        	        	$('#updateDate').text(t)
	                		dataChange()
	                		
	                	}
                        
                        dataChange()
                    },
                    // 통신에 실패했을 때 실행할 로직
                    error: function () {
                        alert('통신실패');
                    }
                })
            }

	        var changeCheck = true;
	       	function dataChange(){
	       		var d = dashboardData
	        	// 총 유동인구
	        	$('#man_total').text(d.man_total.toLocaleString())
	        	// 총 주요 시청 횟수
	        	$('#interest_total').text(d.interest_total.toLocaleString())
	        	
	        	if(d.man_total > 0){
	        		
		        	var total = d.man_total;
		        	var count1 = d.male_total_cnt;
			        var count2 = d.female_total_cnt;
	
		        	var mtc = count1.toLocaleString()+'명';
		        	var ftc = count2.toLocaleString()+'명';
		        	
			        var mtc_per = Math.round((((count1 / total) * 100) || 0))+ '%';
			        var ftc_per = Math.round((((count2 / total) * 100) || 0))+ '%';
		        	
		        	var mtcSpan = ' - '+ mtc +' ('+ mtc_per +')' ; 
		        	var ftcSpan = ' - '+ ftc +' ('+ ftc_per +')' ; 
		        	$('.male_total_cnt').text(mtcSpan)
		        	$('.female_total_cnt').text(ftcSpan)
	        	}else{
	        		$('.male_total_cnt').text('')
		        	$('.female_total_cnt').text('')
	        	}
	        	if(changeCheck){
	        		pieChart()
	        		multiChart()
	        		changeCheck = false
	        	}else{
	        		rePieChart()
	        		reMultiChart()
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
