<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<title>관리자 대시보드 - Ad-EYE</title>

		<%@ include file="../../includes/header.jsp" %>                
        <style>
            .cnt_size {
                font-size: xxx-large;
            }
            
        </style>
            <!-- content -->
            <div id="layoutSidenav_content">
                <main>
                    <header class="page-header page-header-dark bg-gradient-primary-to-secondary pb-10">
                        <div class="container-xl px-4">
                            <div class="page-header-content pt-4">
                                <div class="row align-items-center justify-content-between">
                                    <div class="col-auto mt-4">
                                        <h1 class="page-header-title fw-bolder">
                                            관리자 홈
                                        </h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- Main page content-->
                    <div class="container-xl px-4 mt-n10">
                        <div class="row">
                            <!-- 읽지 않은 문의글-->
                            <div class="col-xl-4 mb-4">
                                <a class="card lift h-100" href="#!">
                                    <div class="card-body d-flex justify-content-center flex-column" onClick="moveCode('noread')">
                                        <div class="align-items-center text-center">
                                            <div class="text-center">
                                                <p class="fs-4 fw-bolder">읽지 않은 문의 글</p>
                                                <p class="cnt_size contact" style="color: #8572b3;">1/18</p>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <!-- 사용 중인 기기-->
                            <div class="col-xl-4 mb-4">
                                <a class="card lift h-100" href="#!">
                                    <div class="card-body d-flex justify-content-center flex-column" onClick="moveCode('use')">
                                        <div class="align-items-center text-center">
                                            <div class="text-center">
                                                <p class="fs-4 fw-bolder">사용 중인 기기</p>
                                                <p class="cnt_size device" style="color: #3a91dd;">1/18</p>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <!-- 만료 예정 구독 (5일 전)-->
                            <div class="col-xl-4 mb-4">
                                <a class="card lift h-100" href="#!">
                                    <div class="card-body d-flex justify-content-center flex-column" onClick="moveCode('dday')">
                                        <div class="align-items-center text-center">
                                            <div class="text-center">
                                                <p class="fs-4 fw-bolder">만료 예정 구독 (5일 전)</p>
                                                <p class="cnt_size sbs" style="color: #ff6868;">1/18</p>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        
                    </div>
                </main>
		<%@ include file="../../includes/footer.jsp" %>
		<script type="text/javascript">
		// 문서준비 완료 되면
        $(document).ready(function() {

                getDataDetail();

        });
        
     	// 데이터 상세 조회
        function getDataDetail(){
        	
       		var path = "/admin/dashboard";
       		var type = "GET";
       		var data = '';
       		
       		ajaxCallBack(path, type, data, function(response){
       			
       			conLog(response)
       			if(response.code == "200") {
       				var info = response.result;
       			    
       				$('.contact').text(info.contact_noread_cnt +' / '+ info.contact_total);
       				$('.device').text(info.device_use_cnt +' / '+ info.device_total);
       				$('.sbs').text(info.sbs_dday +' / '+ info.sbs_total);
       			}
       		});
       	}
		</script>
    </body>
</html>