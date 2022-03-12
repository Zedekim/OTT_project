<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content = "width=device-width, initial-scale=1">
<title>Insert title here</title>
<style>
    *{
        margin:0;
        padding:0;
    }
    div.main_content, div.content_row{
        display:flex;
    }
    div.main_content{
        width:900px;
        height:600px;
        margin:auto;
        flex-direction:column;
        justify-content: space-around;
    }
    div.content_row{
        height:150px;
        justify-content: space-around;
    }
    div.main_review{
        width:25%;
    }
    div.main_review:hover{
        cursor:pointer;
    }
    .nickname{
        font-size:16pt;
        font-weight:bold;
    }
    
    /********별점***********/
    .rating {
    float:left;
    }
    .rating span { float:right; position:relative; }
    .rating span input {
        position:absolute;
        top:0px;
        left:0px;
        opacity:0;
    }
    .rating span label {
        display:inline-block;
        width:30px;
        height:30px;
        text-align:center;
        color:#FFF;
        background:#ccc;
        font-size:30px;
        margin-right:2px;
        /* line-height:30px; */
        border-radius:50%;
        -webkit-border-radius:50%;
    }
    .rating span:hover ~ span label,
    .rating span:hover label,
    .rating span.checked label,
    .rating span.checked ~ span label {
        background:#F90;
        color:#FFF;
    }
    
    /******리뷰 내용************/
    .review_content{
       clear:both;
    }
    /**********로고 크기******/
    .img_box{
       border:1px solid #f1f1f1;
       width:100px;
       height:100px;
       text-align:center;   
    }
    .logo{
       box-sizing:border-box;
       padding:10px 0;
    }
</style>
<!-- <script>
    $(document).ready(function(){
        // Check Radio-box
        $(".rating input:radio").attr("checked", false);
        
        $('.rating input').click(function () {
            $(".rating span").removeClass('checked');
            $(this).parent().addClass('checked');
        });
    
        $('input:radio').change(function(){
            var userRating = this.value;
            /* alert(userRating); */
            //console.log(userRating);
        }); 
    });
</script> -->
</head>
<body>
    <header>
        <iframe src="http://localhost:9000/OTT_Project/header.jsp" scrolling="no" frameborder="0" width="100%" height="150px" ></iframe>
    </header>
    <section class="main_content">
        <div class="main_content">
           <div></div>
           <div class="content_row">
                <div class="img_box logo">
                   <a href="http://localhost:9000/OTT_Project/board/starboard_netflex.jsp">
                        <img src="http://localhost:9000/OTT_Project/images/netflix1.png">
                   </a>
                </div>
                <div class="main_review" onclick="location.href='http://localhost:9000/OTT_Project/board/freeboard_content.jsp';">
                    <div class="nickname">test1</div>
                    <div class="main_star">
                       <div class="rating" id="no2">
                            <span><input type="radio" name="rating" id="str5" value="5"><label for="str5"></label></span>
                            <span><input type="radio" name="rating" id="str4" value="4"><label for="str4"></label></span>
                            <span><input type="radio" name="rating" id="str3" value="3"><label for="str3"></label></span>
                            <span><input type="radio" name="rating" id="str2" value="2"><label for="str2"></label></span>
                            <span><input type="radio" name="rating" id="str1" value="1"><label for="str1"></label></span>
                       </div>
                    </div>
                    <div class="review_content">재밌어요</div>
                </div>
                <div class="main_review">
                    <div class="nickname">test1</div>
                    <div class="main_star">
                       <div class="rating" id="no2">
                            <span><input type="radio" name="rating" id="str5" value="5"><label for="str5"></label></span>
                            <span><input type="radio" name="rating" id="str4" value="4"><label for="str4"></label></span>
                            <span><input type="radio" name="rating" id="str3" value="3"><label for="str3"></label></span>
                            <span><input type="radio" name="rating" id="str2" value="2"><label for="str2"></label></span>
                            <span><input type="radio" name="rating" id="str1" value="1"><label for="str1"></label></span>
                       </div>
                    </div>
                    <div class="review_content">재밌어요</div>
                </div>
                <div class="main_review">
                    <div class="nickname">test1</div>
                    <div class="main_star">
                       <div class="rating" id="no2">
                            <span><input type="radio" name="rating" id="str5" value="5"><label for="str5"></label></span>
                            <span><input type="radio" name="rating" id="str4" value="4"><label for="str4"></label></span>
                            <span><input type="radio" name="rating" id="str3" value="3"><label for="str3"></label></span>
                            <span><input type="radio" name="rating" id="str2" value="2"><label for="str2"></label></span>
                            <span><input type="radio" name="rating" id="str1" value="1"><label for="str1"></label></span>
                       </div>
                    </div>
                    <div class="review_content">재밌어요</div>
                </div>
           </div>
