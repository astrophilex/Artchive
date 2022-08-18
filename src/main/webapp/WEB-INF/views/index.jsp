<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>arTchive</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/tools/reset.css'/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/header.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/banner.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/exhibition.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/recommended.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/chatbot.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/search.css'/>">
		<script src="<c:url value='/tools/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/indexHeader.js'/>"></script>
		<script src="<c:url value='/js/chatbotShow.js'/>"></script>
		<script src="<c:url value='/js/search.js'/>"></script>
		<script type="text/javascript"></script>
	</head>
	<body>
		<div id="wrap">
	
		<header>
			<div id="mainMenu">
    
       		<div id="logoBox"><a class="color" href="<c:url value='/'/>">arTchive</a></div><!-- ✚ -->
        	
        	<div id="headerBox">
        		<nav>
        				<ul>
        					<li><a class="color" href="<c:url value='/list'/>">전시검색</a></li>
        					<li><a class="color" href="<c:url value='/index2'/>">menu2</a></li>
        					<li><a class="color" href="#">menu3</a></li>
        					<li><a class="color" href="#">menu4</a></li>
        					<li><a class="color" href="#">menu5</a></li>
        				</ul>		
        		</nav>
        	</div> <!-- headerBox -->
        	
        	<div id="loginBox">
        		<ul>
        			<li><a href="#"><img src="<c:url value='/image/search.png'/>" id="searchImg"></a></li>
        			<li><a class="color" href="#">JOIN</a></li>
        			<li><a class="color" href="#">LOGIN</a></li>
        		</ul>
        	</div> <!-- loginBox -->
        	
        	<div id="searchBox">
				<div>
					<input type="text" id="searchMessage" name="searchMessage" size="120"  placeholder="검색어를 입력하세요."/>
					<input type="button" id="searchBtn" value="검색">
					<img src="<c:url value='/image/whiteX.png'/>">
				</div>
			</div><!-- searchBox -->
        	
        	</div> <!-- mainMenu -->
        	
        		<div id="visual"><img src="<c:url value='/image/banner.jpg'/>"></div>
            </header>
		
		<!-- top으로 이동 -->
		<%--  <c:import url="/WEB-INF/views/layout/top.jsp" /> --%>


           	<div id="banner">
           		<div id="bannerText1" class="bannerText">
	           		<ul>
						<li>전시회 코스 추천 받기</li>
					</ul>
           		</div>
           		<div id="bannerText2" class="bannerText">
					<ul>
						<li>전시회 추천 받기</li>
					</ul>
           		</div>
           		<div id="bannerText3" class="bannerText">
           			<ul>
						<li><a href="#">Get a Recommendation</a></li>
					</ul>
           		</div>
           	</div><!-- banner -->

           	<div id="exhibition" class="h2">
	           		<ul>
	           			<li>지금 하고 있는 전시</li>
	           		</ul>

	           		<div id="exhibitionMore">
		           		<ul>
		           			<li><a href="#">MORE ></a></li>
		           		</ul>
	           		</div>

          		<div id="exhibitionImg1" class="exhibitionImg">
           		<ul>
           			<li><img src="<c:url value='/image/banner.jpg'/>"><a href="<c:url value='/detail'/>"></a></li>
           			<li><a href="<c:url value='/detail'/>">전시회명1</a></li>
           			<li><a href="#">2022.00.00-2022.00.00</a></li>
           		</ul>
           		</div>

           		<div id="exhibitionImg2" class="exhibitionImg">
           		<ul>
           			<li><img src="<c:url value='/image/banner.jpg'/>"></li>
           			<li><a href="#">전시회명2</a></li>
           			<li><a href="#">2022.00.00-2022.00.00</a></li>
           		</ul>
           		</div>

           		<div id="exhibitionImg3" class="exhibitionImg">
           		<ul>
           			<li><img src="<c:url value='/image/banner.jpg'/>"></li>
           			<li><a href="#">전시회명3</a></li>
           			<li><a href="#">2022.00.00-2022.00.00</a></li>
           		</ul>
           		</div>

           		<div id="exhibitionImg4" class="exhibitionImg">
           		<ul>
           			<li><img src="<c:url value='/image/banner.jpg'/>"></li>
           			<li><a href="#">전시회명4</a></li>
           			<li><a href="#">2022.00.00-2022.00.00</a></li>
           		</ul>

           		</div>
           	</div><!-- exhibition -->

           	<div id="exhibition2">
	           		<ul>
	           			<li>UserName님에게 추천하는 전시</li>
	           		</ul>

	           	<div id="exhibitionMore2">
	           		<ul>
	           			<li><a href="#">MORE ></a></li>
	           		</ul>
	           	</div>

          		<div id="exhibition2Img1" class="exhibition2Img" OnClick="location.href ='http://URL주소'" style="cursor:pointer;">
           		<ul>
           			<li><img src="<c:url value='/image/banner.jpg'/>"></li>
           			<li><a href="#">전시회명1</a></li>
           			<li><a href="#">2022.00.00-2022.00.00</a></li>
           		</ul>
           		</div>

           		<div id="exhibition2Img2" class="exhibition2Img">
           		<ul>
           			<li><img src="<c:url value='/image/banner.jpg'/>"></li>
           			<li><a href="#">전시회명2</a></li>
           			<li><a href="#">2022.00.00-2022.00.00</a></li>
           		</ul>
           		</div>

           		<div id="exhibition2Img3" class="exhibition2Img">
           		<ul>
           			<li><img src="<c:url value='/image/banner.jpg'/>"></li>
           			<li><a href="#">전시회명3</a></li>
           			<li><a href="#">2022.00.00-2022.00.00</a></li>
           		</ul>
           		</div>

           		<div id="exhibition2Img4" class="exhibition2Img">
           		<ul>
           			<li><img src="<c:url value='/image/banner.jpg'/>"></li>
           			<li><a href="#">전시회명4</a></li>
           			<li><a href="#">2022.00.00-2022.00.00</a></li>
           		</ul>

           		</div>
           	</div><!-- exhibition -->

           	<div id="recommended">
           		<div id="recommended1" >
	           		<ul>
						<li>
						<img src="<c:url value='/image/recommended1.jpg'/>">
						</li>
	           		</ul>
	           		<div id="description1" class="description">
	           			<ul>
	           				<li><a>@userName</a></li>
	           				<li>간단한 설명</li>
	           				<li>에디터픽 추천 코스</li>
	           			</ul>
	           		</div>
           		</div>

           		<div id="recommended2">
	           		<ul>
						<li>
						<img src="<c:url value='/image/recommended2.jpg'/>">
						</li>
	           		</ul>
	           		<div id="description2" class="description">
	           			<ul>
	           				<li><a>@userName</a></li>
	           				<li>간단한 설명</li>
	           				<li>에디터픽 추천 코스</li>
	           			</ul>
	           		</div>
           		</div>

           		<div id="recommended3">
	           		<ul>
						<li>
						<img src="<c:url value='/image/recommended3.jpg'/>">
						</li>
	           		</ul>
	           		<div id="description3" class="description">
	           			<ul>
	           				<li><a>@userName</a></li>
	           				<li>간단한 설명</li>
	           				<li>에디터픽 추천 코스</li>
	           			</ul>
	           		</div>
           		</div>

           	</div><!-- Recommended-->
           	
           	<!-- 챗봇 -->
           	<div id=chatbotTest>
			<!-- Header -->
			<div id="chatHeader">
				<span>챗봇</span>
				<button id="btnClose">X</button>
			</div>
			
			 <!-- 채팅 내용 출력 영역  -->
			<div id="chatBox"></div>
			
			<div>
				<form id="chatForm" name="chatForm">
					<input type="text" id="message" name="message" size="30"  placeholder="질문을 입력하세요"/>
					<input type="image" src = "<c:url value='/image/send.png'/>" id="submitBtn" value="submit">
				</form>
			</div>
			</div><!-- 챗봇 끝 -->
			
			<div id="chatImage">
			<img src="<c:url value='/image/chatbot.png'/>">
			</div>
		
          <!-- bottom 이동 -->
          <c:import url="/WEB-INF/views/layout/bottom.jsp" />

       </div> <!-- wrap -->
	</body>
</html>