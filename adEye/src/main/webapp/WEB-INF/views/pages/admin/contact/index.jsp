<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>문의 - admin</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
		<%@ include file="../../../includes/header.jsp" %>
		<!-- content -->
            <div id="layoutSidenav_content">
                <main class="dataTable-pagination">
                    <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
                        <div class="container-fluid px-4">
                            <div class="page-header-content">
                                <div class="row align-items-center justify-content-between pt-3">
                                    <div class="col-auto mb-3">
                                        <h1 class="page-header-title">
                                            <b>문의 관리</b>
                                        </h1>
                                    </div>
                                    <!-- <div class="col-12 col-xl-auto mb-3">
                                        <a class="btn btn-sm btn-light text-primary" href="#!">
                                            <i class="me-1" data-feather="plus-circle"></i>
                                            회원 등록
                                        </a>
                                    </div> -->
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
                                   			<option value="C">회사명</option>
                                   			<option value="P">연락처</option>
                                   			<option value="E">이메일</option>
                                   			<option value="T">내용</option>
                                   		</select>
                                   		
                                    </div>
                                   	<div class="col-md-2">
                                        <input class="form-control" id="keyword" type="text" name="keyword" placeholder="내용을 입력해주세요" value="" />
                                    </div>
                                   	<div class="col-md-2">
                                   		<select class="form-select" id="contact_open" name="contact_open">
                                   			<option value="">--- 상태 ---</option>
                                   			<option value="Y">확인</option>
                                   			<option value="N">미확인</option>
                                   		</select>
                                   	</div>
                                    <div class="col-md-2">
                                   		<button class="btn btn-dark" onClick="getDataList()" id="search_btn">검색</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Main page content-->
                    <div class="container-fluid px-4 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <table id="datatable" class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                        	<th>No.</th>
                                            <th>회사명</th>
                                            <th>연락처</th>
                                            <th>이메일</th>
                                            <th>내용</th>
                                            <th>날짜</th>
                                            <th>확인</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody id="dataList">
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                   <nav aria-label="Page navigation example">
					  	<ul class="pagination justify-content-center">
					    	<li class="page-item disabled">
					      	<span class="page-link">Previous</span>
					    	</li>
					    	<li class="page-item"><a class="page-link" href="#">1</a></li>
					    	<li class="page-item active" aria-current="page">
					      		<span class="page-link">2</span>
					    	</li>
					    	<li class="page-item"><a class="page-link" href="#">3</a></li>
					    	<li class="page-item">
					      		<a class="page-link" href="#">Next</a>
					    	</li>
					  	</ul>
					</nav>
                </main>
	<%@ include file="../../../includes/footer.jsp" %> 
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script>
	
 	// 문서준비 완료 되면
    $(document).ready(function() {

        // 유무 page 값 가져오기
        const page = getQueryString('page');
        $('#contact_open').val(getQueryString('cs') || '').prop("selected", true);

        // page 값 유무로 페이지체크
        getDataList()

    });
 	
 	
    var page = getQueryString('page') || 1;
    // 데이터 목록 가져오기
    function getDataList(){
    	
   		var path = "/contact/";
   		var type = "GET";
   		var data = {
			pageNum : page,
			amount : 10,
			type : $('#key').val() || "",
			keyword : $('input[name=keyword]').val() || "",
			status : $('#contact_open').val() || ""
		}
   		
   		conLog(data)
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
    	
        createHTML = '';
        
        if (dataList.length === 0) {
            // 데이터가 없는 경우 처리
            createHTML = '<tr><td colspan="7">데이터가 없습니다.</td></tr>';
        } else {
        	dataList.forEach(function(v,idx) {
	        		var no = (page - 1) > 0 ? (page - 1) * 10 + (idx+1) : (idx+1);

        		var contact_dt = formatDate(v.contact_dt);
                var contact_open = v.contact_open == 'Y' ? "<span>확인</span>" : "<span style='color:#ff6262;'>미확인</span>";
            
                // var delBtn = '<button class="btn btn-danger btn-sm" onClick="dataDel(\''+ v.mem_id +'\')" type="button ">삭제</button>';
                createHTML += '<tr><td>'+ no +'</td><td>'+ v.company +'</td><td>'+ v.phone +'</td><td>'+ v.email +'</td><td class="link-point text-primary text-break w-25" onClick="movePath(\'/pages/admin/contact/detail?id='+v.contact_seq+'\')">'+ v.contact_content +'</td><td>'+ contact_dt +'</td><td>'+ contact_open +'</td></tr>'
            });
        }
        
        $('#dataList').html(createHTML)
        
    }
    

	</script>
	</body>
</html>