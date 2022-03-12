<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.ott.vo.StarBoardVO, com.ott.dao.BoardDao, com.ott.vo.CommentVO, java.util.ArrayList" %>
<%
    BoardDao dao = new BoardDao();

    String sid = (String)session.getAttribute("sid");
    String num=request.getParameter("num");
    StarBoardVO vo= dao.starContentSelect(num);
    ArrayList<CommentVO> clist =dao.reviewBoard_comment_select(num);
   /* System.out.println(num);
     System.out.println(clist.size()); */
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="http://localhost:9000/OTT_Project/board/board.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://localhost:9000/OTT_Project/js/board.js"></script>
<script>
    $(document).ready(function(){
        $('.rating input[name=pic][value=<%=vo.getPic()%>]').parent().addClass('checked');
        <%-- consol.log("'.rating input[name=pic][value=<%=vo.getPic()%>]'.val()"); --%>
        $('.rating input[name=money][value=<%=vo.getMoney()%>]').parent().addClass('checked');
        $('.rating input[name=quantity][value=<%=vo.getQuantity()%>]').parent().addClass('checked');
        $('.rating input[name=kinds][value=<%=vo.getKinds()%>]').parent().addClass('checked');
        $('.rating input[name=div][value=<%=vo.getDiv()%>]').parent().addClass('checked');
        $('.rating input').attr("readonly", "true"); 
    })
