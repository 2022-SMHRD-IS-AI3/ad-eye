<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Welcom! Ad-EYE</title>
        <link href="${path}/resources/css/styles.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="${path}/resources/assets/img/logo.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
        <style>
            @font-face {
    			font-family: 'KBO-Dia-Gothic_bold';
    			src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_bold.woff') format('woff');
    			font-weight: 700;
    			font-style: normal;
				}
        </style>
    </head>
    <body class="nav-fixed" data-bs-spy="scroll" data-bs-target="#navbar">
        <div class="topnav navbar navbar-expand shadow justify-content-between justify-content-sm-start navbar-dark bg-black bg-opacity-25" id="navbar">
            <!-- Sidenav Toggle Button-->
            <!-- <button class="btn btn-icon btn-transparent-dark order-1 order-lg-0 me-2 ms-lg-2 me-lg-0" id="sidebarToggle"><i data-feather="menu"></i></button> -->
            <!-- Navbar Brand-->
            <!-- * * Tip * * You can use text or an image for your navbar brand.-->
            <!-- * * * * * * When using an image, we recommend the SVG format.-->
            <!-- * * * * * * Dimensions: Maximum height: 32px, maximum width: 240px-->
            <a class="navbar-brand pe-3 ps-4 ps-lg-4" href="main">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-stack" viewBox="0 0 16 16">
                    <path d="m14.12 10.163 1.715.858c.22.11.22.424 0 .534L8.267 15.34a.598.598 0 0 1-.534 0L.165 11.555a.299.299 0 0 1 0-.534l1.716-.858 5.317 2.659c.505.252 1.1.252 1.604 0l5.317-2.66zM7.733.063a.598.598 0 0 1 .534 0l7.568 3.784a.3.3 0 0 1 0 .535L8.267 8.165a.598.598 0 0 1-.534 0L.165 4.382a.299.299 0 0 1 0-.535L7.733.063z"/>
                    <path d="m14.12 6.576 1.715.858c.22.11.22.424 0 .534l-7.568 3.784a.598.598 0 0 1-.534 0L.165 7.968a.299.299 0 0 1 0-.534l1.716-.858 5.317 2.659c.505.252 1.1.252 1.604 0l5.317-2.659z"/>
                  </svg> Ad-EYE</a> 
                  <ul class="navbar-nav align-items-center ms-auto">
                    <!-- 문의하기 -->
                    <!-- ****추가 : style="font-weight: 800; color: #fff;"***** -->
                    <li class="nav-item no-caret d-none d-sm-block me-3">
                        <a class="nav-link"  href="#contact" style="font-weight: 800; color: #fff;">
                            문의하기</a>
                    </li>
                    <!-- 로그인 -->
                    <!-- ****추가 : style="font-weight: 800;"***** -->
                    <li class="nav-item no-caret d-none d-sm-block me-3 " >
                        <a class="nav-link"  href="login" style="font-weight: 800; color: #fff;">
                            로그인</a>
                    </li>
                  </ul>
                </div>
                
            	<div id="layoutSidenav_content">
                <main>
                    <!-- 헤더 이미지 -->
                    <header class="page-header page-header-light bg-white mb-10">
                        <div class="py-15 mb-4 bg-img-cover overlay overlay-50" style="background-image: url('${path}/resources/assets/img/main/header-img.jpg')">
                        <div class="container-xl px-4">
                            <!-- ****style="position: relative; z-index: 1;" 추가**** -->
                            <div class="text-center" style="position: relative; z-index: 1;">
                                <h1 class="lead mb-2 text-white-50 text-lg">AI 기반 오프라인 광고 효과 분석 서비스</h1>
                                <h1 class="text-white text-xl" style="font-family: 'KBO-Dia-Gothic_bold';">애드아이 Ad-EYE</h1>
                                <a class="text-white" href="#contact"><i class="fa-solid fa-angles-down"></i></a>
                            </div>
                        </div>
                        </div>
                    </header>
                    <!-- Main page content-->
                    <div class="container-xl px-4">
                        <div class="row">
                          <div class="col-lg-6">
                            <h1 class="mt-10 mb-5" style="font-weight: bold;">AI 솔루션을 통한 옥외 광고 효과 측정</h1>
                            <p>애드아이는 단순히 유동인구로 광고효과를 파악하지 않습니다.</p>
                              <p>유동인구 뿐만 아니라 보행자의 성별과 주목도를 수치화하여</p> 
                              <p>더욱 정확한 광고 효과를 측정합니다.</p>
                          </div>
                          <div class="col-lg-6">
                            <img class="img-fluid" src="${path}/resources/assets/img/main/main-img.png" alt="...">
                          </div>
                        </div>
                      </div>
                       <!-- Form section -->
                        <div class="col-lg-12 mt-15" id="contact">
                            <div class="container-xl px-4">
                        <section>
                            <div class="row">
                                <div class="col-lg-6">
                                    <h1 class="text-xl">CONTACT</h1>
                                </div>
                                    <div class="col-lg-6">
                                    <form>
                                        <div class="mb-3">
                                            <label for="companyName" class="form-label">* 회사명</label>
                                            <input type="text" class="form-control" id="companyName" placeholder="회사명">
                                        </div>
                                        <div class="mb-3">
                                            <label for="contactNumber" class="form-label">* 연락처</label>
                                            <input type="tel" class="form-control" id="contactNumber" placeholder="연락처">
                                        </div>
                                        <div class="mb-3">
                                            <label for="email" class="form-label">* 이메일</label>
                                            <input type="email" class="form-control" id="email" placeholder="이메일">
                                        </div>
                                        <div class="mb-3">
                                            <label for="message" class="form-label">내용</label>
                                            <textarea class="form-control" id="message" rows="5" style="height: 200px; resize: none;" placeholder="내용"></textarea>
                                        </div>
                                        <div class="mb-3 form-check">
                                            <input type="checkbox" class="form-check-input" id="privacyCheck">
                                            <label class="form-check-label" for="privacyCheck">개인정보처리방침에 동의합니다.</label>
                                        </div>
                                        <button type="submit" class="btn btn-primary form-control mt-3">문의하기</button>
                                    </form>
                                </div>
                        </section>
                    </div>
                </div>
                    </main>
                
                <footer class="footer-admin mt-auto footer-light">
                    <div class="container-xl px-4">
                        <div class="row">
                            <div class="col-md-6 small">Copyright &copy; Ad-EYE 2023</div>
                        </div>
                    </div>
                </footer>
            </div>
            
            <!-- <script>
            
            // Get the contact link element
            const contactLink = document.getElementById("contactLink");

            // Add a click event listener to the link
            contactLink.addEventListener("click", function (event) {
                // Prevent the default link behavior
                event.preventDefault();

                // Scroll to the contact section
                const contactSection = document.getElementById("contact");
                contactSection.scrollIntoView({ behavior: "smooth" });
            });
        
            </script>
         -->
         <script>history.scrollRestoration = "manual"</script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.17.1/components/prism-core.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.17.1/plugins/autoloader/prism-autoloader.min.js" crossorigin="anonymous"></script>
        
	</body>
</html>
