
// 메인 주소
const url = "http://192.168.140.42:9001";

// 콘솔로그 출력 유무
let logFlag = false;

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

    if(code === 'home'){
        path = "/pages/admin"
    }else if(code === 'mlist'){
        path = "/pages/admin/member"
    }else if(code === 'minsert'){
        path = "/pages/admin/member/push"
    }else if(code === 'slist'){
        path = "/pages/admin/sbs"
    }else if(code === 'sinsert'){
        path = "/pages/admin/sbs/push"
    }else if(code === 'dlist'){
        path = "/pages/admin/device"
    }else if(code === 'dinsert'){
        path = "/pages/admin/device/push"
    }else if(code === 'log'){
        path = "/pages/admin/log"
    }else if(code === 'contact'){
        path = "/pages/admin/contact"
    }else if(code === 'main'){
        path = "/pages/main"
    }else if(code === 'login'){
        path = "/pages/login"
    }else if(code === 'noread'){
        path = "/pages/admin/contact/?cs=N"
    }else if(code === 'use'){
        path = "/pages/admin/device/?ds=Y"
    }else if(code === 'dday'){
        path = "/pages/admin/sbs/?ss=5"
    }

    movePath(path, op, w, h);

}

// 페이지 이동
function movePath(path, op, w, h){ // 경로, 페이지 타입, width, height

    if(op === 'pop'){ // 팝업창으로 띄우기

        var popupWidth = w || 1300;
        var popupHeight = h || 900;
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

// 날짜 포맷
function formatDate(timestamp){
 	var date = new Date(timestamp);
 	var year = date.getFullYear();
 	var month = String(date.getMonth() + 1).padStart(2, '0');
 	var day = String(date.getDate()).padStart(2, '0');
        
 	return year + '-' + month + '-' + day;
}

// 로그아웃
function logout() {

	var path = "/logout";
	var type = "GET";
	var data = '';
	
	if(!confirm('로그아웃 하시겠습니까?')){
		return
	}

	ajaxCallBack(path, type, data, function(response){
	       			
	 	conLog(response)
	   	if(response.code == "202") {
	   		history.pushState(null, null, '/pages/login');
			window.addEventListener('popstate', function () {
			    history.pushState(null, null, '/pages/login');
			    moveCode('login');
			});
			
	   		moveCode('login');
	       				
	 	}
	});
}

function loginSession(){

	var path = "/loginSession";
	var type = "GET";
	var data = '';
	
	ajaxCallBack(path, type, data, function(response){
	       			
	 	conLog(response)
	   	if(response.code != "200") {
	   		
	   		moveCode('login');
	       	return		
	 	}
	 	
	 	$('.mem_id').text(response.mem_id)
	 	
	});
}

// 페이지네이션 생성
function makePagination(pm){
	
	var prev = pm.prev ? '<li class="page-item" onClick="pageMove('+ (pm.startPage-1)+')"><a class="page-link">Previous</a></li>' : '<li class="page-item disabled"><span class="page-link">Previous</span></li>';
	var next = pm.next ? '<li class="page-item" onClick="pageMove('+ (pm.endPage+1) +')"><a class="page-link">Next</a></li>' :  '<li class="page-item disabled"><span class="page-link">Next</span></li>';
	var page = '';
	
	for(var i = pm.startPage; i <= pm.endPage; i++){
		
		if(pm.cri.pageNum == i){
			page += '<li class="page-item active" aria-current="page"><a class="page-link">'+ i +'</a></li>';
		}else{
			page += '<li class="page-item"><a class="page-link" onClick="pageMove('+ i +')">'+ i +'</a></li>';
		}
	}
	
	if(page != ''){
		
		var pageHTML = '<ul class="pagination justify-content-center">' + prev + page + next + '</ul>' ; 
		$('#page-wrap').html(pageHTML);
	}
	
	
}

// 뒤로가기
function back(){
	history.back();
}

function formatPhoneNumber(input) {
  // 입력된 값에서 숫자만 추출
  let phoneNumber = input.value.replace(/\D/g, '');

  // 전화번호 형식을 적용하여 `-` 추가
  if (phoneNumber.length > 3 && phoneNumber.length <= 6) {
    phoneNumber = phoneNumber.replace(/(\d{3})(\d+)/, '$1-$2');
  } else if (phoneNumber.length > 6) {
    phoneNumber = phoneNumber.replace(/(\d{3})(\d{4})(\d+)/, '$1-$2-$3');
  }

  // 변환된 전화번호를 입력 필드에 설정
  input.value = phoneNumber;
}

// 최근업데이트날짜변경용
function korTimeChange(utime) {

    let date = new Date(utime);

    let year = date.getFullYear();
    let month = ('0' + (date.getMonth() + 1)).slice(-2);
    let day = ('0' + date.getDate()).slice(-2);
    let hours = ('0' + date.getHours()).slice(-2);
    let minutes = ('0' + date.getMinutes()).slice(-2);
    let seconds = ('0' + date.getSeconds()).slice(-2);

    let formattedDate = year + '년 ' + month + '월 ' + day + '일 ' + hours + '시 ' + minutes + '분 ' + seconds + '초';
    return formattedDate;
}
