<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width", initial-scale="1">
<link href="http://localhost:9000/OTT_Project/adminpage/adminpage.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
    <div class="profile">
         <span class="title_style1">관리자 페이지</span>
    </div>
    <div class="left_menulist">
        <div class="memeber_info">
            <div class="left_menulist_title">게시판 관리</div>
            <nav>
                <ul>
                    <li><a href="http://localhost:9000/OTT_Project/adminpage/adminpage_freeboard_list.jsp" target="_parent" class="link_style1">- 자유게시판</a></li>
                    <li><a href="http://localhost:9000/OTT_Project/adminpage/adminpage_noticeboard_list.jsp"  target="_parent" class="link_style1">- 공지사항</a></li>
                    <li><a href="http://localhost:9000/OTT_Project/adminpage/adminpage_faqboard_list.jsp"  target="_parent" class="link_style1">- FAQ</a></li>
                </ul>
            </nav>
        </div>
        <div class="member_activity">
            <div class="left_menulist_title">회원관리</div>
            <nav>
                <ul>
                    <li><a href="http://localhost:9000/OTT_Project/adminpage/adminpage_questionboard_list.jsp" target="_parent" class="link_style1">- 문의관리</a></li>
                    <li><a href="http://localhost:9000/OTT_Project/adminpage/adminpage_report.jsp"  target="_parent" class="link_style1">- 신고관리</a></li>
                    <li><a href="http://localhost:9000/OTT_Project/adminpage/adminpage_user.jsp"  target="_parent" class="link_style1">- 회원관리</a></li>
                </ul>
            </nav>
        </div>
    </div>
        
</body>
</html>