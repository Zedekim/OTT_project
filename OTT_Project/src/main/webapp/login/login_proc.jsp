<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ott.vo.MemberVO, com.ott.dao.MemberDao" %>

<!-- 한글이 넘어오지 않으면 setCharacterEncoding 안해도됨 -->
<jsp:useBean id="vo" class="com.ott.vo.MemberVO"></jsp:useBean> <!-- id는 임의로 정하는 듯 -->
<jsp:setProperty property="*" name="vo"/>

<%
	//System.out.println("id--->" + vo.getId()); 콘솔창확인
	//System.out.println("pass--->" + vo.getPass());
	MemberDao dao = new MemberDao();
	int result = dao.getLoginResult(vo);   //MemberDao랑 다른 위치에 있어서, MemberDao에 getLoginResult메소드를 만들어도 이 부분에 빨간색 밑줄이 뜸. -->반영시간이 걸리는 거라서 잘라내기 했다가 다시 붙이면 됨
	int blockcheck = dao.logindropcheck();
	if(blockcheck == 1){
%>
		<script>
		alert("차단된 사용자 입니다.");
		history.back();
		</script>
<%
	}else if(result == 1){
		//로그인 성공 ---> 메인화면으로 이동
		//id를 세션에 담아 브라우저에 전송 //세션은 미리 만들어져있는객체라서 꺼내쓰면됨
		session.setAttribute("sid",vo.getId()); //sid라는 이름으로 넘겨준다, 로그인에성공한아이디를넣어준다(vo.getId())
		response.sendRedirect("http://localhost:9000/OTT_Project/main.jsp");
		/* session.setMaxInactiveInterval(30); */
	}else{
		%>
		<script>
        alert("로그인 실패");
        history.back();
        </script>
        <%
	}

	


%>