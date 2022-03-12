<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.ott.vo.BoardVO, com.ott.dao.BoardDao"%>
<%

    String num = request.getParameter("num");
    BoardDao dao = new BoardDao();
    BoardVO vo= dao.select(num, "content");
   
%>
<%
    /*ArrayList<CommentVO> clist =dao.select(num);*/
  //System.out.println(num);
    /*System.out.println(clist.size()); */
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width", initial-scale="1">
<title>Insert title here</title>
<link href="http://localhost:9000/OTT_Project/board/board.css" rel="stylesheet">
</head>
<body>
    <header>
        <iframe src="http://localhost:9000/OTT_Project/header.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe>
    </header>
    <div class="content">
        <section class="notice_update_delete">
            <h1>자유게시판-수정하기</h1>
            <form name="freeboard_update_delete_Form" action="freeboard_update_delete_proc.jsp" method="get">
            <input type="hidden" name="num" value="<%=num%>"> 
           
           
                <table class="board_update_delete_write">
                    <tr>
                      
                        <td>
                            <input type="text" name="title" value="<%=vo.getTitle() %>" id="title">
                        </td>
                    </tr>
                    <tr>
                        
                        <td>
                            <textarea rows="10" cols="50" name="content" id="content"><%=vo.getContent() %></textarea>                   
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="button" class="btn_style3" onclick="updatePage()">수정완료</button>
                            <button type="button" class="btn_style3" onclick="deletePage()">삭제하기</button>
                            <a href="http://localhost:9000/OTT_Project/board/freeboard_content.jsp">
                                <button type="button" class="btn_style3">취소</button>
                            </a>
                        </td>
                    </tr>
                </table>
            </form>
        </section>
        
    </div>
    
<script type="text/javascript">
 
	function updatePage(){
		let title;
		title = document.getElementById("title");
		
		if(title.value == ""){
			alert("제목을 입력해주세요");
			title.focus();
			return false;
		}else if(content.value == ""){
			alert("내용을 입력해주세요");
			content.focus();
			return false;
		}else{
			freeboard_update_delete_Form.submit();
		}
		
	}
    /*
    function deletePage(num){
       if(confirm("글을 삭제합니다")==true){
           location.href="http://localhost:9000/OTT_Project/board/freeboard_delete_proc.jsp?num="+num;
           //delete.jsp?idx= ""안에 들어갈 코드예시. 
       }
    }
    */
	/*
    function deletePage(idx){
        if(confirm("글을 삭제합니다")==true){
            location.href=""+idx;
            //delete.jsp?idx= ""안에 들어갈 코드예시. 
        }
    };
    */
    
</script>



</body>
<iframe src="http://localhost:9000/OTT_Project/footer.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe> 

</html>