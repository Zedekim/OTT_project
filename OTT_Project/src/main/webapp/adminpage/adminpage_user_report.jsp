<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width", initial-scale="1">
<title>Insert title here</title>
<link href="http://localhost:9000/OTT_Project/adminpage/adminpage.css" rel="stylesheet">
</head>
<body>
    <!-- 팝업창 -->
           <div class="popup_content user_report_content"> 
             <h1 class="title">사용자 유형별 신고 횟수</h1> 
             <table border=1 class="adminpage_user_report_list">
                <tr>
                    <th>닉네임</th>
                    <th>음란</th>
                    <th>광고</th>
                    <th>욕설</th>
                    <th>사행성</th>
                    <th>정치/분란조장</th>
                    <th>기타</th>
                    <th>총횟수</th>
                </tr>
                <tr class="need_center">
                    <td>test1</td>
                    <td>1</td>
                    <td>5</td>
                    <td>10</td>
                    <td>0</td>
                    <td>0</td>
                    <td>0</td>
                    <td>16</td>
                </tr>
                <tr class="need_right" >
                     <td colspan="10">
                         <button type="button" class="btn_style3 btn1" onclick="window.close()">확인</button>
                     </td>
                </tr>
             </table>
         </div> 
</body>
</html>