<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<%
    String num = request.getParameter("num");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
    
            
            <form name="boardForm" action="freeboard_delete_proc.jsp" method="post">
          <%-- <input type="hidden" name="sid" value="<%=sid%>"> --%> 
            <input type="hidden" name="num" value="<%=num%>"> 
                 
                            
                            <div>삭제 버튼을 눌러주세요</div>
                  
                            <button type="submit" >삭제</button>
            </form>
        
    
</body>
</html>