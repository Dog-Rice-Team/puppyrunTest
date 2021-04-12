<%@page import="petdiary.model.vo.PetDiary"%>
<%@page import="java.util.ArrayList"%>
<%@page import="user.model.vo.User"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User user = (User)session.getAttribute("user");
	ArrayList<PetDiary> pList = (ArrayList<PetDiary>)request.getAttribute("pList");
%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 폰트, 이모티콘, JQUERY CDN-->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"/>
    <!-- CSS 파일 가져오기 -->
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/assets/css/index.css">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/assets/css/notice.css">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/assets/css/scroll.css">
    <!-- 파비콘 이미지 가져오기 -->
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/assets/img/Favicon/favicon.ico">
    <link rel="icon" href="<%= request.getContextPath() %>/assets/img/Favicon/favicon.ico">
    <!-- JS 파일 가져오기 -->
    <script src="<%= request.getContextPath() %>/assets/js/jquery-3.4.1.min.js"></script>
    <script src="<%= request.getContextPath() %>/assets/js/slider.js"></script>
    <script src="<%= request.getContextPath() %>/assets/js/scroll.js"></script>
	<title>산책일기 - 추억을 기록해요</title>
</head>
<body>
		<div id="wrap">
            <header>
                <!-- 헤더-->
                <div id="header">
                    <div id="tleft">
                    	<div id="search">
                            <form action="">
                                <input class="search-input" id="" type="text" placeholder="search">
                            </form>
                        </div>
                    </div>
                    <!-- 헤더 메인 로고 -->
                    <div id="header-logo">
                        <a href="/index.jsp" id="logo"></a>
                    </div>
                    <div id="tright">
                        <div id="login">
                        	<%
                        	if(user == null) {
                        	%>
                            	<a href="/login.jsp">
                                <i class="xi-face xi-2x"></i>
                           		</a>
                            	<a href="/login.jsp" id="login-content">로그인</a>
                            <%
                            } else {
                            %>
                            	<a href="/user/myInfo">
                                <img src="#"> <!-- 사진어케 가져와 -->
                           		</a>
                            	<a href="/user/myInfo" id="login-content"><%= user.getUserNick() %></a>
                            <%
                            }                        
                            %>
                        </div>
                    </div>
                </div>
            </header>
            <nav>
                <!-- 메뉴 -->
                <div id="main-menu">
                    <ul id="main-navi-ul">
                        <li class="main-navi-li">
                            <a href="/petdiary/list">산책일기</a>
                        </li>
                        <li class="main-navi-li">
                            <a href="#">산책짝꿍</a>
                        </li>
                        <li class="main-navi-li">
                            <a href="#">멍멍이야기</a>
                        </li>
                        <li class="main-navi-li">
                            <a href="/notice/list">퍼피런이야기</a>
                        </li>
                        <li class="main-navi-li">
                            <a href="#">반려견계산기</a>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- 스크롤 메뉴 -->
            <div class="scroll-wrap">
                <a href="#" class="top"><div><i class="fas fa-chevron-up"></i></div>Top</a>
                <a href="#" class="message"><div><i class="far fa-comment-alt"></i></div>메시지</a>
            </div>
            <!-- 메인 ---------------------------------------------------------------------------------------------------------->
	        <%
	   		//getInstance 는 Calendar의 객체만의 생성한 것이다.
	   		Calendar cal = Calendar.getInstance();
	   
	   		//현재 년도와 현재 달을 받아온 것이다. +1은 0 ~11월달까지 주어지기 때문에 + 1을 해 준 것이다.
	   		int nowYear = cal.get(Calendar.YEAR);
	   		int nowMonth = cal.get(Calendar.MONTH)+1;
	   		
	   		//year 년과 month을 값을 받아 온것이다.(이전달, 다음달을 클릭하였을때 받아오는 값)
	   		String fyear = request.getParameter("year");
	   		String fmonth = request.getParameter("month");
	   		
	   		//현재년도와 현재 달을 year과 month로 선언해주었따.
	   		int year = nowYear;
	   		int month = nowMonth;
	   		
	   		//넘오온값이 널갑이 아니면 해당되는 fyear값은 year의 값인 것이다.
	   		if(fyear != null){
	   			year = Integer.parseInt(fyear);
	   		}
	   		//넘어온 값이 널값이 아니면 해당되는 fmonth값은  month의 값인 것이다.
	   		if(fmonth != null){
	   			month = Integer.parseInt(fmonth);
	   		}
	   		
	   		//넘어온값을 새롭게 cal 객체생성한 곳에 입력이 된다 (년,월,일)초기화 
	   		cal.set(year, month-1, 1);
	   		
	   		//입력되어진 년과 달을 값을 다시 year, month 로 선언해주었다.
	   		year = cal.get(Calendar.YEAR);
	   		month = cal.get(Calendar.MONTH)+1;
	   		
	   		//cal.getActualMaximum은 그달의 마지막일을 출력한것이다.
	   		int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	   		//현재, 즉 오늘날짜를 말한것이다/
	   		int week = cal.get(Calendar.DAY_OF_WEEK);
	   	%>
		<a href = "petdiary2.jsp?year=<%=year %>&month=<%=month -1 %>">before</a>&nbsp;
		<b><%=year %>년&nbsp;&nbsp;<%=month %>월</b>
		<a href = "petdiary2.jsp?year=<%=year %>&month=<%=month + 1 %>">&nbsp; next</a>
	
		<table border = "1">
		<tr>
			<td class="sun">일</td>
			<td>월</td>
			<td>화</td>
			<td>수</td>
			<td>목</td>
			<td>금</td>
			<td class="sat">토</td>
		</tr>
		
		<tr>
		<!-- 그달의 1일 까지 공백처리하기 위한 것임. -->
		<%
			for(int i = 1; i < week; i++){
		%>		
		<td height = "20">&nbsp;</td>
		<%
		}
		%>
		<!-- 	끝나는 날까지 for 문을 통해서 숫자를 출력한 것이다. week는 1일 제외하고 계산됨 -->
		<%
			for(int j = 1; j<=endDay; j ++){
				week++;
				if(week % 7 ==2){
		 %>
		</tr>
			<tr>
			<% } %>
				<% 
				String title = pList.get(j).getDiaryTitle();
				if(week % 7 == 2 ){ 
				%>
					<td class="sun">
						<a href="/petdiary/detail?month=<%=month%>&date=<%=j%>"><%=j%></a>
						<div>
							<% if(title != null) { %>
								<%= title %>
							<% } %>
						</div>
					</td>
				<%
				} else if(week%7 == 1){
				%>
					<td class="sat">
						<a href="/petdiary/detail?month=<%=month%>&date=<%=j%>"><%=j %></a>
						<div><% if(title != null) {%> <%= title %> <% } %></div>
					</td>
				<%
				}else {
				%>
					<td>
						<a href="/petdiary/detail?month=<%=month%>&date=<%=j%>"><%=j %></a>
						<div><% if(title != null) {%> <%= title %> <% } %></div>
					</td>
				<% }
			}%>
			</tr>
		</table>
			<!-- 메인 끝 ---------------------------------------------------------------------------------------------------------->
            <footer>
                <!-- 푸터 -->
                <div id="footer">
                    <div id="footer-right-box">
                        <img src="/assets/img/main_logo.png" alt="하단로고">
                    </div>
                    <div id="footer-left-box"> 
                        <ul>
                            <li>퍼피런 소개</li>
                            <li>사이트맵</li>
                            <li>이용약관</li>
                            <li>개인정보처리방침</li>
                            <li>운영방침</li>
                        </ul>
                        <p id="footer-ptag">
                            서울특별시 송파구 올림픽로 300 대표자 : 오재승 전화 : 1661-2000<br>
                            전자우편주소 : puppyrun@naver.com<br>
                            사업자등록번호 : 230-85-024691 통신판매업신고번호 : 송파 제12038호<br>
                            Copyright 2021 PUPPYRUN. All Rights Reserved.
                        </p>
                    </div>
                </div>
            </footer>
        </div>
    </body>
</html>