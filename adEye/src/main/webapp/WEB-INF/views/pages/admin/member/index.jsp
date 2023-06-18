<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>회원 - admin</title>
        <style type="text/css">
        	.link-point{
        		cursor: pointer;
        	}
        </style>
		<%@ include file="../../../includes/header.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                        <div class="container-fluid px-4">
                            <div class="page-header-content">
                                <div class="row align-items-center justify-content-between pt-3">
                                    <div class="col-auto mb-3">
                                        <h1 class="page-header-title">
                                            <b>회원 관리</b>
                                        </h1>
                                    </div>
                                    <div class="col-12 col-xl-auto mb-3">
                                        <button class="btn btn-sm btn-light text-primary" onClick="moveCode('minsert')">
                                            <i class="me-1" data-feather="plus-circle"></i>
                                            회원 등록
                                        </button>
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
                                   		<select class="form-select" name="key" id="key" disabled>
                                   			<option value="">--- 선택 ---</option>
                                   			<option value="C" selected>회사명</option>
                                   			
                                   		</select>
                                    </div>
                                   	<div class="col-md-3">
                                        <input class="form-control" id="keyword" type="text" name="keyword" placeholder="내용을 입력해주세요" value="" />
                                    </div>
                                    
                                   <!--  <div class="col-md-2">
                                   		<select class="form-select" name="sbs_grade" disabled>
                                   			<option value="">--- 등급 ---</option>
                                   			<option value="standard" selected>standard</option>
                                   		</select>
                                    </div>
                                    <div class="col-md-2">
                                   		<select class="form-select" name="sbs_status">
                                   			<option value="">--- 상태 ---</option>
                                   			<option value="Y">사용</option>
                                   			<option value="N">중지</option>
                                   		</select>
                                    </div> -->
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
                                            <th>회사명</th>
                                            <th>연락처</th>
                                            <th>아이디</th>
                                            <th>이메일</th>
                                            <th>가입일</th>
                                            <th>구독 수</th>
                                            <th>삭제</th>
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

            // 유무 page 값 가져오기
            const page = getQueryString('page');

            // page 값 유무로 페이지체크
            getDataList()

        });
        var page = getQueryString('page') || 1;
        // 데이터 목록 가져오기
        function getDataList(){
        	
       		var path = "/member/";
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
       				makePagination(response.pageMaker)
       	            getDataListCreate();
       			}
       		});
       	}
        
        // 회원삭제
        function dataDel(id){
        	
        	var checkMSG = "삭제하시겠습니까?";
        	if(!confirm(checkMSG)){
        		return
        	}
        	
       		var path = "/member/delete";
       		var type = "GET";
       		var data = {
				mem_id : id
			}
       		
       		ajaxCallBack(path, type, data, function(response){
       			
       			if(response.code == "201") {
       				getDataList()
       				alert("처리가 완료 되었습니다.")
				}
       		});
       	}
        
        let dataList = [];
        function getDataListCreate(){
        	
            var createHTML = '';
            
            if (dataList.length === 0) {
                // 데이터가 없는 경우 처리
                createHTML = '<tr><td colspan="8">데이터가 없습니다.</td></tr>';
            } else {
            	dataList.forEach(function(v,idx) {
            		var no = (page - 1) > 0 ? (page - 1) * 10 + (idx+1) : (idx+1);
	                var timestamp = v.mem_joindate; // 밀리초 단위의 시간 값
	            
	                var date = new Date(timestamp);
	                var year = date.getFullYear();
	                var month = String(date.getMonth() + 1).padStart(2, '0');
	                var day = String(date.getDate()).padStart(2, '0');
	            
	                var formattedDate = year + '-' + month + '-' + day;
	                
	                var sbs_count = v.mem_pw == null ? 0 : v.mem_pw;
	                
	                var delBtn = '<button class="btn btn-danger btn-sm" onClick="dataDel(\''+ v.mem_id +'\')" type="button ">삭제</button>';
	                createHTML += '<tr><td>'+ no +'</td><td class="text-primary link-point" style="" onClick="movePath(\'/pages/admin/member/push?id='+v.mem_id+'\')">'+ v.mem_company +'</td><td>'+ v.mem_phone +'</td><td class="text-primary link-point" onClick="movePath(\'/pages/admin/member/push?id='+v.mem_id+'\')">'+ v.mem_id +'</td><td>'+ v.mem_email +'</td><td>'+ formattedDate +'</td><td>'+ sbs_count +'</td><td>'+ delBtn +'</td></tr>'
	            });
            }
            
            $('#dataList').html(createHTML)
            
        }
        
        function pageMove(p){
        	page = p
        	getDataList()
        }
        </script>
    </body>
</html>
