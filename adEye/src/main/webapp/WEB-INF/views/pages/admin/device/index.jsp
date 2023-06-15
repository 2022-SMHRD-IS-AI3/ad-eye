<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>기기 - admin</title>
		<%@ include file="../../../includes/header.jsp" %>              
            <!-- content -->
            <div id="layoutSidenav_content">
                <main>
                    <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                        <div class="container-fluid px-4">
                            <div class="page-header-content">
                                <div class="row align-items-center justify-content-between pt-3">
                                    <div class="col-auto mb-3">
                                        <h1 class="page-header-title">
                                            <b>기기 목록</b>
                                        </h1>
                                    </div>
                                    <div class="col-12 col-xl-auto mb-3">
                                        <a class="btn btn-sm btn-light text-primary" onClick="moveCode('dinsert')">
                                            <i class="me-1" data-feather="plus-circle"></i>
                                            기기 등록
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- Main page content-->
                    <div class="container-fluid px-4 mb-4">
                        <div class="card">
                            <div class="card-body">
                            	<div class="row gx-3">
                                   	<label for="" class="col-sm-1 col-form-label fw-bolder text-center">검색</label>
                                   	<div class="col-md-2">
                                   		<select class="form-select" name="key" id="key">
                                   			<option value="">--- 선택 ---</option>
                                   			<option value="D">기기시리얼</option>
                                   			<option value="C">회사명</option>
                                   			<option value="A">매체이름</option>
                                   		</select>
                                    </div>
                                   	<div class="col-md-3">
                                        <input class="form-control" id="keyword" type="text" name="keyword" placeholder="내용을 입력해주세요" value="" />
                                    </div>
                                    <div class="col-md-2">
                                   		<button class="btn btn-dark" onClick="getDataList()" id="search_btn">검색</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
 
                    <div class="container-fluid px-4">
                        <div class="card">
                            <div class="card-body">
                                <table id="datatable" class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>기기 번호</th>
                                            <th>시리얼</th>
                                            <th>회사명</th>
                                            <th>매체 이름</th>
                                            <th>전원 상태</th>
                                            <th>로그 확인</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody id="dataList">
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
			<%@ include file="../../../includes/footer.jsp" %> 
			<script type="text/javascript">
	        
	     	// 문서준비 완료 되면
	        $(document).ready(function() {

	            // 유무 page 값 가져오기
	            const page = getQueryString('page');

	            // page 값 유무로 페이지체크
	            getDataList()

	        });

	        var page = getQueryString('page') || 1;
	        // 데이터 목록 가져오기
	        function getDataList(){
	        	
	       		var path = "/device/list";
	       		var type = "GET";
	       		var data = {
	    			pageNum : page,
	    			amount : 10,
	    			type : $('#key').val() || "",
	    			keyword : $('input[name=keyword]').val() || ""
	    		}
	       		
	       		ajaxCallBack(path, type, data, function(response){
	       			
	       			conLog(response)
	       			if(response.code == "200") {
	       				dataList = response.result;
	       	            getDataListCreate();
	       			}
	       		});
	       	}
	        
	        let dataList = [];
	        function getDataListCreate(){
	        	
	            var createHTML = '';
	            
	            if (dataList.length === 0) {
	                // 데이터가 없는 경우 처리
	                createHTML = '<tr><td colspan="6">데이터가 없습니다.</td></tr>';
	            } else {
	            	dataList.forEach(function(v) {
	            		
	            		var red = v.data_check > 0 ? '' : 'style="background: #ffc7c7;""';
	            		var device_onoff = v.device_onoff == 'Y' ? '<span style="color: #9ecd73;font-weight: bolder;">ON</span>' : '<span style="color: #ff5353;font-weight: bolder;">OFF</span>';
		                
		                createHTML += '<tr '+ red +'><td>'+ v.device_seq +'</td><td class="text-primary link-point" onClick="movePath(\'/pages/admin/device/pop?sbs_seq='+v.sbs_seq+'\',\'pop\')">'+ v.device_uid +'</td><td>'+ v.mem_company +'</td><td>'+ v.sbs_alias +'</td><td>'+ device_onoff +'</td><td class="text-primary link-point" onClick="movePath(\'/pages/admin/log?uid='+v.device_uid+'\')">'+ v.data_check +'</td></tr>'
		            });
	            }
	            
	            $('#dataList').html(createHTML)
	            
	        }
			</script>
			
			