<!-- /*************************************************************************/ -->
           <div class="content_row">
                <div class="img_box">
                   <a href="http://localhost:9000/OTT_Project/board/starboard_wavve.jsp">
                        <img src="./images/wavve_logo2.jpg">
                   </a>
                </div>
                <div class="main_review">
                    <div class="nickname">test1</div>
                    <div class="main_star">
                       <div class="rating" id="no2">
                            <span><input type="radio" name="rating" id="str5" value="5"><label for="str5"></label></span>
                            <span><input type="radio" name="rating" id="str4" value="4"><label for="str4"></label></span>
                            <span><input type="radio" name="rating" id="str3" value="3"><label for="str3"></label></span>
                            <span><input type="radio" name="rating" id="str2" value="2"><label for="str2"></label></span>
                            <span><input type="radio" name="rating" id="str1" value="1"><label for="str1"></label></span>
                       </div>
                    </div>
                    <div class="review_content">재밌어요</div>
                </div>
                <div class="main_review">
                    <div class="nickname">test1</div>
                    <div class="main_star">
                       <div class="rating" id="no2">
                            <span><input type="radio" name="rating" id="str5" value="5"><label for="str5"></label></span>
                            <span><input type="radio" name="rating" id="str4" value="4"><label for="str4"></label></span>
                            <span><input type="radio" name="rating" id="str3" value="3"><label for="str3"></label></span>
                            <span><input type="radio" name="rating" id="str2" value="2"><label for="str2"></label></span>
                            <span><input type="radio" name="rating" id="str1" value="1"><label for="str1"></label></span>
                       </div>
                    </div>
                    <div class="review_content">재밌어요</div>
                </div>
                <div class="main_review">
                    <div class="nickname">test1</div>
                    <div class="main_star">
                       <div class="rating" id="no2">
                            <span><input type="radio" name="rating" id="str5" value="5"><label for="str5"></label></span>
                            <span><input type="radio" name="rating" id="str4" value="4"><label for="str4"></label></span>
                            <span><input type="radio" name="rating" id="str3" value="3"><label for="str3"></label></span>
                            <span><input type="radio" name="rating" id="str2" value="2"><label for="str2"></label></span>
                            <span><input type="radio" name="rating" id="str1" value="1"><label for="str1"></label></span>
                       </div>
                    </div>
                    <div class="review_content">재밌어요</div>
                </div>
           </div>
<!-- /*************************************************************************/ -->
           <div class="content_row">
                <div class="img_box logo">
                   <a href="http://localhost:9000/OTT_Project/board/starboard_disney.jsp">
                        <img src="./images/Disney_logo2.png">
                   </a>
                </div>
                <div class="main_review">
                    <div class="nickname">test1</div>
                    <div class="main_star">
                       <div class="rating" id="no2">
                            <span><input type="radio" name="rating" id="str5" value="5"><label for="str5"></label></span>
                            <span><input type="radio" name="rating" id="str4" value="4"><label for="str4"></label></span>
                            <span><input type="radio" name="rating" id="str3" value="3"><label for="str3"></label></span>
                            <span><input type="radio" name="rating" id="str2" value="2"><label for="str2"></label></span>
                            <span><input type="radio" name="rating" id="str1" value="1"><label for="str1"></label></span>
                       </div>
                    </div>
                    <div class="review_content">재밌어요</div>
                </div>
                <div class="main_review">
                    <div class="nickname">test1</div>
                    <div class="main_star">
                       <div class="rating" id="no2">
                            <span><input type="radio" name="rating" id="str5" value="5"><label for="str5"></label></span>
                            <span><input type="radio" name="rating" id="str4" value="4"><label for="str4"></label></span>
                            <span><input type="radio" name="rating" id="str3" value="3"><label for="str3"></label></span>
                            <span><input type="radio" name="rating" id="str2" value="2"><label for="str2"></label></span>
                            <span><input type="radio" name="rating" id="str1" value="1"><label for="str1"></label></span>
                       </div>
                    </div>
                    <div class="review_content">재밌어요</div>
                </div>
                <div class="main_review">
                    <div class="nickname">test1</div>
                    <div class="main_star">
                       <div class="rating" id="no2">
                            <span><input type="radio" name="rating" id="str5" value="5"><label for="str5"></label></span>
                            <span><input type="radio" name="rating" id="str4" value="4"><label for="str4"></label></span>
                            <span><input type="radio" name="rating" id="str3" value="3"><label for="str3"></label></span>
                            <span><input type="radio" name="rating" id="str2" value="2"><label for="str2"></label></span>
                            <span><input type="radio" name="rating" id="str1" value="1"><label for="str1"></label></span>
                       </div>
                    </div>
                    <div class="review_content">재밌어요</div>
                </div>
           </div><!-- content_row -->
        </div> <!-- main_content -->
    </section>
</body>
</html>