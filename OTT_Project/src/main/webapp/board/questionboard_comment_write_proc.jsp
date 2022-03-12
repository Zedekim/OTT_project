<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ott.dao.BoardDao, com.ott.vo.CommentVO"%>

<%
    request.setCharacterEncoding("utf-8");
    String sid = (String)session.getAttribute("sid");
%>

<jsp:useBean id="vo"  class="com.ott.vo.CommentVO"></jsp:useBean> 
<jsp:setProperty property="content" name="vo"/>
<jsp:setProperty property="bnum" name="vo"/>

<%
    BoardDao dao = new BoardDao();
    vo.setId(sid);
   /*  System.out.println(vo.getId());
    System.out.println(vo.getBnum()); */
    int result = dao.insert(vo);
    
    if(result == 1){
        //게시글 등록 완료
        /* session.setAttribute("sid", vo.getId()); */        
        String url="http://localhost:9000/OTT_Project/board/questionboard_content.jsp?num="+vo.getBnum();
        response.sendRedirect(url);
        /*response.setHeader("Refresh", "0; URL=http://localhost:9000/OTT_Project/board/freeboard_content.jsp?num=b_4"); */
    }else{
        response.sendRedirect("questionboard_content.jsp?write_result=fail");
    }
    
%>