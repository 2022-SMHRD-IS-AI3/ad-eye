
/* 메인 주소 */
const url = "http://211.223.37.186:9000";

/* 콘솔로그 출력 유무 */
let logFlag = true;

/* 콘솔출력 유무가 true 일때만 출력 */
function conLog(data){

	if(logFlag){
		console.log(data);	
	}
	
}

/* 콘솔출력 유무가 true 일때만 출력 */
function ajaxCallBack(path, type, data, callBack){
	$.ajax({ 
    	url: url + path,
        type: type,
        data: data,
        success: function (response) { // 통신성공시 데이터 반환
                    	
	    	if(response.code == "200") {
	            callBack(response)  		
	        }
                        
            dataChange()
       	},
        error: function () {// 통신에 실패했을 때 실행할 로직
        	
        	const error = {
        		code : "500",
        		message : "통신 실패"
        	}
        	
        	callBack(error)  	
        }
    })
}