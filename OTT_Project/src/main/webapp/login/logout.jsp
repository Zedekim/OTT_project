<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String sid = (String)session.getAttribute("sid");
    if(sid != null){
        session.invalidate();       
    }
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <script>
        alert("로그아웃 하셨습니다");
        location.href="http://localhost:9000/OTT_Project/main.jsp";
    </script>
</body>
</html>