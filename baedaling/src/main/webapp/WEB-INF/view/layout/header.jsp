<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://unpkg.com/@kfonts/bm-hanna-pro/index.css" />
<link rel="stylesheet" href="<%=cp%>/delivery/css/mainstyle.css" type="text/css">
<div id="menu-wrapper" >
      <div id="menu" class="container">
         <a href="<%=cp%>/main"><img align="left" src="<%=cp%>/resource/img/logo.png" id="logo-img"></a>
         	<ul>
            	<li><a href="#">공지사항</a></li>
               	<li><a href="#">자유게시판</a></li>
               	<li><a href="#">포토갤러리</a></li>
				<li><a href="#">이벤트</a></li>
				<li><a href="#">고객센터</a></li>
			</ul>
      </div>
   </div>
   <div id="logo" class="container">
      <h1 style="font-family: '배달의민족 한나체 Pro', '배달의민족한나체Pro', 'bm-hanna-pro'; font-size: 35px;"><a href="#"> &nbsp;&nbsp;어&nbsp;디&nbsp;로&nbsp;<span style="color:#276CA2; ">&nbsp;배&nbsp;달&nbsp;</span>해&nbsp;드&nbsp;릴&nbsp;까&nbsp;요&nbsp;?&nbsp; &nbsp; "</a></h1>
   </div>
   
   <div id="page" class="container">
      <div>
         <div class="entry" style="margin: 0px;" align="center">
            <ul>
               <li>
                  <input id="inputline" type="search" placeholder="주소입력창">
                  <button type="button" onclick="/">검색</button>
               </li>
            </ul>
         </div>
      </div>
   </div>
	
