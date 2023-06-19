<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>구독 - admin</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
		<%@ include file="../../../../includes/header.jsp" %>           
            <!-- content -->
            <div id="layoutSidenav_content">
                <main>
                    <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                        <div class="container-xl px-4">
                            <div class="page-header-content">
                                <div class="row align-items-center justify-content-between pt-3">
                                    <div class="col-auto mb-3">
                                        <h1 class="page-header-title">
                                            <b>구독 <span class="info-text"></span></b>
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
                                    <div class="card-header text-black">구독 정보</div>
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
                                                    <input class="form-control" id="mem_com_check" type="hidden" name="mem_com_check" value="N" />
                                                </div>
                                                <label for="" id="member_check" class="col-sm-6 col-form-label fw-bolder "></label>
                                            </div>

                                            <!-- 기기 번호-->
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-4">
                                                	<label class="small mb-1" for="device_seq">* 기기</label>
                                                    <select class="form-select" name="device_seq" id="device_seq">
			                                   			<option value="" selected>--- 기기선택 ---</option>
			                                   		</select>
                                                    
                                                </div>
                                            </div>

                                            <!-- 구독 등급-->
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-4">
                                                	<label class="small mb-1" for="sbs_grade">* 구독등급</label>
                                                    <select class="form-select" id="sbs_grade" name="sbs_grade" disabled>
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
                                                <!-- 
                                                <div class="col-md-4">
                                                    <input class="form-control" id="post_num" type="text" name="post_num" placeholder="우편번호" value="" />
                                                </div>
                                                <div class="col-md-3">
                                                    <button onclick="postSearch()" class="btn btn-info w-100" type="button">우편번호 검색</button>
                                                </div> -->
                                                <div class="col-md-7 mt-2">
                                                    <input class="form-control" onclick="postSearch()"  id="addr1" type="text" name="addr1" placeholder="주소 검색" value="" />
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
                                                		<input class="form-control w-50" id="sbs_start_dt" type="text" style="background: #fff;" name="sbs_start_dt" placeholder="0000-00-00" value="" />
                                                		<label class="col-form-label fw-bolder me-3 ms-3"> ~ </label>
                                                    	<input class="form-control w-50" id="sbs_end_dt" type="text" style="background: #fff;" name="sbs_end_dt" placeholder="0000-00-00" value="" />
                                                	</div>
                                                	
                                                </div>
                                            </div>
                                            
                                            <!-- 구독 상태 -->
                                            <div class="mb-3">
                                                <label class="small mb-1">* 구독상태</label>
                                                <br>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" id="sbs_status_y" name="sbs_status" type="radio" value="Y" checked />
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
                                            <button class="btn btn-secondary" type="button" onclick="moveCode('slist')">목록</button>
                                            <div class="submit-btn-wrap">
                                                <button class="btn btn-primary del-btn" onClick="dataSubmit('in')" type="button">등록</button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
		<%@ include file="../../../../includes/footer.jsp" %> 
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
        	 
            // 문서준비 완료 되면
            $(document).ready(function() {

                // 등록, 수정 유무 id 값 가져오기
                const idValue = getQueryString('id');

                // id 값 유무로 등록 수정 판단
                if(idValue){
                	$('.info-text').text('수정');

                    // 삭제, 수정 버튼
                    const changebtn = '<button class="btn btn-danger me-2" onClick="dataSubmit(\'dl\')" type="button ">삭제</button>'+
                      	'<button class="btn btn-primary" onClick="dataSubmit(\'up\')" type="button">수정</button>';
                    $('.submit-btn-wrap').html(changebtn)
                    $('.refresh-btn').addClass('d-none')
                    
                    $('#mem_id').prop('disabled',true);
                    getDataDetail(idValue);
                }else{
                	$('.info-text').text('등록');
                	getDeviceList()
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
           				$('#mem_id').val(info.mem_id);
           				device_seq = info.device_seq;
           				getDeviceList()
           				
           				$("#sbs_grade").val(info.sbs_grade).prop("selected", true);
           				$('#sbs_alias').val(info.sbs_alias);
           				var addrArr = info.sbs_loc.split(",");
           				$('#addr1').val(addrArr[0]);
           				$('#addr2').val(addrArr[1]);
           				
           				if(info.sbs_status === 'N') {
           					$('#sbs_status_n').prop("checked", true);
           				}
           				

           				
    	                var sbs_start_dt = formatDate(info.sbs_start_dt); // 밀리초 단위의 시간 값
    	                var sbs_end_dt = formatDate(info.sbs_end_dt); // 밀리초 단위의 시간 값
    	                $('#sbs_start_dt').val(sbs_start_dt);
           				$('#sbs_end_dt').val(sbs_end_dt);
           				
           				$('#sbs_start_dt').prop('disabled',true);
           				
           			}
           		});
           	}
         	
         	// 기기 미사용 리스트 조회
         	var deviceList = [];
         	var device_seq = 0;
            function getDeviceList(){
            	
            	var path = "/device/simple";
	       		var type = "GET";
	       		var data = {
	    			status : ""
	    		}
           		
           		ajaxCallBack(path, type, data, function(response){
           			
           			conLog(response)
           			if(response.code == "200") {
           				deviceList = [];
           				response.result.forEach(function(v){
           					if(v.device_status == 'N' || v.device_seq == device_seq){
           						
           						deviceList.push({device_seq:v.device_seq, device_uid:v.device_uid});
           					}
           				})
           				
           				if(deviceList.length > 0){
           					deviceListCreate()
           				}
           				
           			}
           		});
           	}
            
            // 기기목록 만들기
            function deviceListCreate(){
            	
            	var deviceHTML = '';
            	if(deviceList.length > 0){
            		deviceList.forEach(function(v){
            			
	            		deviceHTML += '<option value="'+ v.device_seq +'">'+ v.device_uid +'</option>';
            		})
            		
            		conLog(deviceHTML)
            		if(deviceHTML != ''){
            			$('#device_seq').append(deviceHTML);
            			if(device_seq){
            				
            				$("#device_seq").val(device_seq).prop("selected", true);
            			}
            			
            		}
            	}
            	
            }
            
         	
	        // 주소검색 api
            var isPopupOpen = false;
	        function postSearch(){
	        	
	        	if (!isPopupOpen) {
	        	 	 isPopupOpen = true; // 팝업 창이 열린 상태로 변경
		        		new daum.Postcode({
		        	        oncomplete: function(data) {
	        	          	$('#post_num').val(data.zonecode);
	        	          	$('#addr1').val(data.address);
	        	          	$('#addr2').val('').focus();
	        	          	isPopupOpen = false; // 팝업 창이 닫힌 상태로 변경
	        	        },
	        	        onclose: function() {
	        	          	isPopupOpen = false; // 팝업 창이 닫힌 상태로 변경
	        	        }
	        	  	}).open({
	        	        autoClose: false // 팝업 창이 자동으로 닫히지 않도록 설정
	        	  	});
	        	}
	        }
            
         	// 계정 조회
            function memberCheck(){
            	
           		var path = "/member/detail";
           		var type = "GET";
           		var data = {
           			mem_id : $('#mem_id').val()
        		}
           		
           		ajaxCallBack(path, type, data, function(response){
           			
           			conLog(response)
           			if(response.code == "200") {
           				if(response.result == null){
           					$('#member_check').html('<span style="color:#f44336;">존재하지 않는 아이디입니다</span>')
           					$('#mem_com_check').val('N')
           				}else{
           					if(response.result.mem_id == $('#mem_id').val()){
           						$('#member_check').html(response.result.mem_company)
           						$('#mem_com_check').val('Y')
           					}
           				}
           			}
           		});
           	}
            
            // 데이터 전송
            function dataSubmit(flag){
            	
           		var path = "";
           		var type = "POST";
           		var data = null;
           		var msg = "";
           		
            	if(flag == 'dl'){ // 삭제
            		
            		
            		path = "/subscription/delete";
            		type = "GET";
            		data =  {
            			sbs_seq : getQueryString('id')
                  	}
           		
            		msg = "삭제하시겠습니까?";
            	}else if('in' || 'up') { // 등록, 수정
            		
            		
            		
            		data = {
                      	mem_id : $('#mem_id').val(),
                      	sbs_seq : getQueryString('id') || 0,
                      	device_seq : $('#device_seq option:selected').val(),
                      	sbs_grade : $('#sbs_grade option:selected').val(),
                      	sbs_alias : $('#sbs_alias').val(),
                      	sbs_loc : $('#addr1').val() + "," + $('#addr2').val(),
                      	sbs_start_dt : $('#sbs_start_dt').val(),
                      	sbs_end_dt : $('#sbs_end_dt').val(),
                      	sbs_status : $('input[name=sbs_status]:checked').val()
                   	}
            		conLog(data)
            		

            		if($("#mem_id").val()== ""){
                		alert('아이디를 입력해주세요');
                		return
                	}else if($("#device_seq").val()== ""){
                		alert('기기를 선택해주세요');
                		return
                	}else if($("#sbs_grade").val()== ""){
                		alert('등급을 선택해주세요');
                		return
                	}else if($("#sbs_alias").val()== ""){
                		alert('매체이름을 입력해주세요');
                		return
                	}else if($("#addr1").val()== ""){
                		alert('매체위치를 입력해주세요');
                		return
                	}else if($("#sbs_start_dt").val()== ""){
                		alert('구독 시작일을 입력해주세요');
                		return
                	}else if($("#sbs_end_dt").val()== ""){
                		alert('구독 종료일을 입력해주세요');
                		return
               		}
            		
            		if(flag=='in') {
            			path = "/subscription/insert";
            		}else{
            			msg = "수정하시겠습니까?";
            			path = "/subscription/update";
            		}
            		
            	}
            	
            	var cflag = false
            	if(msg != ""){
            		cflag = confirm(msg);
            	}
            	
            	if(msg != "" && cflag == false) {
            		return
            	}
           		
           		ajaxCallBack(path, type, data, function(response){
           			
           			conLog(response)
           			if(flag == 'in'){
           				conLog(12)
           				
    	       			if(response.code == "201") {
    	       				alert("등록 완료되었습니다")
    	       				moveCode('slist');
    	       			}else{
    	       				alert("등록 실패하였습니다")
    	       			}
           				
           			}else if(flag == 'up'){
           				
           				if(response.code == "202") {
    	       				alert("정보수정 완료되었습니다")
    	       				moveCode('slist');
           				}else{
    	       				alert("정보수정 실패하였습니다")
    	       			}
           				
           			}else if(flag == 'dl'){
           				
           				if(response.code == "201") {
    	       				alert("삭제 완료되었습니다")
    	       				moveCode('slist');
           				}else{
    	       				alert("삭제 실패하였습니다")
    	       			}
           				
           			}
           		});
           	}
	        
        </script>
    </body>
</html>
