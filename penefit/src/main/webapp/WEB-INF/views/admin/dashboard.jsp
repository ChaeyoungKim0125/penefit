<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>대시보드</title>
     <script
      src="https://code.jquery.com/jquery-3.6.3.min.js"
      integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="/css/reset.css" />
    <style>
      body {
        background-color: #202020;
      }
      #container {
        position: apsolute;
        width: 100%;
        height: 100%;
      }
      #sideBar {
        display: inline-block;
        position: relative;
        width: 15%;
        height: 100vh;
        background-color: rgb(57, 57, 57);
      }
      #logo {
        font-weight: bold;
        font-size: 50px;
        text-align: center;
        height: 125px;
        width: 100%;
        display: inline-block;
        line-height: 130px;
        color: aqua;
      }
      #sideBox {
        border-top: 1px solid red;
      }
      .sideMenu {
        background-color: #232428;
        border-radius: 15px;
        text-align: center;
        width: 77%;
        height: 6vh;
        margin: 0 auto;
        margin-top: 20px;
        line-height: 6vh;
        transition: all 0.15s ease-in;
        cursor: pointer;
        font-size: 1.2em;
        font-weight: bold;
        color: rgb(81, 81, 81);
      }
      .sideMenu:hover {
        color: black;
        background-color: rgb(122, 225, 225);
      }
      #topBar {
        position: absolute;
        display: inline-block;
        width: 85%;
      }
      .subMenu {
        float: left;
        width: 11%;
        height: 3.5vh;
        background-color: rgb(57, 57, 57);
        color: rgb(81, 81, 81);
        margin: 20px 20px 0 20px;
        line-height: 3.5vh;
        text-align: center;
        border-radius: 7px;
        font-size: 16px;
        font-weight: bolder;
        cursor: pointer;
        transition: all 0.15s;
      }
      .subMenu1 {
        margin-left: 50px;
      }
      .subMenu:hover {
        background-color: white;
        transform: scale(1.03, 1.07);
        color: black;
      }
      .article {
        border-radius: 20px;
        position: absolute;
        left: 15%;
        top: 50px;
        width: 85%;
        height: 95%;
        display: grid;
        grid-gap: 15px;
        justify-content: center;
        grid-template-columns: repeat(3, 30%);
        grid-template-rows: repeat(3, 30%);
      }

      .box {
        position: relative;
        background-color: rgb(57, 57, 57);
        border-radius: 30px;
        margin-top: 30px;
      }
      #mainBox1 {
        grid-column: 1 / 3;
      }
      #mainBox4 {
      	grid-row: 2 / 4;
      }
      #mainBox5 {
      	grid-row: 2 / 4;
      }
      #mainBox6 {
      	grid-row: 2 / 4;
      }
      #ul2 {
        display: none;
      }
      #ul3 {
        display: none;
      }
      #ul4 {
        display: none;
      }
      #memberArticle {
        background-color: red;
      	display: none;
      }
      #managerArticle {
        background-color: orange;
        display: none;
      }
      #qnaArticle {
        background-color: yellow;
        display: none;
      }
      #noticeArticle {
        background-color: green;
        display: none;
      }
      #suggestionArticle {
        background-color: blue;
        display: none;
      }
      #classArticle {
        background-color: white;
        display: none;
      }
      #reviewArticle {
        background-color: purple;
        display: none;
      }
      #home {
      	display: inline-block;
      	position: absolute;
      	width: 150px;
      	height: 50px;
      	right: 15px;
      	top: 13px;
      	cursor: pointer;
      	z-index: 1;
      }
      .mainTop {
      	color: black;
      	width: 100%;
      	height: 70px;
      	background-color: white;;
      	border-radius: 30px 30px 0 0;
        display: flex;
        justify-content: center;
        align-items: center;
      }
      .mainTitle{
        display: inline-block;
        margin: 40px;
        font-size: 30px;
        color: skyblue
      }
      .mainTable {
     	text-align: center;
      	color: skyblue;
      	font-size: 20px;
      }
      td {
      	border-right: 1px solid white;
      	border-left: 1px solid white;
      }
      .footer{
      	position: absolute;
      	bottom: 0;
      	border-radius: 0 0 30px 30px;
      	width: 100%;
      	height: 50px;
      	background-color: black;
      	color: white;
      	display: flex;
      	flex-direction: row;
      	justify-content: center;
      	align-items: center;
      }
      .mainDate{
      	margin: 0 20px 0 20px;
      }
      .stick {
      	position: relative;
      	top: 50%;
      	background-color: orange;
      	width: 20px;
      	transform: translateY(-50%);
      	margin: 0 30px 0 30px;
      	color: white;
      }
      #stickBox {
      	display: flex;
      	position: absolute;
      	width: 100%;
      	height: 200px;
      	top: 0;
      	border-radius: 30px 30px 0 0;
      	flex-direction: row;
      	justify-content: center;
      	align-items: center;
      	
      }
      th {
      	border-right: 1px solid white;
      }
      .visit {
      	position: absolute;
      	top: -20px;
      }
    </style>
  </head>

  <body
    oncontextmenu="return false"
    onselectstart="return false"
    ondragstart="return false"
  >
    <div id="container">
      <div id="sideBar">
        <div id="logo">PeNeFit</div>
        <div id="sideBox">
          <div id="sideMenu1" class="sideMenu">Member Management</div>
          <div id="sideMenu2" class="sideMenu">Board Management</div>
          <div id="sideMenu3" class="sideMenu">Class Management</div>
          <div id="sideMenu4" class="sideMenu">Null</div>
        </div>
      </div>

      <div id="topBar">
        <ul id="ul1">
          <li id="member" class="subMenu subMenu1">Member List</li>
          <li id="manager" class="subMenu">Manager List</li>
        </ul>

        <ul id="ul2">
          <li id="qna" class="subMenu subMenu1">QnA List</li>
          <li id="notice" class="subMenu">Notice List</li>
        </ul>

        <ul id="ul3">
          <li id="suggestion" class="subMenu subMenu1">Suggestion List</li>
          <li id="class" class="subMenu">Class List</li>
          <li id="review" class="subMenu">Review List</li>
        </ul>

        <ul id="ul4">
          <li class="subMenu subMenu1">Null</li>
          <li class="subMenu">Null</li>
          <li class="subMenu">Null</li>
          <li class="subMenu">Null</li>
          <li class="subMenu">Null</li>
        </ul>
        <img id="home" src="../../images/logo.png"></img>
      </div>
      
      <!-- Article start -->
      
      <div id="mainArticle" class="article">
      
        <div id="mainBox1" class="box">
        
        	<div id = "stickBox">
	        	<c:forEach var = "visit" items = "${visits }">
	       			<div style = "height: ${visit.visit}px" class = "stick"><span class = "visit">${visit.visit }</span></div>
	       		</c:forEach>
	        </div>
	        
	       	<div class="footer" id="mainFooter">
	       		<c:forEach var = "visit" items = "${visits }">
	       			<div class = "mainDate">${visit.day}</div>
	       		</c:forEach>
	       	</div>
        
     	 </div>
        
        
        <div id="mainBox2" class="box">
        	<div class="mainTop">
        		<span class = "mainTitle">강사 리스트</span>
        	</div>
        	
       		<table class = "mainTable">
       			<thead>        		
        			<tr>
        				<th>ID</th>
        			</tr>
        		</thead>
        		
        		<tbody>
	        		<c:forEach var="member" items="${memberList }">
        				<tr>
	        				<td>${member.member_id }</td>
 	      	 			</tr>
	        		</c:forEach>
        		</tbody>
       			
       		</table>
       		<div class="footer"></div>
        </div>
        
        
        <div id="mainBox4" class="box">
        	<div class="mainTop">
        		<span class = "mainTitle">총 ${suggestionCount }개의 제안서가 있음</span>
        	</div>
        	
       		<table class = "mainTable">
       			<thead>        		
        			<tr>
        				<th>NO</th><th>ID</th>
        				<th>Title</th><th>regDate</th>
        			</tr>
        		</thead>
        		
        		<tbody>
	        		<c:forEach var="suggestion" items="${suggestionList }">
        				<tr>
	        				<td>${suggestion.suggest_num }</td>
	        				<td>${suggestion.member_id }</td>
	        				<td>${suggestion.suggest_title }</td>
	        				<td>${suggestion.suggest_regdate }</td>
 	      	 			</tr>
	        		</c:forEach>
        		</tbody>
       			
       		</table>
       		<div class="footer"></div>
        </div>
        
        
        <div id="mainBox5" class="box">
        
	        <div class="mainTop">
	        		<span class = "mainTitle">오늘의 클래스 </span>
	        </div>
	        	
       		<table class = "mainTable">
       			<thead>        		
        			<tr>
        				<th>Title</th><th>teacher</th>
        				<th>time</th><th>min/max</th>
        			</tr>
        		</thead>
        		
        		<tbody>
	        		<c:forEach var="vo" items="${classTodayList }">
        				<tr>
	        				<td>${vo.class_subject }</td>
	        				<td>${vo.class_teacher }</td>
	        				<td>${vo.class_date }</td>
	        				<td>${vo.class_memcnt }/${vo.class_memlit }</td>
 	      	 			</tr>
	        		</c:forEach>
        		</tbody>
       			
       		</table>
	        <div class="footer">
	        	<span>today: ${classTodayCount }&nbsp; </span>
	        	<span>end: ${classEndCount }&nbsp; </span>
	        	<span>active: ${classActiveCount }</span>
	        </div>
	    </div>
	        
        <div id="mainBox6" class="box">
        		        <div class="mainTop">
	        		<span class = "mainTitle"> QnA List </span>
	        </div>
	        	
       		<table class = "mainTable">
       			<thead>        		
        			<tr>
        				<th>No</th><th>Id</th>
        				<th>Title</th><th>regDate</th>
        			</tr>
        		</thead>
        		
        		<tbody>
	        		<c:forEach var="qna" items="${qnaList }">
        				<tr>
	        				<td>${qna.qna_num }</td>
	        				<td>${qna.member_id }</td>
	        				<td>${qna.qna_title }</td>
	        				<td>${qna.qna_regdate }</td>
 	      	 			</tr>
	        		</c:forEach>
        		</tbody>
       			
       		</table>
	        <div class="footer">
	        	<span>totla: ${qnaCount }</span>
	        </div>
        </div>
      </div>
      
      <div id="memberArticle" class="article">
        <div id="memberBox1" class="box">1</div>
        <div class="box">2</div>
        <div class="box">3</div>
        <div class="box">4</div>
        <div class="box">5</div>
        <div class="box">6</div>
        <div class="box">7</div>
        <div class="box">8</div>
        <div class="box">9</div>
      </div>

      <div id="managerArticle" class="article">
        <div id="managerBox1" class="box">1</div>
        <div class="box">2</div>
        <div class="box">3</div>
        <div class="box">4</div>
        <div class="box">5</div>
        <div class="box">6</div>
        <div class="box">7</div>
        <div class="box">8</div>
        <div class="box">9</div>
      </div>

      <div id="qnaArticle" class="article">
        <div id="qnaBox1" class="box">1</div>
        <div class="box">2</div>
        <div class="box">3</div>
        <div class="box">4</div>
        <div class="box">5</div>
        <div class="box">6</div>
        <div class="box">7</div>
        <div class="box">8</div>
        <div class="box">9</div>
      </div>

      <div id="noticeArticle" class="article">
        <div id="noticeBox1" class="box">1</div>
        <div class="box">2</div>
        <div class="box">3</div>
        <div class="box">4</div>
        <div class="box">5</div>
        <div class="box">6</div>
        <div class="box">7</div>
        <div class="box">8</div>
        <div class="box">9</div>
      </div>

      <div id="suggestionArticle" class="article">
        <div id="suggestionBox1" class="box">1</div>
        <div class="box">2</div>
        <div class="box">3</div>
        <div class="box">4</div>
        <div class="box">5</div>
        <div class="box">6</div>
        <div class="box">7</div>
        <div class="box">8</div>
        <div class="box">9</div>
      </div>

      <div id="classArticle" class="article">
        <div id="classBox1" class="box">1</div>
        <div class="box">2</div>
        <div class="box">3</div>
        <div class="box">4</div>
        <div class="box">5</div>
        <div class="box">6</div>
        <div class="box">7</div>
        <div class="box">8</div>
        <div class="box">9</div>
      </div>

      <div id="reviewArticle" class="article">
        <div id="reviewBox1" class="box">1</div>
        <div class="box">2</div>
        <div class="box">3</div>
        <div class="box">4</div>
        <div class="box">5</div>
        <div class="box">6</div>
        <div class="box">7</div>
        <div class="box">8</div>
        <div class="box">9</div>
      </div>
    </div>

    <script>
    
    
      // SubMenu Display
      $("#sideMenu1").click(() => {
        $("#ul1").css("display", "block");
        $("#ul2").css("display", "none");
        $("#ul3").css("display", "none");
        $("#ul4").css("display", "none");
      });
      $("#sideMenu2").click(() => {
        $("#ul1").css("display", "none");
        $("#ul2").css("display", "block");
        $("#ul3").css("display", "none");
        $("#ul4").css("display", "none");
      });
      $("#sideMenu3").click(() => {
        $("#ul1").css("display", "none");
        $("#ul2").css("display", "none");
        $("#ul3").css("display", "block");
        $("#ul4").css("display", "none");
      });
      $("#sideMenu4").click(() => {
        $("#ul1").css("display", "none");
        $("#ul2").css("display", "none");
        $("#ul3").css("display", "none");
        $("#ul4").css("display", "block");
      });

      // Article Display
      $("#home").click((event) => {
    	$(".subMenu").css("backgroundColor", "transparent");
    	$("#mainArticle").css("display", "grid");
        $("#memberArticle").css("display", "none");
        $("#managerArticle").css("display", "none");
        $("#qnaArticle").css("display", "none");
        $("#noticeArticle").css("display", "none");
        $("#suggestionArticle").css("display", "none");
        $("#classArticle").css("display", "none");
        $("#reviewArticle").css("display", "none");
      });
      $("#member").click(() => {
    	$(".subMenu").css("backgroundColor", "transparent");
      	$(event.target).css("backgroundColor", "white");
    	$("#mainArticle").css("display", "none");
        $("#memberArticle").css("display", "grid");
        $("#managerArticle").css("display", "none");
        $("#qnaArticle").css("display", "none");
        $("#noticeArticle").css("display", "none");
        $("#suggestionArticle").css("display", "none");
        $("#classArticle").css("display", "none");
        $("#reviewArticle").css("display", "none");
      });
      $("#manager").click(() => {
    	$(".subMenu").css("backgroundColor", "transparent");
      	$(event.target).css("backgroundColor", "white");  
    	$("#mainArticle").css("display", "none");
        $("#memberArticle").css("display", "none");
        $("#managerArticle").css("display", "grid");
        $("#qnaArticle").css("display", "none");
        $("#noticeArticle").css("display", "none");
        $("#suggestionArticle").css("display", "none");
        $("#classArticle").css("display", "none");
        $("#reviewArticle").css("display", "none");
      });
      $("#qna").click(() => {
    	$(".subMenu").css("backgroundColor", "transparent");
      	$(event.target).css("backgroundColor", "white");
    	$("#mainArticle").css("display", "none");
        $("#memberArticle").css("display", "none");
        $("#managerArticle").css("display", "none");
        $("#qnaArticle").css("display", "grid");
        $("#noticeArticle").css("display", "none");
        $("#suggestionArticle").css("display", "none");
        $("#classArticle").css("display", "none");
        $("#reviewArticle").css("display", "none");
      });
      $("#notice").click(() => {
    	$(".subMenu").css("backgroundColor", "transparent");
      	$(event.target).css("backgroundColor", "white");
    	$("#mainArticle").css("display", "none");
        $("#memberArticle").css("display", "none");
        $("#managerArticle").css("display", "none");
        $("#qnaArticle").css("display", "none");
        $("#noticeArticle").css("display", "grid");
        $("#suggestionArticle").css("display", "none");
        $("#classArticle").css("display", "none");
        $("#reviewArticle").css("display", "none");
      });
      $("#suggestion").click(() => {
    	$(".subMenu").css("backgroundColor", "transparent");
      	$(event.target).css("backgroundColor", "white");
    	$("#mainArticle").css("display", "none");
        $("#memberArticle").css("display", "none");
        $("#managerArticle").css("display", "none");
        $("#qnaArticle").css("display", "none");
        $("#noticeArticle").css("display", "none");
        $("#suggestionArticle").css("display", "grid");
        $("#classArticle").css("display", "none");
        $("#reviewArticle").css("display", "none");
      });
      $("#class").click(() => {
    	$(".subMenu").css("backgroundColor", "transparent");
      	$(event.target).css("backgroundColor", "white");
    	$("#mainArticle").css("display", "none");  
        $("#memberArticle").css("display", "none");
        $("#managerArticle").css("display", "none");
        $("#qnaArticle").css("display", "none");
        $("#noticeArticle").css("display", "none");
        $("#suggestionArticle").css("display", "none");
        $("#classArticle").css("display", "grid");
        $("#reviewArticle").css("display", "none");
      });
      $("#review").click(() => {
    	$(".subMenu").css("backgroundColor", "transparent");
      	$(event.target).css("backgroundColor", "white");
    	$("#mainArticle").css("display", "none");
        $("#memberArticle").css("display", "none");
        $("#managerArticle").css("display", "none");
        $("#qnaArticle").css("display", "none");
        $("#noticeArticle").css("display", "none");
        $("#suggestionArticle").css("display", "none");
        $("#classArticle").css("display", "none");
        $("#reviewArticle").css("display", "grid");
      });
    </script>
  </body>

</html>