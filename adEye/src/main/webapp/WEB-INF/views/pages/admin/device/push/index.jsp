<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>기기 - admin</title>
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
                                            <div class="page-header-icon"><i data-feather="plus-circle"></i></div>
                                            기기 등록
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
                                    <div class="card-header">기기 정보</div>
                                    <div class="card-body">
                                        <form>
                                            <!-- 시리얼-->
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="mem_company">* 시리얼</label>
                                                    <input class="form-control" id="mem_company" type="text" name="mem_company" placeholder="시리얼" value="" />
                                                </div>
                                            </div>

                                            
                                            
                                            <!-- Submit button-->

                                            
                                        </form>
                                    </div>
                                    <div class="card-footer position-relative">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <button class="btn btn-secondary" type="button" onclick="moveCode('dlist')">목록</button>
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
        <script>

        // 문서준비 완료 되면
        $(document).ready(function() {

        });
        
        // 데이터 전송
        function dataSubmit(flag){
        	
       		var path = "";
       		var type = "POST";
       		var data = {
       			device_uid : $('#device_uid').val(),
                device_onoff : 'Y'
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
        		
        	
        	
        	var cflag = false
        	if(msg != ""){
        		cflag = confirm(msg);
        	}
        	
        	if(!cflag) {
        		conLog(123)
        		return
        	}
       		
       		ajaxCallBack(path, type, data, function(response){
       			
       			conLog(response)
       			if(flag == 'in'){
       				
	       			if(response.code == "201") {
	       				alert("회원등록 완료되었습니다")
	       				moveCode('mlist');
	       			}else{
	       				alert("회원등록 실패하였습니다")
	       			}
       				
       			}else if(flag == 'up'){
       				
       				if(response.code == "202") {
	       				alert("회원정보수정 완료되었습니다")
       				}else{
	       				alert("회원정보수정 실패하였습니다")
	       			}
       				
       			}else if(flag == 'dl'){
       				
       				if(response.code == "202") {
	       				alert("회원삭제 완료되었습니다")
	       				moveCode('mlist');
       				}else{
	       				alert("회원삭제 실패하였습니다")
	       			}
       				
       			}
       		});
       	}
        
        </script>
    </body>
</html>