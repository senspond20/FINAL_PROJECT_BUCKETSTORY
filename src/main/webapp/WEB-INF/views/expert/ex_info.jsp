<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
      <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" href="resources/expert/css/ex_info.css">
<title>ex_info</title>
</head>
<body>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<c:import url="/WEB-INF/views/layout/mainNav.jsp"/>
<c:import url="/WEB-INF/views/layout/mainLeftSide.jsp"/>
<div id="page">
	<div id="page-1">
		<div id="inputPhoto">
			<img src="resources/expert/images/배경-1.jpg" id="mainPhoto" name="mainPoto">
		</div>
		
		<div id="sum-upPage">
			
			<hr>
			
			<table id="helperProfile" style="border:1px solid black; width:600px;height:200px;">
				<tr>
					<td rowspan="2" style="width: 150px;"><img src="resources/expert/images/photo.jpg" id="profileImage" ></td>
					<td><h1>${ company.coId }</h1></td>
					<td><div class="likebtn"><button>♥좋아요</button></div></td>
				</tr>
				<tr>
					<td colspan="2">
						<div>
							<c:if test="${ company.coIntro != null }">
								<% pageContext.setAttribute("newLineChar", "\r\n"); %>
								${ fn:replace(company.coIntro, newLineChar, "<br>") }
							</c:if>
							<c:if test="${ company.coIntro eq null }">
								업체 간단 소개가 없습니다.
							</c:if>
						</div>
					</td>
				</tr>
			</table>
			
			<hr>
			
			<h2>업체정보</h2>
				<c:if test="${ company.coInfo != null }">
					<% pageContext.setAttribute("newLineChar", "\r\n"); %>
					${ fn:replace(company.coInfo, newLineChar, "<br>") }
				</c:if>
				<c:if test="${ company.coInfo eq null }">
					업체 정보가 없습니다.
				</c:if>
			<hr>
			
			<div>
				<h2>리뷰(개수)</h2>
				<div id="reviewavgview">
					<h4>리뷰 평점</h4>
					<h4>★★★★★</h4>
					<h4>(5.0)</h4>
				</div>
				
				<div id="reviewbox">
					<table style="border:1px solid balck">
						<tr>
							<td style="width:86px; height:77px">
								<img src="resources/expert/images/photo.jpg" id="reviewprofile">
								<h5>닉네임</h5>
							</td>
							<td rowspan="2">
								날카로우나 갑 속에 든 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고
								날카로우나 갑 속에 든 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고
								날카로우나 갑 속에 든 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td>
							</td>
							<td>
								2020-02-02
							</td>
						</tr>
					</table>
					<hr>
					<hr>
				</div>
			</div>
		</div>
	</div>
	<div id="page-2" style="top:80.6px;">
		<div style="overflow:auto; width:320px; height:530px;">
			<table id="choiceBucket" style="padding-inline-start: 0px;width: 100%;">
				<tr><th colspan="3" style="height: 70px;">함께하는 버킷리스트</th></tr>
				
				<c:if test="${ bucket eq null }">
					<tr><td colspan="2">함께하는 버킷리스트가 없습니다.</td><tr>
				</c:if>
				<c:if test="${ bucket !=null }">
					<c:forEach var="bucket" items="${ bucket }">
						<tr onclick="modal(${bucket.bkNo});">
							<c:forEach var="m" items="${ media }">
								<c:if test="${bucket.bkNo == m.bkno }">
									<td><img style='width: 90px;'id='bucketListImage' src='resources/muploadFiles/${ m.mweb }'></td>
								</c:if>
							</c:forEach>
							<td>${ bucket.bkName }</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
		<c:url var="getRequest" value="getRequest.ex">
			<c:param name="coId" value="${ company.coId }"/>
		</c:url>
		<c:url var="ex_infoUpdate" value="ex_infoUpdateForm.ex">
			<c:param name="coId" value="${ company.coId }"/>
		</c:url>
		<div id="subBtn">
			<button class="btn" onclick="location.href='${ getRequest }'">받은 견적확인</button>
			<button class="btn" onclick="location.href='${ ex_infoUpdate }'">정보수정</button>
		</div>
	</div>
	<script>
	var currentPosition = parseInt($("#page-2").css("top")); $(window).scroll(function() { var position = $(window).scrollTop(); $("#page-2").stop().animate({"top":position+currentPosition+"px"},1000); });

	</script>
</div>
</body>
</html>