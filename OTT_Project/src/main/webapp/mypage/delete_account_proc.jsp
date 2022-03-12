<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.ott.dao.MemberDao,com.ott.vo.MemberVO"%>
    
<jsp:useBean id="vo" class="com.ott.vo.MemberVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>       <!-- property:받을 데이터 -->

<%
	MemberDao dao = new MemberDao();
	int result = dao.getLoginResult(vo);
	
	
	if(result == 1){
		session.setAttribute("sid",vo.getId());
		//response.sendRedirect("http://localhost:9000/OTT_Project/join/delete_account_final.jsp");
%>
<%
		int result2 = dao.dropinsert(vo);
			if(result2 ==1){
			//System.out.println("회원가입 성공");
			int result3 = dao.dropdelete(vo);
		response.sendRedirect("http://localhost:9000/OTT_Project/mypage/delete_account_final.jsp");//?join_result=succ
		}
	}else{
%>		
		<script>
        alert("회원정보가 일치하지 않습니다.");
        history.back();
        </script>
<%
	}

%>
	
