<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.ott.dao.MemberDao,com.ott.vo.MemberVO"%>
    
<% request.setCharacterEncoding("utf-8"); %>    <!-- post방식으로 넘어오면 한글이 깨져서 코드 추가 -->
<jsp:useBean id="vo" class="com.ott.vo.MemberVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>       <!-- property:받을 데이터 -->

<%
	MemberDao dao = new MemberDao();
	int result = dao.insert(vo);
	
	if(result == 1){
		//System.out.println("회원가입 성공");
		response.sendRedirect("../join/join_finish.jsp");//?join_result=succ
		//response.sendRedirect("../login/login.jsp?join_result=succ");
	}else{
		/* System.out.println("회원가입 실패"); */
		%>
		<script>
		alert("회원가입 실패");
		history.back();
		</script>
		<%
		//response.sendRedirect("../join/join.jsp");
	}	
%>