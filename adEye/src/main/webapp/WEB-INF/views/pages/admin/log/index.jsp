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
                <select class="form-select" name="key">
                    <option value="">--- 선택 ---</option>
                    <option value="device_num">기기번호</option>
                    <option value="location">매체위치</option>
                </select>
                </div>
                <div class="col-md-2">
                <input class="form-control" type="text" name="keyword" placeholder="내용을 입력해주세요">
                </div>
                
                
            	
                <!-- Date Range Picker Example-->
                <label for="" class="col-sm-1 col-form-label fw-bolder text-center">기간</label>
                <div class="col-md-2">
                <div class="input-group input-group-joined">
                    <input class="form-control ps-0" id="litepickerRangePlugin" placeholder="날짜를 선택하세요">
                    <span class="input-group-text">
                        <i data-feather="calendar"></i>
                    </span>
                </div>
                </div>
                
                <div class="col-md-2">
                <button class="btn btn-dark" id="search_btn">검색</button>
                
            	</div>
                </div>
        </div>
       </div>
      </div>
     
                    <!-- Main page content-->
                    <div class="container-fluid px-4">
                        <div class="card">
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>기기번호</th>
                                            <th>매체위치</th>
                                            <th>로그시간</th>
                                            <th>로그내용</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>기기번호</th>
                                            <th>매체위치</th>
                                            <th>로그시간</th>
                                            <th>로그내용</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>서울 성북구 삼선동1가</td>
                                            <td>2023-05-01 10:12:03</td>
                                            <td>졸려요</td>
                                        </tr>
                                    </tbody>
                                    
                                </table>
                                <div class="d-flex justify-content-end">
                                <button class="btn btn-dark d-none" id="reboot_btn">Reboot</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
		<%@ include file="../../../includes/footer.jsp" %> 
        <script>
        // 검색시 reboot 버튼 생성
         document.getElementById('search_btn').addEventListener('click', function() {
            var key = document.querySelector('select[name="key"]').value;
            var keyword = document.querySelector('input[name="keyword"]').value;

            if (key === 'device_num' || key === 'location') {
                document.getElementById('reboot_btn').classList.remove('d-none');
            } else {
                document.getElementById('reboot_btn').classList.add('d-none');
            }

            // Perform search or other actions...
        });
         </script>
	</body>
</html>