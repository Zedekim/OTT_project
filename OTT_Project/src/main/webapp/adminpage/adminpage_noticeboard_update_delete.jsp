<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width", initial-scale="1">
<title>Insert title here</title>
<link href="http://localhost:9000/OTT_Project/adminpage/adminpage.css" rel="stylesheet">
</head>
<body>
    <header>
        <iframe src="http://localhost:9000/OTT_Project/header.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe>
    </header>
    <div class="content">
        <iframe class="menulist" src="http://localhost:9000/OTT_Project/adminpage/admin_left_menulist.jsp"  scrolling="no" frameborder="0" width="100%" height="149px"></iframe>
        <div class="notice_update_delete">
	        <section class="notice_update_delete">
	            <h1>공지사항-수정하기</h1>
	            <form name="notice_update_delete_Form" action="board_update_delete_proc.jsp" method="post">
	            <input type="hidden" name="nid" value=""> 
	           
	                <table class="board_update_delete_write">
	                    <tr>
	                      
	                        <td>
	                            <input type="text" name="ntitle" value="" id="ntitle">
	                        </td>
	                    </tr>
	                    <tr>
	                        
	                        <td>
	                            <textarea rows="10" cols="50" name="bcontent" id="bcontent">수정할 내용이 출력되는 공간입니다. 삭제하기는 추후에 confirm()으로 구현할 계획입니다.
	                            취소하기는 이전페이지로 가게 됩니다.</textarea>                   
	                        </td>
	                    </tr>
	                    <tr>
	                        <td colspan="2">
	                            <button type="submit" class="btn_style3" onclick="">수정완료</button>
	                            <button type="button" class="btn_style3" onclick="deletePage()">삭제하기</button>
	                            <a href="http://localhost:9000/OTT_Project/adminpage/adminpage_noticeboard_list.jsp">
	                                <button type="button" class="btn_style3">취소</button>
	                            </a>
	                           
	                        </td>
	                    </tr>
	                </table>
	            </form>
	        </section>
        </div>
    </div>
    
    <script type="text/javascript">
 
    function deletePage(idx){
        if(confirm("글을 삭제합니다")==true){
            location.href=""+idx;
            //delete.jsp?idx= ""안에 들어갈 코드예시. 
        }
    };
    
    
</script>



</body>
<iframe src="http://localhost:9000/OTT_Project/footer.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe> 

</html>