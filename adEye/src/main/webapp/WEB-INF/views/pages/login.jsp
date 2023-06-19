<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인 - Ad-EYE</title>
	    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	    <link href="${path}/resources/css/styles.css" rel="stylesheet" />
	    <link rel="icon" type="image/x-icon" href="${path}/resources/assets/img/logo.png" />
	    <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
		<style>
			
		</style>
	</head>
	<body class="nav-fixed my-10">    

        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container-xl px-4">
                        <div class="row justify-content-center">
                            <div class="col-xl-5 col-lg-6 col-md-7 col-sm-11">
                                <!-- Social login form-->
                                <div class="card my-5">
                                    <div class="pt-5 text-center">
                                        <img class="w-25 mb-1 link-point" onClick="moveCode('main')" src="${path}/resources/assets/img/custom/logo.png" />
                                        <div class="h1 fw-bolder mt-3 mb-3">LOGIN</div>
                                    </div>
                                    <div class="p-5 pt-3">
                                        <!-- Login form-->
                                        <form>
                                            <!-- Form Group (email address)-->
                                            <div class="mb-3">
                                               <!--   <label class="text-gray-600 small" for="emailExample">Email address</label> -->
                                                <input class="form-control form-control-solid" type="text" id="mem_id" name="mem_id" onkeypress="submitEnter(event)" placeholder="ID" aria-label="Email Address" aria-describedby="emailExample" />
                                            </div>
                                            <!-- Form Group (password)-->
                                            <div class="mb-3">
                                                <!-- <label class="text-gray-600 small" for="passwordExample">Password</label>  -->
                                                <input class="form-control form-control-solid" type="password" id="mem_pw" name="mem_pw" onkeypress="submitEnter(event)" placeholder="Password" aria-label="Password" aria-describedby="passwordExample" />
                                            </div>
                                            <!-- Form Group (forgot password link)-->
                                            <!-- Form Group (login box).-->
                                            <div class="text-end align-items-center justify-content-between mb-0">
                                                <a class="btn btn-primary" onClick="login()">Login</a>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-body px-5 py-4">
                                        <div class="small text-center">
                                        	가입이 안되었으면
                                            <a onclick="movePath('/pages/main#contact')" class="link-point" style="color : #034efc"> 문의 주세요</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="footer-admin mt-auto">
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
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/scripts.js"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
		<script src="${path}/resources/js/cus.js"></script>
		<script type="text/javascript">
		
		// 엔터 로그인
		function submitEnter(e){
			if(e.keyCode === 13) {
				login()
			}
		}
		
     	// 로그인
        function login(){
        	
       		var path = "/login";
       		var type = "POST";
       		var data = {
    			mem_id : $('#mem_id').val(),
    			mem_pw : $('#mem_pw').val()
    		}
       		ajaxCallBack(path, type, data, function(response){
       			
       			conLog(response)
       			if(response.code == "200") {
       				movePath(response.result.move_url)
       			}else{
       				alert('아이디 또는 비밀번호를 잘못 입력했습니다.\n입력하신 내용을 다시 확인해주세요.')
       			}
       		});
       	}
			
		</script>

</body>
</html>