</script>
</head>
<body>
    <header>
        <iframe src="http://localhost:9000/OTT_Project/header.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe>
    </header>
     <div class="notice_content_total">
        <section class="notice_content">
            <h1>평가게시판 상세보기</h1>
            <!-- (권한이 있는 유저만 수정하기, 삭제하기 보임).  -->
            <table border=1 class="notice_content rboard_content_table">
                <tr>
                    <td colspan="3"><%=vo.getPlat() %></td>
                </tr>
                <tr>
                    <td colspan="3"><%=vo.getTitle() %></td>
                </tr>
              
                <tr>
                    <td ><% dao.getnick(vo.getPlat()); %></td>
                    <td><%=vo.getDate() %></td>
                    <td><%=vo.getHit() %></td>
                </tr>
                <tr>
                   <td>
                       <div class="star_box">
                                <div> 1. 화질</div>
                                <div class="star">
                                   <div class="rating" id="no1">
                                    <span><input type="radio" name="pic" id="pstr5" value="5"><label for="str5"></label></span>
                                    <span><input type="radio" name="pic" id="pstr4" value="4"><label for="str4"></label></span>
                                    <span><input type="radio" name="pic" id="pstr3" value="3"><label for="str3"></label></span>
                                    <span><input type="radio" name="pic" id="pstr2" value="2"><label for="str2"></label></span>
                                    <span><input type="radio" name="pic" id="pstr1" value="1"><label for="str1"></label></span>
                                   </div>
                                </div>
                            </div>
                            <div class="star_box">
                                <div> 2. 서비스 이용료</div>
                                <div class="star">
                                   <div class="rating" id="no2">
                                    <span><input type="radio" name="money" id="mstr5" value="5"><label for="str5"></label></span>
                                    <span><input type="radio" name="money" id="mstr4" value="4"><label for="str4"></label></span>
                                    <span><input type="radio" name="money" id="mstr3" value="3"><label for="str3"></label></span>
                                    <span><input type="radio" name="money" id="mstr2" value="2"><label for="str2"></label></span>
                                    <span><input type="radio" name="money" id="mstr1" value="1"><label for="str1"></label></span>
                                   </div>
                                </div>
                            </div>
                            <div class="star_box">
                                <div> 3. 컨텐츠 양</div>
                                <div class="star">
                                   <div class="rating" id="no3">
                                    <span><input type="radio" name="quantity" id="qstr5" value="5"><label for="str5"></label></span>
                                    <span><input type="radio" name="quantity" id="qstr4" value="4"><label for="str4"></label></span>
                                    <span><input type="radio" name="quantity" id="qstr3" value="3"><label for="str3"></label></span>
                                    <span><input type="radio" name="quantity" id="qstr2" value="2"><label for="str2"></label></span>
                                    <span><input type="radio" name="quantity" id="qstr1" value="1"><label for="str1"></label></span>
                                   </div>
                                </div>
                            </div>
                            <div class="star_box">
                                <div> 4. 컨탠츠 다양성</div>
                                <div class="star">
                                   <div class="rating" id="no4">
                                    <span><input type="radio" name="kinds" id="kstr5" value="5"><label for="str5"></label></span>
                                    <span><input type="radio" name="kinds" id="kstr4" value="4"><label for="str4"></label></span>
                                    <span><input type="radio" name="kinds" id="kstr3" value="3"><label for="str3"></label></span>
                                    <span><input type="radio" name="kinds" id="kstr2" value="2"><label for="str2"></label></span>
                                    <span><input type="radio" name="kinds" id="kstr1" value="1"><label for="str1"></label></span>
                                   </div>
                                </div>
                            </div>
                            <div class="star_box">
                                <div> 5. 서비스 다양성</div>
                                <div class="star">
                                   <div class="rating" id="no5">
                                    <span><input type="radio" name="div" id="dstr5" value="5"><label for="str5"></label></span>
                                    <span><input type="radio" name="div" id="dstr4" value="4"><label for="str4"></label></span>
                                    <span><input type="radio" name="div" id="dstr3" value="3"><label for="str3"></label></span>
                                    <span><input type="radio" name="div" id="dstr2" value="2"><label for="str2"></label></span>
                                    <span><input type="radio" name="div" id="dstr1" value="1"><label for="str1"></label></span>
                                   </div>
                                </div>
                            </div>
                   </td>
                   <td colspan="2">
                      <textarea rows="10" cols="50" name="bcontent" id="rboard_content" placeholder=" 기타 의견을 입력해주세요"></textarea>           
                   </td>
               </tr>
               <tr>
                    <td colspan="3">
                        <button type="button" class="good" onclick="">
                           <img src="http://localhost:9000/OTT_Project/images/good2.png">
                        </button>
                        <button type="button" class="bad" onclick="">
                         <img src="http://localhost:9000/OTT_Project/images/bad2.png">
                        </button>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <a href="http://localhost:9000/OTT_Project/board/starboard_list.jsp">
                            <button type="button" class="">목록으로</button>
                        </a>
                        <a href="http://localhost:9000/OTT_Project/main.jsp">
                            <button type="button" class="">홈으로</button>
                        </a>
                    </td>
                </tr>
            </table>
        
        <!-- /**********************댓글********************/ -->
            <form name="starboard_commentForm" method="post" action="starboard_comment_write_proc.jsp" id="starboard_commentForm">
            <input type="hidden" name="bnum" value="<%=num %>">
                <table class="comment_table" >
                         <tr>
                             <td class="comment_nick"><%=(String)session.getAttribute("sid")%></td>
                             <td class="comment_text">
                                <textarea id = "starboard_commentText" style="height:50px;" class="form-control" placeholder="댓글을 입력해주세요." name="content"></textarea>
                             </td>
                             <td class="comment_btn">
                                <button type="button" class="comment_btn" onclick="starboard_comment_FormCheck()">댓글달기</button>
                             </td>
                         </tr>
                </table>
              </form>
                 <table class="other_comment">
                     <%for(CommentVO cvo:clist){ %>
                      <tr>
                          <td class="comment_nick"><%=cvo.getId() %></td>
                          <td class="comment_text">
                             <%=cvo.getContent() %>
                          </td>
                      </tr>
                      <%} %>
                 </table>   
       </section>
    </div>
    <footer>
        <iframe src="http://localhost:9000/OTT_Project/footer.jsp" scrolling="no" frameborder="0" width="100%" height="150px"></iframe>
    </footer>
<script type="text/javascript">
 
    function deletePage(idx){
        if(confirm("글을 삭제합니다")==true){
            location.href=""+idx;
            //delete.jsp?idx= ""안에 들어갈 코드예시. 
        }
    };
</script>
</body>
</html>