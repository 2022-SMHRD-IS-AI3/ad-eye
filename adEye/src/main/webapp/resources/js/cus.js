
// 메인 주소
const url = "http://211.223.37.186:9000";

// 콘솔로그 출력 유무
let logFlag = true;

// 콘솔출력 유무가 true 일때만 출력
function conLog(data){

	if(logFlag){
		console.log(data);
	}
	
}

// 콘솔출력 유무가 true 일때만 출력
function ajaxCallBack(path, type, data, callBack){
	$.ajax({ 
    	url: url + path,
        type: type,
        data: data,
        success: function (response) { // 통신성공시 데이터 반환
                    	
	    	callBack(response)
            
       	},
        error: function () { // 통신에 실패했을 때 실행할 로직
        	
        	const error = {
        		code : "500",
        		message : "통신 실패"
        	}
        	
        	callBack(error)  	
        }
    })
}

// 코드화 페이지 이동
function moveCode(code,d){ // 코드, 쿼리스트링

    var path = "", op = "", w = "", h = "";

    if(code === 'mlist'){
        path = "/pages/user_management"
    }else if(code === 'minsert'){
        path = "/pages/user_register"
    }else if(code === 'slist'){
        path = "/pages/subscription"
    }else if(code === 'sinsert'){
        path = "/pages/subscription_register"
    }

    movePath(path, op, w, h);

}

// 페이지 이동
function movePath(path, op, w, h){ // 경로, 페이지 타입, width, height

    if(op === 'pop'){ // 팝업창으로 띄우기

        var popupWidth = width || 500;
        var popupHeight = height || 500;
        var left = (window.innerWidth - popupWidth) / 2;
        var top = (window.innerHeight - popupHeight) / 2;

        window.open(path, '_blank', 'width=' + popupWidth + ', height=' + popupHeight + ', left=' + left + ', top=' + top);

    }else{ // 페이지 이동
        window.location.href = path;
    }

}

// 쿼리스트링 값 가져오기
function getQueryString(key) { // 쿼리스트링 키 값

    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    return urlParams.get(key);

}

// 객체 비어있는 값 체크
function isObjectEmpty(obj) {
  	for (var key in obj) {
    	if (obj.hasOwnProperty(key) && obj[key] === "") {
      		return true;
    	}
  	}
  	return false;
}