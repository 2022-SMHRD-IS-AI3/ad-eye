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
	
	<button onclick="getAPI('mem_list')">회원목록</button>
	<button onclick="getAPI('mem_sbslist')">회원구독목록</button>
	<button onclick="changeAPI('mem_insert')">회원가입</button>
	<button onclick="getAPI('mem_detail')">회원조회</button>
	<button onclick="getAPI('mem_update')">회원수정</button>
	<button onclick="getAPI('mem_delete')">회원삭제</button>
	<br>
	<button onclick="getAPI('dev_insert')">기기등록</button>
	<button onclick="getAPI('dev_detail')">기기상세</button>
	<button onclick="getAPI('dev_update')">기기수정</button>
	<button onclick="getAPI('dev_delete')">기기삭제</button>
	<br>
	<button onclick="changeAPI('dev_onoff','Y')">기기 ON</button>
	<button onclick="changeAPI('dev_onoff','N')">기기 OFF</button>
	<button onclick="changeAPI('dev_onoff','R')">기기 REBOOT</button>
	<button onclick="changeAPI('dev_log','1')">기기 로그</button>
	<br>
	<button onclick="getAPI('sbs_insert')">구독등록</button>
	<button onclick="getAPI('sbs_detail')">구독상세</button>
	<button onclick="getAPI('sbs_update')">구독수정</button>
	<button onclick="getAPI('sbs_delete')">구독삭제</button>
	<br>
	<button onclick="getAPI('ai_submit')">AI전송</button>
	<br>
	<input type="text" name="mem_id" id="mem_id" value="test01">
	<input type="text" name="mem_pw" id="mem_pw" value="0000">
	<br>
	<button onclick="getAPI('login')">로그인</button>
	<button onclick="getAPI('logout')">로그아웃</button>
	<button onclick="getAPI('loginSession')">로그인확인</button>
	<br>
	<button onclick="getAPI('adminDashboard')">어드민 대시보드</button>
	<button onclick="changeAPI('userDashboard','1')">분석 그래프 페이지</button>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script type="text/javascript">
	
	const changeAPI = (code,val) => {
		let aDatas
		let aUri = ""
		let aType = ""
	
		if(false){
			
		}else if (code == "dev_insert"){
			
			aUri = "/device/insert"
			aType = "POST"
			aDatas = 
			{
				device_uid : "device-01-dsfefsdj2kwef"
			}
			
		}else if (code == "mem_insert"){
			var mem_id = document.getElementById("mem_id").value;
			aUri = "/member/insert"
			aType = "POST"
			aDatas = 
			{
				mem_id : mem_id,
				mem_pw : "0000",
				mem_company : "애드컴퍼니",
				mem_phone : "000-000-0000",
				mem_email : "smhrd@smhdrd.com",
				company_addr : "광주 동구 예술길 31-15",
				mem_status : "Y"
			}	
		}else if(code == "userDashboard"){
			aUri = "/acq/dashboard"
			aType = "GET"
			aDatas = "sbs_seq="+val+"&search_date=2023-06-08"
			
		}else if(code == "dev_log"){
			aUri = "/device/log"
			aType = "GET"
			aDatas = "device_seq="+val
			
		}else if(code == "dev_onoff"){
			aUri = "/device/onoff"
			aType = "POST"
			aDatas = 
			{
				device_seq : 1,
				device_onoff : val
			}
		}
		console.log(aUri)
		console.log(aDatas)
        // ajax문
        $.ajax({ // url, success, error 는 무조건 있어야한다
            // 어디랑 통신 할건지
            url: 'http://211.223.37.186:9000' + aUri,
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
	
	const getAPI = (code) => {
		let aDatas
		let aUri = ""
		let aType = ""
	
		if(false){
			
		}else if (code == "adminDashboard"){
			aUri = "/admin/dashboard"
			aType = "GET"
		}else if (code == "loginSession"){
			
			
			aUri = "/loginSession"
			aType = "GET"
			
		/* }else if (code == "login"){
			
			let mem_id = document.getElementById("mem_id").value;
			let mem_pw = document.getElementById("mem_pw").value;
			aUri = "/login"
			aType = "POST"
			aDatas = 
			{
				mem_id : mem_id,
				mem_pw : mem_pw
			} */
		}else if (code == "logout"){
			
			aUri = "/logout"
			aType = "GET"
			
		}else if (code == "mem_list"){
			var mem_id = document.getElementById("mem_id").value;
			aUri = "/member/"
			aType = "GET"
			aDatas = 
			{
				pageNum : 1,
				amount : 5,
				type : "",
				keyword : ""
				
			}
		}else if (code == "mem_sbslist"){
			var mem_id = document.getElementById("mem_id").value;
			aUri = "/member/devicelist"
			aType = "GET"
			aDatas = 
			{
				pageNum : 1,
				amount : 5,
				mem_id : "test012123"
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
		
		}else if(code == "dev_detail"){
			aUri = "/device/detail"
			aType = "GET"
			aDatas = "device_seq=1"
		}else if(code == "dev_delete"){
			aUri = "/device/delete"
			aType = "GET"
			aDatas = "device_seq=1"
		}else if(code == "dev_update"){
			aUri = "/device/update"
			aType = "POST"
			aDatas = 
			{
				device_seq : 1,
				device_uid : "device-01-dsfefsdjkwef",
				device_NM : "디바이스네임",
				device_onoff : "Y",
				device_status : "Y"
			}
		}else if (code == "sbs_insert"){
			
			aUri = "/subscription/insert"
			aType = "POST"
			aDatas = 
			{
				mem_id : "test01",
				device_seq : "2",
				sbs_loc : "매채위치주소",
				sbs_alias : "구독 별칭",
				sbs_start_dt : "2023-01-01",
				sbs_end_dt : "2023-12-31",
				sbs_grade : "standard",
				sbs_status : "Y"
			}
		}else if(code == "sbs_detail"){
			aUri = "/subscription/detail"
			aType = "GET"
			aDatas = "sbs_seq=1"
		}else if(code == "sbs_delete"){
			aUri = "/subscription/delete"
			aType = "GET"
			aDatas = "sbs_seq=1"
		}else if(code == "login"){
			aUri = "/login"
			aType = "GET"
			aDatas = 
			{
				mem_id : "test01",
				mem_pw : "0000"
			}
		}else if(code == "sbs_update"){
			aUri = "/subscription/update"
			aType = "POST"
			aDatas = 
			{
				sbs_seq : "1",
				device_seq : "2",
				sbs_loc : "매채위치주소",
				sbs_alias : "구독 별칭",
				sbs_end_dt : "2023-12-31",
				sbs_grade : "standard",
				sbs_status : "Y"
			}
		}else if(code == "ai_submit"){
			
			
			aUri = "/acq/submit"
			aType = "POST"
			var datas = [
				{
					start_data_time: "2023-06-07 09:30:50", 
					end_data_time: "2023-06-07 09:31:20", 
					effect: 0, 
					gender: "W"
				},
				{
					start_data_time: "2023-06-07 09:30:50", 
					end_data_time: "2023-06-07 09:31:20", 
					effect: 2, 
					gender: "W"
				}
					
			]
			aDatas = JSON.stringify(datas)
			
			/* aDatas = {tid_data:{
					
							start_data_time: "2023-06-07 09:30:50", 
							end_data_time: "2023-06-07 09:31:20", 
							effect: 0, 
							gender: "W"
						}} */
						
					
				
			
			
		}
		console.log(aUri)
		console.log(aDatas)
        // ajax문
        $.ajax({ // url, success, error 는 무조건 있어야한다
            // 어디랑 통신 할건지
            url: 'http://211.223.37.186:9000' + aUri,
            type: aType,
            data: aDatas,
            contentType : 'application/json',
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