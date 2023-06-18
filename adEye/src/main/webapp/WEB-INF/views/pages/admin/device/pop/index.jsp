<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<meta name="description" content="" />
		<meta name="author" content="" />
		<title>기기 - Ad-EYE</title>
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
<body>

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
                                        <span style="color: rgb(255, 128, 122);">■</span> 
                                        <span>여</span>
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

			<%@ include file="../../../../includes/footer.jsp" %> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" crossorigin="anonymous"></script>
        <script src="${path}/resources/assets/demo/chart-pie-demo.js"></script>
        <script src="${path}/resources/assets/demo/multi-chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
        <script>
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
                	getDataDetail(idValue);
       				$('.mem_id').text(getQueryString('mem_id'))
       				
		            getNowTime() // 4
		            search_date.val(nowDay) // 5
		            
                	
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
           				sbs_start_dt = info.sbs_start_dt;
       					
       					var addrArr = info.sbs_loc.split(",");
       					var sbs_loc = addrArr[0] + (addrArr[1]? ' '+ addrArr[1] : '');
       					$('.sbs_alias').text(info.sbs_alias);
       					$('.sbs_loc').text(sbs_loc);
       					
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
                    url: 'http://211.223.37.186:9000/acq/acqDashboard',
                    type: aType,
                    data: aDatas,
                    // 통신에 성공했을 때 실행할 로직
                    success: function (response) {
                    	conLog(response)
	                	if(response.code == "200") {
	                		
	                		dashboardData = response.result;
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

            changeAPI("userDashboard",getQueryString('sbs_seq'))

	        var changeCheck = true;
	       	function dataChange(){
	        	// 총 유동인구
	        	$('#man_total').text(dashboardData.man_total.toLocaleString())
	        	// 총 주요 시청 횟수
	        	$('#interest_total').text(dashboardData.interest_total.toLocaleString())
	        	if(changeCheck){
	        		pieChart()
	        		multiChart()
	        		changeCheck = false
	        	}else{
	        		rePieChart()
	        		reMultiChart()
	        	}
	        	$('#updateDate').text(getNowTime())
	        }
	        
	        
                
        </script>

    </body>
</html>
