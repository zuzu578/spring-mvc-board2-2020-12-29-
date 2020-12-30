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
<table class="table table-striped" >
   		<tr><td algin=right>게시물번호</td> <td>${reply_view.board_num }</td></tr>
    	<tr><td algin=right>제목</td> <td>${reply_view.boardtopic }</td></tr>
    	<tr><td algin=right>작성자</td> <td>${reply_view.userid }</td></tr>
    	<tr><td algin=right>작성일</td> <td>${reply_view.rdate }</td></tr>
    	<tr><td algin=right>내용</td> <td>${reply_view.board_comment }</td></tr>
    	<tr><td algin=right>조회수</td> <td>${reply_view.nClick}</td></tr>
    
    </table>
    	 <div class="button-items">
    <button type="button" class="btn btn-primary"><a href="http://localhost:8080/project/board_update?board_num=${reply_view.board_num }">글삭제하기/수정하기</a></button>
    
    <button type="button" class="btn btn-info"><a href="http://localhost:8080/project/board">글목록으로가기</a></button>
    <button type="button" class="btn btn-danger"><a href="http://localhost:8080/project/reply_view?board_num=${reply_view.board_num }">댓글 달러가기</a></button>
    
    </div>
      <div class="comment-area">
    <h1>현재 게시글에대한 답글을 달아보세요ლ( ╹ ◡ ╹ ლ)!</h1>
    
    
    
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