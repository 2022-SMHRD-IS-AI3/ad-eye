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
                          	<p class=" mt-5 mb-3 fw-bolder text-gray-500">About 애드아이</p>
                            <h1 class="mb-5" style="font-weight: bold;">AI 솔루션을 통한 옥외 광고 효과 측정</h1>
                            <p>&#60;애드아이&#62;는 단순히 유동인구로 광고 효과를 파악하지 않습니다.</p>
                            <p>카메라를 통해 <b>실시간으로 영상을 분석하고 유동인구와 보행자의 성별, 주목도를 정규화</b>하여</p>
                            <p>더욱 정확한 광고 효과를 측정합니다.</p>
                            <br>
                            <p><b>영상과 사진을 저장하지 않으며 측정한 데이터를 클라이언트에게만 제공하므로</b></p>
                            <p><b>개인정보를 보호하고 안정성을 확보</b>할 수 있습니다.</p>
                            <br>
                            <h5 class="fw-bolder">&#60;애드아이&#62;를 통해 데이터를 수집하고
                            당신의 광고 매체의 가치를 증명하세요!</h5>
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
                                    <h3>궁금한 사항은 언제든지 문의주세요!</h3>
                                    <br>
                                    <br>
                                    &#60;애드아이&#62;는 구독 서비스입니다.<br>
                                    서비스에 대해 더욱 자세히 알고 싶으신 분은 문의 바랍니다.
                                    
                                	<!-- 주의사항 -->
   									<div style="font-size: 12px; margin-top: 20px;">
        								회사명과 연락처, 목적이 기재되지 않을 시 답변이 어려울 수 있음을 고지합니다.
    								</div>
                     	
                                </div>
                                
                                <!-- contact form -->
                                    <div class="col-lg-6">
                                    <form>
                                        <div class="mb-3">
                                            <label for="company" class="form-label">* 회사명</label>
                                            <input type="text" class="form-control" id="company" placeholder="회사명">
                                        </div>
                                        <div class="mb-3">
                                            <label for="phone" class="form-label">* 연락처</label>
                                            <input type="tel" class="form-control" id="phone" oninput="formatPhoneNumber(this)" placeholder="010-1234-1234" maxlength="13">
                                        </div>
                                        <div class="mb-3">
                                            <label for="email" class="form-label">* 이메일</label>
                                            <input type="email" class="form-control" id="email" placeholder="이메일">
                                        </div>
                                        <div class="mb-3">
                                            <label for="contact_content" class="form-label">내용</label>
                                            <textarea class="form-control" id="contact_content" rows="5" style="height: 200px; resize: none;" placeholder="내용"></textarea>
                                        </div>
                                        <div class="mb-3 form-check">
                                            <input type="checkbox" class="form-check-input" id="privacyCheck" value="Y">
                                            <label class="form-check-label" for="privacyCheck">개인정보처리방침에 동의합니다.</label>
                                        </div>
                                        <button type="button" class="btn btn-primary form-control mt-3" onClick="dataSubmit()">문의하기</button>
                                    </form>
                                </div>
                                </div>
                        </section>
                    </div>
                </div>
                    </main>
                
                <footer class="footer-admin mt-auto footer-light mt-4">
                    <div class="container-xl px-4">
                        <div class="row">
                            <div class="col-md-6 small">Copyright &copy; Ad-EYE 2023</div>
                        </div>
                    </div>
                </footer>
            </div>
            
        <script>history.scrollRestoration = "manual"</script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.17.1/components/prism-core.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.17.1/plugins/autoloader/prism-autoloader.min.js" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
		<script src="${path}/resources/js/cus.js"></script>
        <script type="text/javascript">

        // 데이터 전송
        function dataSubmit(){
        	
        	var privacyCheck = $("#privacyCheck").prop("checked");
        	
        	if($("#company").val()== ""){
        		alert('회사명을 입력해주세요');
        		return
        	}else if($("#phone").val()== ""){
        		alert('연락처를 입력해주세요');
        		return
        	}else if($("#email").val()== ""){
        		alert('이메일을 입력해주세요');
        		return
        	}else if(!privacyCheck){
       		 	alert('개인정보처리방침에 동의 후 문의 가능합니다')
       		 	return
       		}
        	
        	var path = "/contact/send";
        	var type = "POST";
        	var data = {
        		company : $('#company').val(),
        		phone : $('#phone').val(),
        		email : $('#email').val(),
        		contact_content : $('#contact_content').val()
           	}
        	
			ajaxCallBack(path, type, data, function(response){
       			
       			conLog(response)
       				
	       		if(response.code == "201") {
	       			alert("문의주셔서 감사합니다.\n빠른 시일 내에 연락드리겠습니다")
	       				location.reload();
	       		}else{
	       			alert("문의 전송이 실패하였습니다")
	       		}
       			
       		});
        	
       		
       	}
        </script>
	</body>
</html>
