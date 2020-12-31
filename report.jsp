<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://kit.fontawesome.com/8c9485b50e.js" crossorigin="anonymous"></script>
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
background-color:#e3f2fd;
 font-weight: bold;
 display:flex;
 justify-content:center;
 border-bottom: 1px solid gray;
 align-items:center;
}
a{
	color:black;
	text-decoration: none;
}
.nav-items2{
	
	

}
.nav-items{
	text-align:left;
	
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
	padding:10px;
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
.nav-items2{
	padding:20px;
	
}
.nav-items img{
	width:70%;
}
.report-main{
	width:600px;
	margin:0 auto;
	margin-top:60px;
	
}
.h1{
	padding-top:10px;
	padding-bottom:10px;
	
}
.report-buttons{
	text-align:right;
	margin-top:40px;
	
}
.board-items{

	text-align:center;
	margin-top:40px;
	margin-bottom:40px;
		
}
</style>
<title>Insert title here</title>
</head>
<body>


<nav class="nav-container2">
<div class="nav-items"><a href="http://localhost:8080/project/home"><img src="https://www.freelogodesign.org/file/app/client/thumb/a5ae1939-7ab5-4c73-954e-91a6a7299dd3_200x200.png?1609120650640"></a> </div>
<div class="nav-items2"><a href="">About us</a> </div>
<div class="nav-items2"><a href="http://localhost:8080/project/paint">그림 </a> </div>
<div class="nav-items2"><a href=""> 사진</a></div>
<div class="nav-items2"><a href="">공예</a> </div>
<div class="nav-items2"><a href="">음악</a> </div>
<div class="nav-items2"><a href="">게시판</a> </div>


</nav>
<div class="report-main">
<h1>누군가가 당신을 괴롭혔나요?</h1>
<ul class="report">
	<li> 악성게시물을 신고하게되면 해당글이 운영자로부터 전송이됩니다. </li>
		<li>운영자 판단에 따라 해당글을 삭제 , 또는 해당 글을 작성한 유저에게 제제를 줄수있습니다.  </li>
				<li>허위 신고일경우 불이익이 있을수있습니다.</li>

</ul>


<form action="try_report" method="POST">
<div class="report-board">
<div class="board-items">
<p class="items">신고할 유저 이름: <input type="text" id="userid"name="userid" value='${reply_view.userid }'readonly> </p>
<p class="items">신고할 게시물 제목: <input type="text" id="boardTitle"name="boardTitle" value='${reply_view.boardtopic }'readonly> </p>
<p class="items">신고할 게시물 내용: <input type="text" id="board_comment"name="board_comment"value='${reply_view.board_comment }'readonly> </p>

</div>

</div>

<div class="report-radioArea">



</div>
<div class="report_infor">

<h3> 신고 사유를 입력해주세요.</h3>
<ul calss="example">
	<p class="exmple"> 신고 예시 </p>
	<li>해당 유저의 닉네임이 불건전합니다.  </li>
	<li>해당 유저의 게시물이 타인을 괴롭히는 게시물입니다.  </li>
	<li>해당 유저의 게시물이 상업적인 내용입니다.  </li>
	<li>해당 게시물의 내용이 수위가 높습니다.  </li>
	

</ul>
</div>

<div class="form-floating">
  <textarea class="form-control" placeholder="Leave a comment here" name="report_comment" id="floatingTextarea" style="height:200px";></textarea>
  <label for="floatingTextarea">Report</label>
</div>
<div class="report-buttons">
<button type="submit" id="report" name="report" class="btn btn-danger">신고하기</button>


</div>
</form>


</div>




<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script language="javascript">
$(document)
.on("click","#report",function(){
	if($("#floatingTextarea").val()==""){
		alert("신고하려는 내역을 입력해주세요!");
		return false;
		
	}
	
	var c = confirm("신고 하시겠습니까?");
	if(c==true){
		alert("신고처리되었습니다. 검토후 처리하겠습니다.");
		
	}else{
		alert("신고를 취소합니다.")
		return false;
		
	}
	
})



</script>
