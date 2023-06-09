<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<button onclick="getAPI('contact_send')">문의등록</button>
	<button onclick="getAPI('contact_detail')">문의상세</button>
	<button onclick="getAPI('contact_list')">전체 문의 조회</button>	
<!-- 	<input type="text" name="contact_seq" id="contact_seq" value="0"> -->

	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script type="text/javascript">
	
	const getAPI = (code) => {
		let aDatas
		let aUri = ""
		let aType = ""
	
		if(false){
			
		}else if(code == "contact_send"){
/* 			var contact_seq = document.getElementById("contact_seq").value; */
			aUri = "/contact/send"
			aType = "POST"
			aDatas = 
			{
				/* contact_seq : contact_seq, */
				email : "smhrd@smhrd.com",
				phone : "000-000-0000",
				company : "산삼컴퍼니",
				contact_content : "문의는 포도가 먹고싶운뎅",
				contact_open : "Y"
			}
		}else if(code == "contact_detail"){
			
			aUri = "/contact/detail"
			aType = "GET"
			aDatas = "contact_seq=3"
			
		}else if(code == "contact_list"){
			
			aUri = "/contact/"
			aType = "GET"
			aDatas = "cri"
		}
		
		
		console.log(aUri)
		console.log(aDatas)
		$.ajax({
			url: 'http://218.157.24.2:9000'+aUri,
			type: aType,
			data : aDatas,
			success: function (response) {
            	console.log("통신성공")
            	console.log(response)
			},
			error: function(){
				alert('통신실패');
			}
		})
	}
	
	
	
	
	</script>
</body>
</html>