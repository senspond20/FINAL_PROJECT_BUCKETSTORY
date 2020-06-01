<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/expert/css/ex_getRequest.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:import url="../common/header.jsp"/>
<c:import url="../common/mainNav.jsp"/>
<c:import url="../common/mainLeftSide.jsp"/>
	<div id="page">
		<div id="submenu">
			<ul>
				<li><h3 style="display: inline;">받은요청 &nbsp</h3></li>
				<li>진행중 &nbsp</li>
				<li>완료요청</li>
			</ul>
		</div>
		
		<br clear="left">
		<h2 style="text-align:center;margin-bottom: 73px;margin-top: 76px;">견적서를 기다리는 버킷리스트</h2>		
		
		<div id="requestMember">
			<table style="width: 780px;">
				<tr>
					<td rowspan="3" style="width:100px;">
						<img id="requestImage" src="<%=request.getContextPath() %>/views/프로필.png" id="profileImage">
					</td>
					<td>
						<h3 style="display:inline">요청보낸사람 닉네임</h3>
					</td>
					<td>
						2020-05-06
					</td>
				</tr>
				<tr>
					<td>
						요청보낸사람의 버킷리스트 카테고리
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>
						<div id="bucketListDetail">버킷리스트 요청보기</div>
					</td>
				</tr>
			</table>
		</div>
		<hr style="width:840px">
		<div id="requestMember">
			<table style="width: 780px;">
				<tr>
					<td rowspan="3" style="width:100px;">
						<img id="requestImage" src="<%=request.getContextPath() %>/views/프로필.png" id="profileImage">
					</td>
					<td>
						<h3 style="display:inline">요청보낸사람 닉네임</h3>
					</td>
					<td>
						2020-05-06
					</td>
				</tr>
				<tr>
					<td>
						요청보낸사람의 버킷리스트 카테고리
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>
						<div id="bucketListDetail">버킷리스트 요청보기</div>
					</td>
				</tr>
			</table>
		</div>
		<hr style="width:840px;">
		
		<div id="ListAdd">
			<div id="ListArea">
				<h4 style="display:inline">더보기</h4>
				&nbsp;&nbsp;&nbsp;▼
			</div>
		</div>
	</div>
</body>
</html>