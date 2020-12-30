<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<style>
*{
padding:0;
margin:0;

}
.main-contents{
	width:1000px;
	margin:0 auto;
	margin-top:45px;
	
}

.nav-container2{
 display:flex;
 justify-content:center;
 border-bottom: 1px solid gray;
}
a{
	color:black;
	text-decoration: none;
}
.nav-items2{
	padding:20px;
	

}
.left{
	width:200px;
	border-right:1px solid gray;
	height:500px;
	
}
.main{
	display:flex;
	
}
.left-items{
	padding:20px;
	font-weight:bold;
	
	
}
.center{
	padding:20px;
	width:1000px;
	
	
}
.goods{
	padding-top:10px;
	font-weight:bold;
	color:orange;
	border-top:2px solid gray;
	border-bottom:2px solid gray;
	
	
}
.button-area{
	text-align:right;
	
}
h1{
	padding-bottom:20px;
	
}
.button-items{
		text-align:right;
}
.main-contents{
	width:1000px;
	margin:0 auto;
	margin-top:50px;
	
}
.comment-area{
	margin-top:60px;
	padding-bottom:140px;
	
	
}
.button-reply{
	text-align:right;
	margin-top:40px;
	
}
.information{
	font-weight:bold;
	color:red;
	
}
.atag{
color:white;
font-weight:bold;
}
.title{
	border-top:3px solid #444a6e;
	border-left:3px solid #d5d5d5;
	border-bottom:3px solid #d5d5d5;
	border-right:3px solid #d5d5d5;
	background-color:#d5d5d5;
}
.h1title{
	line-height:30px;
	
}
.Board-contents{
	font-weight:bold;
	text-align:center;
	font-size:40px;
	
	
	
}
.button-items{
	margin-top:100px;
	
}

</style>
<title>Insert title here</title>
</head>
<body>

<nav class="nav-container2">
<div class="nav-items2"><a href="http://localhost:8080/project/home">메인으로 돌아가기</a> </div>
<div class="nav-items2"><a href="">About us</a> </div>
<div class="nav-items2"><a href="http://localhost:8080/project/paint">그림 </a> </div>
<div class="nav-items2"><a href=""> 사진</a></div>
<div class="nav-items2"><a href="">공예</a> </div>
<div class="nav-items2"><a href="">음악</a> </div>
<div class="nav-items2"><a href="http://localhost:8080/project/board">게시판</a> </div>


</nav>

<div class="main-contents">
<div class="board_area">
<div class="title"> 
<h1 class="h1title">${reply_view.boardtopic }</h1>
<p class="writer">작성자:${reply_view.userid }</h3>
<h5>작성일자:${reply_view.rdate }</h5>

<h5>조회수:${reply_view.nClick}</h5>
</div>
   		<div class="Board-contents">
   		${reply_view.board_comment }
   		</div>
    	 <div class="button-items">
    <button type="button" class="btn btn-primary"><a class="atag" href="http://localhost:8080/project/board_update?board_num=${reply_view.board_num }">글삭제하기/수정하기</a></button>
    
    <button type="button" class="btn btn-info"><a class="atag" href="http://localhost:8080/project/board">글목록으로가기</a></button>
	<button type="button" class="btn btn-danger" id="report" name="report"><a class="atag" href="http://localhost:8080/project/report?board_num=${reply_view.board_num }">신고하기</a></button>
    
    </div>
      <div class="comment-area">
    <h1>현재 게시글에대한 답글을 달아보세요ლ( ╹ ◡ ╹ ლ)!</h1>
    <ul class="information">
    	<li>광고 및 기타 상업행위 글은 금지합니다.(삭제 및 법적 조치)( ˃̆ૢ௰˂̆ૢഃ ) ლ </li>
		<li>욕설 및 비방 글을 금지합니다 ( ღ'ᴗ'ღ ).</li>
		
    
    </ul>
    
    
    <div class="comment-items">
   <form action="reply" method="post">
		  <table class="table table-striped">
			<input type="hidden" name="board_num" value="${reply_view.board_num}">
			<input type="hidden" name="bGroup" value="${reply_view.bGroup}">
			<input type="hidden" name="bStep" value="${reply_view.bStep}">
			<input type="hidden" name="bIndent" value="${reply_view.bIndent}">
			<table class="table table-striped" >
    	
    	<tr><td algin=right>작성자(익명)</td> <td><div class="input-group mb-3">
  			<input type="hidden" value="hidden" name="hidden" readonly>
  			
  <input type="text"  id="userid" name="userid" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
</div></td></tr>


	<tr><td algin=right>제목</td> <td><div class="input-group mb-3">
  			<input type="hidden" value="hidden" name="hidden" readonly>
  			
  <input type="text"  id="boardtopic" name="boardtopic" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
</div></td></tr>



    	</table>
    	<div class="form-floating">
    	
  <textarea class="form-control" style=height:300px; id="floatingTextarea" name="board_comment" id="board_comment"></textarea>
  <label for="floatingTextarea">Comments</label>
  
</div>

<div class="button-reply">
	<button type="submit" name="comment" id="comment" value="comment" class="btn btn-success">댓글 작성</button>
</div>

<div class="under">

<table class="table table-striped" >
      <tr>
         <td>번호</td>
         <td>제목</td>
         <td>이름</td>
         <td>날짜</td>
         <td>조회수</td>
      </tr>
      <c:forEach var="dto" items="${dtos}">
      <tr>
         <td>${dto.board_num}</td>
         <td>${dto.userid}</td>
         <td>
            <c:forEach begin="0" end="${dto.bIndent}">ㄴ</c:forEach>
            <a href="board_view?board_num=${dto.board_num}">${dto.boardtopic}</a></td>
         <td>${dto.rdate}</td>
         <td>${dto.nClick}</td>
      </tr>
      </c:forEach>
     
   </table>
   <div class="paging-items">
   
   
  <nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>
</nav>
</div>
  
  
   </div>


		
			
			
	</table>
	</form>
  		
		
    </div>
    
    
    
    
    
   
    </div>
    
    
   
    </div>
    
  
   </div>


    

</body>
</html>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script language="javascript">
$( document ).ready(function() {
	$("#userid").val("${userid.userid}")
});


$(document)
.on("click","#comment",function(){ 
	if($("#userid").val()==""){
		alert("작성자를 입력해주세요!")
		return false;
	}
	if($("#boardtopic").val()==""){
		alert("제목을 입력해주세요!")
		return false;
	}
	if($("#floatingTextarea").val()==""){
		alert("내용을 입력해주세요!")
		return false;
	}
})


</script>