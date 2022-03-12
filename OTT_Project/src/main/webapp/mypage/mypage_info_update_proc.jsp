<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.ott.dao.MemberDao,com.ott.vo.MemberVO"%>
    
<% request.setCharacterEncoding("utf-8"); 
   String sid=(String)session.getAttribute("sid");
%>    <!-- post방식으로 넘어오면 한글이 깨져서 코드 추가 -->
    <jsp:useBean id="vo" class="com.ott.vo.MemberVO"></jsp:useBean>
    <jsp:setProperty property="*" name="vo"/> 

<%
    vo.setId(sid);
	MemberDao dao = new MemberDao();
	System.out.println(vo.getName());
	System.out.println(vo.getNick());
	System.out.println(vo.getTel());
	System.out.println(vo.getHp1());
	System.out.println(vo.getHp2());
	System.out.println(vo.getHp3());
	System.out.println(vo.getEmail1());
	System.out.println(vo.getEmail2());
	System.out.println(vo.getId());
	
	int result = dao.myInfoUpdate(vo);
	System.out.println(result);
	
	if(result == 1){
		//System.out.println("회원가입 성공");
		response.sendRedirect("http://localhost:9000/OTT_Project/mypage/mypage_info.jsp");//?join_result=succ
		//response.sendRedirect("../login/login.jsp?join_result=succ");
	}else{
		System.out.println("수정 실패");
		%>
		<script>
		alert("수정 실패");
		history.back();
		</script>
		<%
		//response.sendRedirect("../join/join.jsp");
	}	
%>