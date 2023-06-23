<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
        <title>구독 - admin</title>
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
                                            <b>구독 관리</b>
                                        </h1>
                                    </div>
                                    <div class="col-12 col-xl-auto mb-3">
                                        <button class="btn btn-sm btn-light text-primary" onClick="moveCode('sinsert')">
                                            <i class="me-1" data-feather="plus-circle"></i>
                                            구독 등록
                                        </button>
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
                                   			<option value="C">회사명</option>
                                   			<option value="A">매체이름</option>
                                   		</select>
                                    </div>
                                   	<div class="col-md-3">
                                        <input class="form-control" id="keyword" type="text" name="keyword" onkeypress="submitEnter(event)" placeholder="내용을 입력해주세요" value="" />
                                    </div>
                                    
                                    <div class="col-md-2">
                                   		<select class="form-select" name="sbs_grade" id="sbs_grade" disabled>
                                   			<option value="">--- 등급 ---</option>
                                   			<option value="standard" selected>standard</option>
                                   		</select>
                                    </div>
                                    <div class="col-md-2">
                                   		<select class="form-select" name="sbs_status" id="sbs_status">
                                   			<option value="">--- 상태 ---</option>
                                   			<option value="Y">사용</option>
                                   			<option value="N">중지</option>
                                   		</select>
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
                                            <th>회사명</th>
                                            <th>매체 이름</th>
                                            <th class="text-center">구독 등급</th>
                                            <th class="text-center">상태</th>
                                            <th class="text-center">시작일</th>
                                            <th class="text-center">종료일</th>
                                            <th class="text-center">남은 일자</th>
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
        	
        	
       		var path = "/subscription/";
       		var type = "GET";
       		var data = {
    			pageNum : page,
    			amount : 10,
    			type : $('#key').val() || "",
    			keyword : $('input[name=keyword]').val() || "",
    			status : $('#sbs_status').val() || "",
    			grade : $('#sbs_grade').val() || "",
    			seq : getQueryString('ss') || "0"
    		}
       		
       		conLog(data)
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
        	
            createHTML = '';
            
            if (dataList.length === 0) {
                // 데이터가 없는 경우 처리
                createHTML = '<tr><td colspan="8">데이터가 없습니다.</td></tr>';
            } else {
            	dataList.forEach(function(v,idx) {
            		var no = (page - 1) > 0 ? (page - 1) * 10 + (idx+1) : (idx+1);
	                var sbs_start_dt = formatDate(v.sbs_start_dt); // 밀리초 단위의 시간 값
	                var sbs_end_dt = formatDate(v.sbs_end_dt); // 밀리초 단위의 시간 값
	                
	                var dday = v.d_day < 0 ? 0 : v.d_day;
	                dday = dday <= 5 ? '<b style="color:#ff6262;">'+dday+'</b>' : dday
	                var sbs_status = v.sbs_status == 'Y' ? '<b style="color:#98b93a;">사용</b>' : '<b>중지</b>'
	            
	                // var delBtn = '<button class="btn btn-danger btn-sm" onClick="dataDel(\''+ v.mem_id +'\')" type="button ">삭제</button>';
	                createHTML += '<tr><td class="text-center">'+ no +'</td><td>'+ v.mem_company +'</td><td class="text-primary" style="cursor: pointer;" onClick="movePath(\'/pages/admin/sbs/push?id='+v.sbs_seq+'\')">'+ v.sbs_alias +'</td><td class="text-center">'+ v.sbs_grade +'</td><td class="text-center">'+ sbs_status +'</td><td class="text-center">'+ sbs_start_dt +'</td><td class="text-center">'+ sbs_end_dt +'</td><td class="text-center">'+ dday +'</td></tr>'
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
    </body>
</html>
