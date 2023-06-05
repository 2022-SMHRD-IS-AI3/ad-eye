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
	
	<button onclick="getAPI()">영화 정보 가져오기</button>
    <!-- 영화 진흥위원회 API를 가져와서
    일일 박스오피스 영화 TOP 10의
    순위, 영화 이름, 개봉일 출력 -->

    <!-- <table>
        <td>
            <th>순위</th>
            <th>영화 제목</th>
            <th>개봉일</th>
        </td>
        <td>
            <tr>1</tr>
            <tr>2</tr>
            <tr>3</tr>
        </td>
    </table> -->
    <div id="container"></div>    
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script type="text/javascript">
	
	const getAPI = () => {
        // ajax문
        $.ajax({ // url, success, error 는 무조건 있어야한다
            // 어디랑 통신 할건지
            url: 'https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json',
            type: 'GET',
            data: 'key=f5eef3421c602c6cb7ea224104795888&targetDt=20230101',
            // 통신에 성공했을 때 실행할 로직
            success: function (response) {
                // response => 응답 데이터
                // alert('통신성공');
                let movieList = response.boxOfficeResult.dailyBoxOfficeList;
                let tableForm = `
                    <table>
                        <tr>
                            <th>순위</th>
                            <th>영화제목</th>
                            <th>개봉일</th>
                        <tr>
                `;

                movieList.forEach(v => {
                    console.log(v.rank, v.movieNm, v.openDt);
                    tableForm += `
                        <tr>
                            <td>${v.rank}</td>
                            <td class="title">${v.movieNm}</td>
                            <td style="color: #5e5e5e;">${v.openDt}</td>
                        </tr>`;
                });
                
                tableForm += `</table>`;
                $('#container').html(tableForm);

                
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