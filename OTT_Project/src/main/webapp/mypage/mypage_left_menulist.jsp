<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width", initial-scale="1">
<link href="http://localhost:9000/OTT_Project/mypage/mypage.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
    <div class="profile">
         <span class="title_style1">마이페이지</span>
    </div>
    <div class="left_menulist">
        <div class="memeber_info">
            <div class="left_menulist_title">사용자 정보</div>
            <nav>
                <ul>
                    <li><a href="http://localhost:9000/OTT_Project/mypage/mypage_info.jsp" target="_parent" class="link_style1">- 내정보 조회 및 수정</a></li>
                    <li><a href="http://localhost:9000/OTT_Project/mypage/mypage_password_update.jsp" target="_parent" class="link_style1">- 비밀번호 재설정</a></li>
                    <li><a href="http://localhost:9000/OTT_Project/mypage/delete_account.jsp" target="_parent" class="link_style1">- 회원탈퇴</a></li>
                </ul>
            </nav>
        </div>
        <div class="member_activity">
            <div class="left_menulist_title">사용자 활동</div>
            <nav>
                <ul>
                    <li><a href="http://localhost:9000/OTT_Project/mypage/mypage_review.jsp" target="_parent" class="link_style1">- 내 평가글</a></li>
                    <li><a href="http://localhost:9000/OTT_Project/mypage/mypage_write.jsp"  target="_parent" class="link_style1">- 내 게시글</a></li>
                    <li><a href="http://localhost:9000/OTT_Project/mypage/mypage_comments.jsp"  target="_parent" class="link_style1">- 내 댓글</a></li>
                </ul>
            </nav>
        </div>
    </div>
        
</body>
</html>