/****************자유게시판 유효성 검사*******************/
function freeboard_write_FormCheck(){
        let fboard_title=document.getElementById("freeboard_write_title");
        let fboard_content=document.getElementById("freeboard_write_content");
        
        if(fboard_title.value=="" && fboard_content.value==""){
            alert("제목과 내용을 입력해주세요.");
            return false;
        }else if(fboard_title.value==""){
            alert("제목을 입력해주세요.");
            return false;
        }else if(fboard_content.value==""){
            alert("내용을 입력해주세요.");
            return false;
        }else{
            freeboard_write_Form.submit();
        }
}

function freeboard_comment_FormCheck(){
        let freeboard_commentText=document.getElementById("freeboard_commentText");
        
        if(freeboard_commentText.value==""){
            alert("댓글내용을 입력해주세요.");
            return false;
        }else{
            freeboard_commentForm.submit();
        }
}
function questionboard_comment_FormCheck(){
        let questionboard_commentText=document.getElementById("questionboard_commentText");
        
        if(questionboard_commentText.value==""){
            alert("댓글내용을 입력해주세요.");
            return false;
        }else{
            questionboard_commentForm.submit();
        }
}
function starboard_comment_FormCheck(){
        let starboard_commentText=document.getElementById("starboard_commentText");
        
        if(starboard_commentText.value==""){
            alert("댓글내용을 입력해주세요.");
            return false;
        }else{
            starboard_commentForm.submit();
        }
}
