<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>문의 - admin</title>
        <style>
            .con_th {
                background: #efefef !important;
            }
        </style>
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
                                            <b>문의 관리</b>
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
                                    <div class="card-header">문의 상세</div>
                                    <div class="card-body">
                                        
                                        <table class="table table-bordered ">
                                            <tbody>
                                                <tr>
                                                    <th class="border-start-0 text-center w-25 con_th">회사명</th>
                                                    <td>adcompany</td>
                                                </tr>
                                                <tr>
                                                    <th class="border-start-0 text-center con_th">연락처</th>
                                                    <td>adcompany</td>
                                                </tr>
                                                <tr>
                                                    <th class="border-start-0 text-center con_th">이메일</th>
                                                    <td>adcompany</td>
                                                </tr>
                                            </tbody>
                                        </table>

                                        <table class="table table-bordered ">
                                            <tbody>
                                                <tr>
                                                    <th class="border-start-0 text-center w-25 con_th" style="min-height: 300px;height: 300px;">문의 내용</th>
                                                    <td>
                                                        <div id="contact_content" class="text-break">
                                                            
                                                        </div> 
                                                        집에보내줘 집에보내줘 집에보내줘 집에보내줘 집에보내줘 집에보내줘 집에보내줘 집에보내줘 집에보내줘 집에보내줘
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>



                                    </div>
                                    <div class="card-footer position-relative">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <button class="btn btn-secondary" type="button">목록</button>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
			<%@ include file="../../../../includes/footer.jsp" %> 
	</body>
</html>