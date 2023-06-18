<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>로그 - admin</title>
		<%@ include file="../../../includes/header.jsp" %>   
            <!-- header -->
            <div id="layoutSidenav_content">
                <main>
                    <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                        <div class="container-fluid px-4">
                            <div class="page-header-content">
                                <div class="row align-items-center justify-content-between pt-3">
                                    <div class="col-auto mb-3">
                                        <h1 class="page-header-title">
                                            <b>로그 관리</b>
                                        </h1>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- 검색 -->
                    <div class="container-fluid px-4 mb-4">
                        <div class="card">
                            <div class="card-body">
                            	<div class="row gx-3">
                                   	<label for="" class="col-sm-1 col-form-label fw-bolder text-center">검색</label>
                                   	<div class="col-md-2">
						                <select class="form-select" id="key" name="key">
						                    <option value="">--- 선택 ---</option>
						                    <option value="D">기기시리얼</option>
						                    <option value="L">매체위치</option>
						                </select>
                                    </div>
                                   	<div class="col-md-2">
                                        <input class="form-control" id="keyword" type="text" name="keyword" placeholder="내용을 입력해주세요" value="" />
                                    </div>
                                    <div class="col-md-2">
                                   		<button class="btn btn-dark" onClick="getDataList()" id="search_btn">검색</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Main page content-->
                    <div class="container-fluid px-4">
                        <div class="card">
                            <div class="card-body">
                                <table id="datatable" class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                        	<th>No.</th>
                                            <th>기기시리얼</th>
                                            <th>매체위치</th>
                                            <th>로그시간</th>
                                            <th>로그내용</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody id="dataList">
                                        
                                    </tbody>
                                </table>
                                <div class="d-flex justify-content-end">
                                <button class="btn btn-danger d-none" id="reboot_btn" onClick="rebootOn()">Reboot</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <nav aria-label="Page navigation" id="page-wrap" class="mt-3"></nav>
                </main>
		<%@ include file="../../../includes/footer.jsp" %> 
        <script>
    	
     	// 문서준비 완료 되면
        $(document).ready(function() {

            // page 값 유무로 페이지체크
            
            $("#key").val(getQueryString('key') || '').prop("selected", true);
            $('#keyword').val(getQueryString('uid') || '');
            
            getDataList()

        });
        var page = getQueryString('page') || 1;
        // 데이터 목록 가져오기
        function getDataList(){
        	
       		var path = "/device/logList";
       		var type = "GET";
       		var data = {
    			pageNum : page,
    			amount : 10,
    			type : $('#key').val() || "",
    			keyword : $('input[name=keyword]').val() || ""
    		}
       		
       		conLog(data)
       		ajaxCallBack(path, type, data, function(response){
       			
       			conLog(response)
       			if(response.code == "200") {
       				dataList = response.result;
       				makePagination(response.pageMaker)
       	            getDataListCreate();
	       	        if($('#key').val() == 'D' && $('#keyword').val() == dataList[0].device_uid) {
	                 	$('#reboot_btn').removeClass('d-none')
	                }else{
	                	$('#reboot_btn').addClass('d-none')	
	                }
       			}
       		});
       	}

        let dataList = [];
        function getDataListCreate(){
        	
            createHTML = '';
            
            if (dataList.length === 0) {
                // 데이터가 없는 경우 처리
                createHTML = '<tr><td colspan="5">데이터가 없습니다.</td></tr>';
            } else {
            	dataList.forEach(function(v,idx) {
            		var no = (page - 1) > 0 ? (page - 1) * 10 + (idx+1) : (idx+1);

            		var log_dt = formatDate(v.log_dt);
                
                    createHTML += '<tr><td>'+ no +'</td><td>'+ v.device_uid +'</td><td>'+ v.sbs_loc +'</td><td>'+ log_dt +'</td><td>'+ v.log_msg +'</td></tr>'
                });
            }
            
            $('#dataList').html(createHTML)
            
        }
        
		// 재가동 버튼 클릭        
        function rebootOn(){
			
			var device_uid = $('#key').val() && $('input[name=keyword]').val() && $('input[name=keyword]').val() == dataList[0].device_uid ? dataList[0].device_uid : ''
        	var path = "/device/onoff";
       		var type = "POST";
       		var data = {
    			device_uid : device_uid,
    			device_onoff : "R"
    		}
       		
       		conLog(data)
       		ajaxCallBack(path, type, data, function(response){
       			
       			conLog(response)
       			if(response.code == "202") {
       				alert("기기가 재시작 됩니다.")
       			}else{
       				alert("기기 재시작 실패")
       			}
       		});
        }
        
        function pageMove(p){
        	page = p
        	getDataList()
        }
        
        
         </script>
	</body>
</html>