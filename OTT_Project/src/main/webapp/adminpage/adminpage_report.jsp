<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width", initial-scale="1">
<title>Insert title here</title>
<link href="http://localhost:9000/OTT_Project/adminpage/adminpage.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://localhost:9000/OTT_Project/js/adminpage.js"></script>
</head>
<body>
    <header>
        <iframe src="http://localhost:9000/OTT_Project/header.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe>
    </header>
    <div class="content">
       <iframe class="menulist" src="http://localhost:9000/OTT_Project/adminpage/admin_left_menulist.jsp"  scrolling="no" frameborder="0" width="100%" height="149px"></iframe>
	   <div class="adminpage_report_list_total">
	        <section class="adminpage_report_list">
	            <h1>신고관리</h1>
	            <table border=1 class="adminpage_report_list">
	               <tr>
	                     <td colspan="10" >
		                     <form name="adminpage_report_search_form" action="#" method="get">
			                     <select class="select_style1" name="adminpage_report_search_category" id="adminpage_report_search_category"> 
				                     <option value="total">전체</option>
				                     <option value="platform">닉네임</option>
				                     <option value="content">아이디</option>
			                     </select>
			                     <input class="input_style1" type="text" name="adminpage_report_search">
			                     <button type="button" class="" onclick="">검색</button>
		                     </form>
	                     </td>
	              </tr>
	              <form name="mypage_comment_delete_form" action="#" method="get">
		              <tr class="table_title">
		                  <th>선택</th>
		                  <th>신고자ID</th>
		                  <th>피신고자ID</th>
		                  <th>신고유형</th>
		                  <th>신고글</th>
		                  <th>차단/해제</th>
		              </tr>
		              <tr class="need_center">
		                  <td><input type="checkbox" name="report_seleted" value="1"></td>
		                  <td>test1</td>
		                  <td>test2</td>
		                  <td>광고</td>
		                  <td><a href="" target="_blank">"http://localhost:9000"</a></td>
	                      <td>
	                      <button type="button" name="block" class="btn_style5" onclick="report_popup_visible()">차단</button>
	                      </td>
		              </tr>
		              <tr class="need_center">
                          <td><input type="checkbox" name="report_seleted" value="1"></td>
                          <td>test1</td>
                          <td>test2</td>
                          <td>광고</td>
                          <td><a href="" target="_blank">"http://localhost:9000"</a></td>
                          <td>
                          <button type="button" name="block" class="btn_style5" onclick="report_popup_visible()">차단</button>
                          </td>
                      </tr>
                      <tr class="need_center">
                          <td><input type="checkbox" name="report_seleted" value="1"></td>
                          <td>test1</td>
                          <td>test2</td>
                          <td>광고</td>
                          <td><a href="" target="_blank">"http://localhost:9000"</a></td>
                          <td>
                          <button type="button" name="block" class="btn_style5" onclick="report_popup_visible()">차단</button>
                          </td>
                      </tr>
		             <tr class="need_right" >
		                  <td colspan="10">
		                      <a href=""><button type="button" class="btn1" onclick="">차단</button></a>
		                  </td>
		             </tr>
	             </form>
	             </table>
	             <div class="page_button_box">
	                <a class ="link2" href=""><button class="page_button" type="button">&#60;&#60;</button></a>
	                <a class ="link2" href=""><button class="page_button" type="button">1</button></a>
	                <a class ="link2" href=""><button class="page_button" type="button">2</button></a>
	                <a class ="link2" href=""><button class="page_button" type="button">3</button></a>
	                <a class ="link2" href=""><button class="page_button" type="button">4</button></a>
	                <a class ="link2" href=""><button class="page_button" type="button">&#62;&#62;</button></a>
	            </div>
	        </section>
	    </div>
	    </div>
	    
	     <!-- 팝업창 -->
        <!-- <div class="user_block_popup">
           <div class="popup_content"> 
             <h1 class="title">사용자 차단</h1> 
             <h3>선택한 사용자를 정지할 기간을 선택해주세요.</h3>
             <form name="block_period_form" action="#" method="get"> 
                <ul>
                    <li>
                        <input type="radio" name="block_period" value="3days"> 3일
                    </li>
                    <li>
                        <input type="radio" name="block_period" value="7days"> 7일
                    </li>
                    <li>
                        <input type="radio" name="block_period" value="1month"> 30일
                    </li>
                    <li>
                        <input type="radio" name="block_period" value="3months"> 90일
                    </li>
                    <li>
                        <input type="radio" name="block_period" value="permanent"> 영구정지
                    </li>
                    <li>
                        <button class="btn_style5" id="cancel" value="취소">취소</button>
                        <button class="btn_style5" id="submit" value="보내기">보내기</button>
                    </li>
                </ul>
             </form> 
         </div> 
        </div> -->
        
</body>
</html>