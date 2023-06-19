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
                                            <b>기기 등록</b>
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
                                    <div class="card-header text-black">기기 정보</div>
                                    <div class="card-body">
                                        <form>
                                            <!-- 시리얼-->
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="device_uid">* 시리얼</label>
                                                    <input class="form-control" id="device_uid" type="text" name="device_uid" placeholder="시리얼" value="" />
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
       		var path = "/device/insert";
       		var type = "POST";
       		var data = {
       			device_uid : $('#device_uid').val(),
                device_onoff : 'N'
            }
        		
	       	if($('#device_uid').val() == ''){
	       		alert("기기 시리얼을 입력해주시기 바랍니다");
	       		return
	       	}
        	
       		ajaxCallBack(path, type, data, function(response){
       			
       			conLog(response)
       				
	       		if(response.code == "201") {
	       			alert("등록 완료되었습니다")
	       			moveCode('dlist');
	       		}else{
	       			alert("등록 실패하였습니다")
	       		}
       		});
       	}
        
        </script>
    </body>
</html>