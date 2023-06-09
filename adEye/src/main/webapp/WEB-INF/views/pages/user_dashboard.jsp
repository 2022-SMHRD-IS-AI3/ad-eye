<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<html lang="en">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>대시보드 - Ad-EYE</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="${path}/resources/css/styles.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="${path}/resources/assets/img/logo.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
		<style>
		
		</style>
</head>
<body class="nav-fixed">
<!-- * * Tip * * 경로설정 ${path}/resources/ -->
        <nav class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-light bg-white" id="sidenavAccordion">
            <!-- Sidenav Toggle Button-->
            <button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 me-2 ms-lg-2 me-lg-0" id="sidebarToggle"><i data-feather="menu"></i></button>
            <!-- Navbar Brand-->
            <!-- * * Tip * * You can use text or an image for your navbar brand.-->
            <!-- * * * * * * When using an image, we recommend the SVG format.-->
            <!-- * * * * * * Dimensions: Maximum height: 32px, maximum width: 240px-->
            <a class="navbar-brand pe-3 ps-4 ps-lg-2"  href="#!">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-stack" viewBox="0 0 16 16">
                    <path d="m14.12 10.163 1.715.858c.22.11.22.424 0 .534L8.267 15.34a.598.598 0 0 1-.534 0L.165 11.555a.299.299 0 0 1 0-.534l1.716-.858 5.317 2.659c.505.252 1.1.252 1.604 0l5.317-2.66zM7.733.063a.598.598 0 0 1 .534 0l7.568 3.784a.3.3 0 0 1 0 .535L8.267 8.165a.598.598 0 0 1-.534 0L.165 4.382a.299.299 0 0 1 0-.535L7.733.063z"/>
                    <path d="m14.12 6.576 1.715.858c.22.11.22.424 0 .534l-7.568 3.784a.598.598 0 0 1-.534 0L.165 7.968a.299.299 0 0 1 0-.534l1.716-.858 5.317 2.659c.505.252 1.1.252 1.604 0l5.317-2.659z"/>
                  </svg> Ad-EYE</a>
            
            <!-- Navbar Items-->
            <ul class="navbar-nav align-items-center ms-auto">
                <!-- User Dropdown-->
                <li class="nav-item dropdown no-caret dropdown-user me-3 me-lg-4">
                    <a class="btn btn-icon btn-transparent-dark dropdown-toggle" id="navbarDropdownUserImage" href="javascript:void(0);" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img class="img-fluid" src="${path}/resources/assets/img/user.png" /></a>
                    <div class="dropdown-menu dropdown-menu-end border-0 shadow animated--fade-in-up" aria-labelledby="navbarDropdownUserImage">
                        <h6 class="dropdown-header d-flex align-items-center">
                            <img class="dropdown-user-img" src="${path}/resources/assets/img/user.png" />
                            <div class="dropdown-user-details">
                                <div class="dropdown-user-details-name">서울교통공사</div>
                                <div class="dropdown-user-details-email">is2u111</div>
                            </div>
                        </h6>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#!">
                            <div class="dropdown-item-icon"><i data-feather="settings"></i></div>
                            정보수정
                        </a>
                        <a class="dropdown-item" href="#!">
                            <div class="dropdown-item-icon"><i data-feather="log-out"></i></div>
                            로그아웃
                        </a>
                    </div>
                </li>
            </ul>
        </nav>

		<!-- sidenavbar -->
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sidenav shadow-right sidenav-light">
                    <div class="sidenav-menu">
                        <div class="nav accordion" id="accordionSidenav">
                            
                            <!-- Sidenav Menu Heading (내 구독 확인)-->
                            <div class="sidenav-menu-heading">내 구독 확인</div>
                            <!-- Sidenav Accordion (Dashboard)-->
                            <a class="nav-link collapsed" href="#!" data-bs-toggle="collapse" data-bs-target="#collapseDashboards" aria-expanded="false" aria-controls="collapseDashboards">
                                한성대 입구역 1번 출구 1
                                <div class="sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                           </div>
                      </div>
                </nav>
            </div>

        <!-- content -->
            <div id="layoutSidenav_content">
                <main>
                    <header class="page-header pb-10">
                        <div class="container-xl px-4">
                            <div class="page-header-content pt-4">
                                <div class="row align-items-center justify-content-between">
                                    <div class="col-auto mt-4">
                                        <h1 class="page-header-title">
                                            한성대 입구역 1번 출구 1
                                        </h1>
                                        <div class="page-header-subtitle">
                                        	<i class="fa-solid fa-chevron-left"></i>
                                            오늘 날짜
                                            <i class="fa-solid fa-chevron-right"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </header>
                    <!-- Main page content-->
                    <div class="container-xl px-4 mt-n10">
                        <!-- Area chart example-->
                        <div class="card mb-4">
                            <div class="card-header">Area Chart Example</div>
                            <div class="card-body">
                                <div class="chart-area"><canvas id="myCombinedChart" width="100%" height="30"></canvas></div>
                            </div>
                            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                        </div>
                        
                        <div class="row">
                            <!-- <div class="col-lg-6"> -->
                                
                                <!-- Bar chart example
                                <div class="card mb-4">
                                    <div class="card-header">Bar Chart Example</div>
                                    <div class="card-body">
                                        <div class="chart-bar"><canvas id="myBarChart" width="100%" height="50"></canvas></div>
                                    </div>
                                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                                </div>
                            </div> -->
                            
                            <div class="col-lg-6">
                                <!-- Pie chart example-->
                                <div class="card mb-4">
                                    <div class="card-header">Pie Chart Example</div>
                                    <div class="card-body">
                                        <div class="chart-pie"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                    </div>
                                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                                </div>
                            </div>
                            
                            <div class="col-xl-3 col-md-6 mb-4">
                                
                                <!-- Dashboard info widget 1-->
                                <div class="card border-start-lg border-start-primary h-100">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div class="flex-grow-1">
                                                <div class="small fw-bold text-primary mb-1">Earnings (monthly)</div>
                                                <div class="h5">$4,390</div>
                                                <div class="text-xs fw-bold text-success d-inline-flex align-items-center">
                                                    <i class="me-1" data-feather="trending-up"></i>
                                                    12%
                                                </div>
                                            </div>
                                            <div class="ms-2"><i class="fas fa-dollar-sign fa-2x text-gray-200"></i></div>
                                        </div>
                                    </div>
                                </div>
                             
                            </div>
                            
                        </div>
                        
                        </div>
                        
                </main>

                <footer class="footer-admin mt-auto footer-light">
                    <div class="container-xl px-4">
                        <div class="row">
                            <div class="col-md-6 small">Copyright &copy; Ad-EYE 2023</div>
                            <div class="col-md-6 text-md-end small">
                                <a href="#!">Privacy Policy</a>
                                &middot;
                                <a href="#!">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" crossorigin="anonymous"></script>
        <%-- <script src="${path}/resources/assets/demo/chart-area-demo.js"></script> --%>
        <%-- <script src="${path}/resources/assets/demo/chart-bar-demo.js"></script> --%>
        <script src="${path}/resources/assets/demo/chart-pie-demo.js"></script>
        <script src="${path}/resources/assets/demo/multi-chart.js"></script>
        <!-- <script type="text/javascript" src="//code.jquery.com/jquery.min.js"></script> -->
    </body>
</html>
