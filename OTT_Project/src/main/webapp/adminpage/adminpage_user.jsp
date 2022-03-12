<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ott.vo.MemberVO, com.ott.dao.MemberDao, java.util.ArrayList" %>
<%
    MemberDao dao = new MemberDao();
    ArrayList<MemberVO> list = dao.userSelect();
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="http://localhost:9000/OTT_Project/adminpage/adminpage.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="http://localhost:9000/OTT_Project/js/adminpage.js"></script>
</head>
<body>
    <header>
        <iframe src="http://localhost:9000/OTT_Project/header.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe>
    </header>
    <div class="content">
       <iframe class="menulist" src="http://localhost:9000/OTT_Project/adminpage/admin_left_menulist.jsp"  scrolling="no" frameborder="0" width="100%" height="149px"></iframe>
	   <div class="adminpage_user_list_total">
	        <section class="adminpage_user_list">
	            <h1>회원관리</h1>
	            <table border=1 class="adminpage_user_list">
	               <tr>
	                     <td colspan="10" >
		                     <form name="adminpage_user_form" action="#" method="get">
			                     <select class="select_style1" name="adminpage_user_category" id="adminpage_user_category"> 
				                     <option value="total">전체</option>
				                     <option value="platform">닉네임</option>
				                     <option value="content">아이디</option>
			                     </select>
			                     <input class="input_style1" type="text" name="adminpage_user">
			                     <button type="button" class="" onclick="">검색</button>
		                     </form>
	                     </td>
	              </tr>
	              <form name="adminpage_comment_delete_form" action="#" method="get">
		              <tr class="table_title">
		                  <th>선택</th>
		                  <th>닉네임</th>
		                  <th>사용자ID</th>
		                  <th>가입일자</th>
		                  <th>전화번호</th>
		                  <th>총 신고횟수</th>
		                  <th>차단상태</th>
		                  <th>차단기간</th>
		                  <th>차단/해제</th>
		              </tr>
		              <%for(MemberVO vo : list){ 
		            	   String block="";
		            	    if(vo.getBlock()==1){
                                block="3일";
                            }else if(vo.getBlock()==2){
                            	block="7일";
                            }else if(vo.getBlock()==3){
                            	block="30일";
                            }else if(vo.getBlock()==4){
                            	block="90일";
                            }else if(vo.getBlock()==5){
                            	block="영구";
                            }else{
                            	block="-";
                            }
		              %>
		              <tr class="need_center">
		                  <td><input type="checkbox" name="report_seleted" value="1"></td>
		                  <td><%=vo.getNick() %></td>
		                  <td><%=vo.getId() %></td>
		                  <td><%=vo.getDate() %></td>
		                  <td><%=vo.getTel() +" "+ vo.getHp1()+ vo.getHp2()+ vo.getHp3()%></td>
		                  <td><button class="btn_href" type="button" name="user_report" onclick="report_popup_visible()">
		                      </button>
		                  </td>
		                  <td><%=block %></td>
		                  <td>2021-01-20~2021-01-23</td>
	                      <td>
	                      <button type="button" name="block" class="btn_style5" onclick="block_popup_visible()">차단</button>
	                      </td>
		              </tr>
		              <%} %>
		             <tr class="need_right" >
		                  <td colspan="10">
		                      <a href=""><button type="button" class="btn1" onclick="block_popup_visible()">차단</button></a>
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
	    
</body>
</html>