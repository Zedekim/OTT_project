<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ott.vo.StarBoardVO, com.ott.dao.BoardDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="http://localhost:9000/OTT_Project/board/board.css" rel="stylesheet">
<style>
#no1 span:hover label,
#no1 span:hover ~ span input[name='pic'] + label,
 {
    background:#F90;
    color:#FFF;
}
#no2 span:hover label,
#no2 span:hover ~ span input[name='money'] + label,
 {
    background:#F90;
    color:#FFF;
}
#no3 span:hover label,
#no3 span:hover ~ span input[name='quantity'] + label,
 {
    background:#F90;
    color:#FFF;
}
#no4 span:hover label,
#no4 span:hover ~ span input[name='kinds'] + label,
 {
    background:#F90;
    color:#FFF;
}
#no5 span:hover label,
#no5 span:hover ~ span input[name='div'] + label,
 {
    background:#F90;
    color:#FFF;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
	    // Check Radio-box
	    $(".rating input:radio").attr("checked", false);
	    
	    $('.rating input[name=pic]').click(function () {
	        $("#no1 span").removeClass('checked');
	        $(this).parent().addClass('checked');
	    });
	    $('.rating input[name=money]').click(function () {
            $("#no2 span").removeClass('checked');
            $(this).parent().addClass('checked');
        });
	    $('.rating input[name=quantity]').click(function () {
            $("#no3 span").removeClass('checked');
            $(this).parent().addClass('checked');
        });
	    $('.rating input[name=kinds]').click(function () {
            $("#no4 span").removeClass('checked');
            $(this).parent().addClass('checked');
        });
	    $('.rating input[name=div]').click(function () {
            $("#no5 span").removeClass('checked');
            $(this).parent().addClass('checked');
        });
	
	    /* $('input:radio').change(function(){
	        var userRating = this.value;
	        alert(userRating);
	       console.log(userRating);
	    });  */
	});
</script>
</head>
<body>
    <header>
        <iframe src="http://localhost:9000/OTT_Project/header.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe>
    </header>
    <div class="notice_write">
        <section class="notice_write">
            <h1>평가게시판-글쓰기</h1>
            <form name="starboard_write_Form" action="starboard_write_proc.jsp" method="post">
            <input type="hidden" name="nid" value=""> 
           
                <table class="board_update_delete_write rboard_write_table" >
                    <tr>
                        <td colspan="2">
                            <select class="email2" name='plat' id="plat" onchange="">
				               <option value="choice" selected>선택</option>
				               <option value="netflix">넷플릭스</option>
				               <option value="wavve">웨이브</option>
				               <option value="disneyplus">디즈니플러스</option>
				            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="text" name="title" value="" id="rboard_title" placeholder=" 제목을 입력해주세요">
                        </td>
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
                         <td>
                            <textarea rows="10" cols="50" name="etc" id="rboard_content" placeholder=" 기타 의견을 입력해주세요"></textarea>           
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button type="submit" class="" onclick="">글쓰기</button>
                            <a href="http://localhost:9000/OTT_Project/board/starboard_list.jsp">
                                <button type="button" class="">취소</button>
                            </a>
                           
                        </td>
                    </tr>
                </table>
            </form>
        </section>
    </div>
    <footer>
        <iframe src="http://localhost:9000/OTT_Project/footer.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe> 
        
    </footer>

</body>
</html>