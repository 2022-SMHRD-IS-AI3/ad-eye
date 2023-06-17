<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>회원 - admin</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
		<%@ include file="../../../../includes/header.jsp" %>
		<!-- content -->
		<div id="layoutSidenav_content">
			<main>
				<header
					class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
					<div class="container-xl px-4">
						<div class="page-header-content">
							<div class="row align-items-center justify-content-between pt-3">
								<div class="col-auto mb-3">
									<h1 class="page-header-title">
										<div class="page-header-icon">
											<i data-feather="plus-circle"></i>
										</div>
										회원 <span class="info-text"></span>
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
								<div class="card-header">회원 정보</div>
								<div class="card-body">
									<form>
										<!-- 회사명-->
										<div class="row gx-3 mb-3">
											<div class="col-md-6">
												<label class="small mb-1" for="mem_company">* 회사명</label> <input
													class="form-control" id="mem_company" type="text"
													name="mem_company" placeholder="회사명" value="" />
											</div>
										</div>

										<!-- 아이디-->
										<div class="row gx-3 mb-3">
											<div class="col-md-7">
												<label class="small mb-1" for="mem_id">* 아이디</label>
											</div>
											<div class="col-md-6">
												<input class="form-control" id="mem_id" type="text"
													name="mem_id" placeholder="아이디" value="" />
											</div>
											<div class="col-md-2">
												<button onclick="generateUUID('mem_id')"
													class="btn btn-warning w-100 refresh-btn d-none"
													type="button">새로고침</button>
											</div>
										</div>

										<!-- 비밀번호-->
										<div class="row gx-3 mb-3">
											<div class="col-md-6">
												<label class="small mb-1" for="mem_pw">* 비밀번호</label> <input
													class="form-control" id="mem_pw" type="password"
													name="mem_pw" placeholder="비밀번호" value="1234" />
											</div>
											<div class="col-md-6">
												<br> <span class="text-muted small">* 기본 비밀번호는
													1234 입니다.</span>

											</div>
										</div>

										<!-- 연락처-->
										<div class="row gx-3 mb-3">
											<div class="col-md-6">
												<label class="small mb-1" for="mem_phone">* 연락처</label> <input
													class="form-control" id="mem_phone" type="text"
													name="mem_phone" placeholder="010-1234-1234" value="" />
											</div>
										</div>

										<!-- 이메일-->
										<div class="row gx-3 mb-3">
											<div class="col-md-6">
												<label class="small mb-1" for="mem_email">* 이메일</label> <input
													class="form-control" id="mem_email" type="text"
													name="mem_email" placeholder="abc123@abc.com" value="" />
											</div>
										</div>

										<!-- 주소 -->
										<div class="row gx-3 mb-4">

											<div class="col-md-12">
												<label class="small mb-1" for="">* 주소</label>
											</div>
											<!-- 
                                                <div class="col-md-4">
                                                    <input class="form-control" id="post_num" type="text" name="post_num" placeholder="우편번호" value="" />
                                                </div>
                                                <div class="col-md-3">
                                                    <button onclick="postSearch()" class="btn btn-info w-100" type="button">우편번호 검색</button>
                                                </div> -->
											<div class="col-md-7 mt-2">
												<input class="form-control" onclick="postSearch()"
													id="addr1" type="text" name="addr1" placeholder="주소 검색"
													value="" />
											</div>
											<div class="col-md-7 mt-2">
												<input class="form-control" id="addr2" type="text"
													name="addr2" placeholder="상세주소" value="" />
											</div>
										</div>

										<!-- 계정구분 -->
										<div class="mb-3">
											<label class="small mb-1">* 계정구분</label> <br>
											<div class="form-check form-check-inline">
												<input class="form-check-input" id="admin_n" name="admin_yn"
													type="radio" value="N" checked /> <label
													class="form-check-label" for="admin_n">사용자(N)</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" id="admin_y" name="admin_yn"
													type="radio" value="Y" /> <label class="form-check-label"
													for="admin_y">관리자(Y)</label>
											</div>

										</div>

										<!-- 계정상태 -->
										<div class="mb-3">
											<label class="small mb-1">* 계정상태</label> <br>
											<div class="form-check form-check-inline">
												<input class="form-check-input" id="mem_status_y"
													name="mem_status" type="radio" value="Y" checked /> <label
													class="form-check-label" for="mem_status_y">사용중</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" id="mem_status_n"
													name="mem_status" type="radio" value="N" /> <label
													class="form-check-label" for="mem_status_n">사용중지</label>
											</div>

										</div>

										<!-- Submit button-->


									</form>
								</div>
								<div class="card-footer position-relative">
									<div class="d-flex align-items-center justify-content-between">
										<button class="btn btn-secondary" type="button"
											onclick="moveCode('mlist')">목록</button>
										<div class="submit-btn-wrap">
											<button class="btn btn-primary del-btn"
												onClick="dataSubmit('in')" type="button">등록</button>
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
	<script>
     	// uuid 생성
        function generateUUID(id) {
            const uuid = 'xxxxxxxxxx'.replace(/[xy]/g, function(c) {
                var r = Math.random() * 16 | 0,
                v = c == 'x' ? r : (r & 0x3 | 0x8);
                return v.toString(16);
            });

            $('#'+id).val(uuid)
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

        // 문서준비 완료 되면
        $(document).ready(function() {

            // 등록, 수정 유무 id 값 가져오기
            const idValue = getQueryString('id');

            // id 값 유무로 등록 수정 판단
            if(idValue){
            	$('.info-text').text('정보');
                // 삭제, 수정 버튼
                const changebtn = '<button class="btn btn-danger me-2" onClick="dataSubmit(\'dl\')" type="button ">삭제</button>'+
                   	'<button class="btn btn-primary" onClick="dataSubmit(\'up\')" type="button">수정</button>';
                $('.submit-btn-wrap').html(changebtn)
                
                getDataDetail(idValue);
                $('#mem_id').val(idValue)
                $('input[name=mem_company]').attr('disabled', true);
                $('input[name=admin_yn]').attr('disabled', true);
                $('input[name=mem_id]').attr('disabled', true);
            
            }else{ // 값 없으면 회원 등록
            	$('.info-text').text('등록');
                $('.refresh-btn').removeClass('d-none')
                // uuid 셋팅
                generateUUID('mem_id');
            }

        });
        
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
        
        // 데이터 전송
        function dataSubmit(flag){
        	
       		var path = "";
       		var type = "POST";
       		var data = null;
       		var msg = "";
       		
        	if(flag == 'dl'){ // 삭제
        		
        		
        		path = "/member/delete";
        		type = "GET";
        		data =  {
        			mem_id : $('#mem_id').val()
              	}
       		
        		msg = "삭제하시겠습니까?";
        	}else if('in' || 'up') { // 등록, 수정
        		
        		data = {
                  	mem_id : $('#mem_id').val(),
                   	mem_pw : $('#mem_pw').val(),
                  	mem_company : $('#mem_company').val(),
                  	mem_phone : $('#mem_phone').val(),
                  	mem_email : $('#mem_email').val(),
                   	mem_status : $('input[name=mem_status]:checked').val(),
                   	admin_yn : $('input[name=admin_yn]:checked').val(),
                  	company_addr : $('#addr1').val() + "," + $('#addr2').val()
               	}
        		
	       		if(isObjectEmpty(data)){ // 빈 값 체크
	       			alert("필수 입력정보가 입력되지 않았습니다");
	       			return
	       		}
        	
        		if(flag=='in') {
        			path = "/member/insert";
        		}else{
        			msg = "수정하시겠습니까?";
        			path = "/member/update";
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
       				
	       			if(response.code == "201") {
	       				alert("등록 완료되었습니다")
	       				moveCode('mlist');
	       			}else{
	       				alert("등록 실패하였습니다")
	       			}
       				
       			}else if(flag == 'up'){
       				
       				if(response.code == "202") {
	       				alert("정보수정 완료되었습니다")
	       				moveCode('mlist');
       				}else{
	       				alert("정보수정 실패하였습니다")
	       			}
       				
       			}else if(flag == 'dl'){
       				
       				if(response.code == "201") {
	       				alert("삭제 완료되었습니다")
	       				moveCode('mlist');
       				}else{
	       				alert("삭제 실패하였습니다")
	       			}
       				
       			}
       		});
       	}
        
        </script>
	</body>
</html>
