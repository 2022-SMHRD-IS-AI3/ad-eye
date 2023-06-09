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
                                        <input class="form-control" id="keyword" type="text" name="keyword" onkeypress="submitEnter(event)" placeholder="내용을 입력해주세요" value="" />
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
                                            <th class="text-center">No.</th>
                                            <th>시리얼</th>
                                            <th>회사명</th>
                                            <th>매체 이름</th>
                                            <th class="text-center">전원 ONOFF</th>
                                            <th class="text-center">기기 상태</th>
                                            <th class="text-center">로그 확인</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody id="dataList">
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                   	<nav aria-label="Page navigation" id="page-wrap" class="mt-3"></nav>
					
                </main>
			<%@ include file="../../../includes/footer.jsp" %> 
			<script type="text/javascript">
	        
	     	// 문서준비 완료 되면
	        $(document).ready(function() {

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
	    			keyword : $('input[name=keyword]').val() || "",
	    			status : getQueryString('ds') || ""
	    		}
	       		
	       		ajaxCallBack(path, type, data, function(response){
	       			
	       			conLog(response)
	       			if(response.code == "200") {
	       				dataList = response.result;
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
	                createHTML = '<tr><td colspan="7">데이터가 없습니다.</td></tr>';
	            } else {
	            	dataList.forEach(function(v,idx) {
	            		var no = (page - 1) > 0 ? (page - 1) * 10 + (idx+1) : (idx+1);
	            		var red = v.data_check > 0 ? '' : 'style="background: #ffc7c7;""';
	            		var device_onoff = v.device_onoff == 'Y' ? '<span style="color: #9ecd73;font-weight: bolder;">ON</span>' : v.device_onoff == 'R' ? '<span style="color: #676767;font-weight: bolder;">REBOOT</span>' : '<span style="color: #ff5353;font-weight: bolder;">OFF</span>';
	            		var device_status = v.device_status == 'Y' ? '<span style="color: #9ecd73;font-weight: bolder;">사용중</span>' : '<span style="color: #ff5353;font-weight: bolder;">미사용</span>';
		                
		                createHTML += '<tr '+ red +'><td class="link-point text-center" onClick="movePath(\'/pages/admin/device/pop?sbs_seq='+v.sbs_seq+'\',\'pop\')">'+ no +'</td><td class="link-point" onClick="movePath(\'/pages/admin/device/pop?sbs_seq='+v.sbs_seq+'\',\'pop\')">'+ v.device_uid +'</td><td class="link-point" onClick="movePath(\'/pages/admin/device/pop?sbs_seq='+v.sbs_seq+'\',\'pop\')">'+ v.mem_company +'</td><td class="link-point" onClick="movePath(\'/pages/admin/device/pop?sbs_seq='+v.sbs_seq+'\',\'pop\')">'+ v.sbs_alias +'</td><td class="text-center">'+ device_onoff +'</td><td class="text-center">'+ device_status +'</td><td class="text-primary link-point text-center" onClick="movePath(\'/pages/admin/log?key=D&uid='+v.device_uid+'\')">'+ v.data_check +'</td></tr>'
		            });
	            }
	            
	            $('#dataList').html(createHTML)
	            
	        }
	        
	        function pageMove(p){
	        	page = p
	        	getDataList()
	        }
	        
	        
	    	// input 엔터 이벤트
	    	function submitEnter(e){
	    		if(e.keyCode === 13) {
	    			getDataList()
	    		}
	    	}
			</script>
			
			