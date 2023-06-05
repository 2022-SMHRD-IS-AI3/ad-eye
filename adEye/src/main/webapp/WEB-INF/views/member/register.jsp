<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        table,
        th,
        td {
            border: 1px solid black;
        }

        button {
            border-radius: 6px;
            padding: 5px;
            border: 0px;
            background: #ff8181;
            color: white;
            font-weight: bold;
            font-size: 22px;
            box-shadow: 3px 3px 3px #80808057;
            margin: 15px;
        }
        
        table{
            min-width: 500px;
            text-align: center;
        }

        .title {
            text-align: left;
            padding-left: 5px;
            text-align: left;
            padding-left: 5px;
            color: #686868;
            font-weight: bold;
            font-family: cursive;
        }
    </style>
</head>
<body>
	
	<button onclick="getAPI('mem_insert')">회원가입</button>
	<button onclick="getAPI('mem_detail')">회원조회</button>
	<button onclick="getAPI('mem_update')">회원수정</button>
	<button onclick="getAPI('mem_delete')">회원삭제</button>
	<button onclick="getAPI('mem_list')">회원목록</button>
	
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script type="text/javascript">
	
	
	const getAPI = (code) => {
		let aDatas
		let aUri = ""
		let aType = ""
	
		if (code == "mem_insert"){
			
			aUri = "/member/insert"
			aType = "POST"
			aDatas = 
			{
				mem_id : "test01",
				mem_pw : "0000",
				mem_company : "애드컴퍼니",
				mem_phone : "000-000-0000",
				mem_email : "smhrd@smhrd.com",
				company_addr : "광주 동구 예술길 31-15",
				mem_status : "Y"
			}
		}else if(code == "mem_detail"){
			aUri = "/member/detail"
			aType = "GET"
			aDatas = "mem_id=test01"
		}else if(code == "mem_delete"){
			aUri = "/member/delete"
			aType = "GET"
			aDatas = "mem_id=test01"
		}else if(code == "mem_update"){
			aUri = "/member/update"
			aType = "POST"
			aDatas = 
			{
				mem_id : "test01",
				mem_pw : "0000",
				mem_phone : "000-000-0000",
				mem_email : "smhrd@smhrd.com",
				company_addr : "광주 동구 예술길 31-14",
				mem_status : "Y"
			}
		}else if(code == "mem_list"){
			aUri = "/member/list"
			aType = "POST"
			aDatas = 
			{
				mem_id : "test01",
				mem_pw : "0000",
				mem_phone : "000-000-0000",
				mem_email : "smhrd@smhrd.com",
				company_addr : "광주 동구 예술길 31-14",
				mem_status : "Y"
			}
		}
		console.log(aUri)
		console.log(aDatas)
        // ajax문
        $.ajax({ // url, success, error 는 무조건 있어야한다
            // 어디랑 통신 할건지
            url: 'http://localhost:9000' + aUri,
            type: aType,
            data: aDatas,
            // 통신에 성공했을 때 실행할 로직
            success: function (response) {
            	console.log("통신성공")
            	console.log(response)
            },
            // 통신에 실패했을 때 실행할 로직
            error: function () {
                alert('통신실패');
            }
        })
    }
	
	
	</script>
</body>
</html>