/*회원 정지 팝업*/
    function block_popup_visible(){
        /*let popup=document.getElementsByClassName("user_block_popup")*/
        var popupW = 330;
        var popupH = 300;
        
        winleft = (screen.width-popupW)/2;
        wintop = (screen.height-popupH)/2;
        
        var options = "width="+popupW+" height="+popupH+" left="+winleft
        +" top="+wintop;
        window.open("http://localhost:9000/OTT_Project/adminpage/adminpage_popup.jsp", "block-popup",options);
    }
/*회원 정지 팝업-유효성 체크*/
    /*function block_popup_formCheck(){
        let list,count;
        
        list = document.getElementsByName("block_period");
        count = 0;
        
        for(let i=0;i<list.length;i++){
            if(list[i].checked){
                count++;
            }
        }
        
        if(count==0){
            alert("정지기간을 선택해주세요.")
            return false;
            
        }else{
            block_period_form.submit();
        }
    }*/
/*회원 신고 유형별 보기 팝업*/
    function report_popup_visible(){
        /*let popup=document.getElementsByClassName("user_block_popup")*/
        var popupW = 900;
        var popupH = 240;
        
        winleft = (screen.width-popupW)/2;
        wintop = (screen.height-popupH)/2;
        
        var options = "width="+popupW+" height="+popupH+" left="+winleft
        +" top="+wintop;
        window.open("http://localhost:9000/OTT_Project/adminpage/adminpage_user_report.jsp", "block-popup",options);
    }
 
 /*noticeboard-write-ValidationCheck*/
    function noticeboard_write_FormCheck(){
        let noticeboard_write_title=document.getElementById("noticeboard_write_title");
        let noticeboard_write_content=document.getElementById("noticeboard_write_content");
        
        if(noticeboard_write_title.value==""){
            alert("제목을 입력해주세요.");
            return false;
        }else if(noticeboard_write_content.value==""){
            alert("내용을 입력해주세요.");
            return false;
        }else{
            notice_write_Form.submit();
        }
}
/*FAQboard-write-ValidationCheck*/
    function faqboard_write_FormCheck(){
        let faqboard_write_title=document.getElementById("faqboard_write_title");
        let faqboard_write_content=document.getElementById("faqboard_write_content");
        
        if(faqboard_write_title.value==""){
            alert("제목을 입력해주세요.");
            return false;
        }else if(faqboard_write_content.value==""){
            alert("내용을 입력해주세요.");
            return false;
        }else{
            faq_write_Form.submit();
        }
}
/*Questionboard-write-ValidationCheck*/
    function questionboard_write_FormCheck(){
        let questionboard_write_title=document.getElementById("questionboard_write_title");
        let questionboard_write_content=document.getElementById("questionboard_write_content");
        
        if(questionboard_write_title.value==""){
            alert("제목을 입력해주세요.");
            return false;
        }else if(questionboard_write_content.value==""){
            alert("내용을 입력해주세요.");
            return false;
        }else{
            aminpage_question_write_Form.submit();
        }
}
/*Questionboard-write-ValidationCheck*/
function questionboard_comment_FormCheck(){
        let adminpage_questionboard_commentText=document.getElementById("adminpage_questionboard_commentText");
        
        if(adminpage_questionboard_commentText.value==""){
            alert("댓글내용을 입력해주세요.");
            return false;
        }else{
            questionboard_commentForm.submit();
        }
}