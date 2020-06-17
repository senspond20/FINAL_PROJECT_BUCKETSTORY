<%@page import="org.springframework.http.server.reactive.ContextPathCompositeHandler"%>
<%@page import="com.kh.BucketStory.member.model.vo.MemberMyBucketList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	int index = (int) request.getAttribute("index");
	ArrayList<MemberMyBucketList> mbl = (ArrayList<MemberMyBucketList>) request.getAttribute("myBucketList");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="resources/member/css/bucketBlog.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<style>
		#draggable { width: 150px; height: 150px; padding: 0.5em; }
	</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>				
	</header>
	<jsp:include page="/WEB-INF/views/layout/mainRightSide.jsp"/>
	<div id="extra"></div>
	<div id="body-wrap">
		<div id="Myheader">
			<table id="table_area">
				<tr>
					<td rowspan="4" style="width: 250px;">
						<img id="profileImg" src="/BucketStory/resources/member/images/profiles/${ getMember.prImage }" />
					</td>
				</tr>
				<tr>
					<td colspan="3" style="font-size: 30px;">${ getMember.nickName }</td>
				</tr>
				<tr>
					<td colspan="3" style="font-size: 20px;">${ getMember.userName }</td>
				</tr>
				<tr>
					<td>게시물 ${ list }</td>
					<td>팔로워 ${ getMember.fwCount }</td>
					<td>팔로우 30</td>
				</tr>
			</table>
		</div>
		<jsp:include page="/WEB-INF/views/layout/MyPageNav.jsp"/>
		<section>
			<h2>블로그</h2>
			<div class="bucketList-area"><br>
				<div id="list_header">
					<span>버킷리스트 ${ pi.listCount }개의 글</span>
					<button id="listBtn" onclick="listSH()">목록열기</button>
				</div>
				<br>
				<table>
					<thead>
						<tr>
							<th>
								<div class="wrap_td">
									<span>글 제목</span>
									<i class="cline"></i>
								</div>
							</th>
							<th>
								<div class="wrap_td">
									<span>작성일</span>
									<i class="cline"></i>
								</div>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${ empty myBucketList }">
						</c:if>
						<c:if test="${ !empty myBucketList }">
							<c:forEach items="${ myBucketList }" var="mbl" >
								<tr>
									<td>
										<input type="hidden" class="hidden_BKNO" value="${ mbl.bkNo }"/>
										<div class="wrap_td">
											<span class="bkName">${ mbl.bucket.bkName }</span>
										</div>
									</td>
									<td>
										<div class="wrap_td">
											<span class="date">${ mbl.bucket.enrolldate }</span>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
				<div class="pagingBtn-area">
					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="myBlog.me">
							<c:param name="nickName" value="${ getMember.nickName }"></c:param>
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }">[이전]</a> &nbsp;
					</c:if>
					
					<!-- 페이지 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<b>${ p }</b> &nbsp;
						</c:if>
						
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="myBlog.me">
								<c:param name="nickName" value="${ getMember.nickName }"></c:param>
								<c:param name="page" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						 [다음]
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="myBlog.me">
							<c:param name="nickName" value="${ getMember.nickName }"></c:param>
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">[다음]</a> &nbsp;
					</c:if>
				</div>
			</div>
			
			<!-- 블로그 리모컨 -->
			<div id="mydiv" style="top: 428px; left: 1400px;">
				<!-- Include a header DIV with the same name as the draggable DIV, followed by "header" -->
				<div id="mydivheader">Bucket Blog</div>
				<table>
					<tr>
						<td colspan="4">
							<br>
							<img id="prev2Btn" src="resources/member/images/prev2.png" alt="" style="width:30px; height: 30px;" onclick="prev2Btn();"/>
							<img id="prevBtn" src="resources/member/images/prev.png" alt="" style="width:30px; height: 30px;" onclick="prevBtn();"/>
							<img id="nextBtn" src="resources/member/images/next.png" alt="" style="width:30px; height: 30px;" onclick="nextBtn();"/>
							<img id="next2Btn" src="resources/member/images/next2.png" alt="" style="width:30px; height: 30px;" onclick="next2Btn();"/>			
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<br>
							<c:if test="${ !empty bList }">
								<input id="goElement" type="text" value="1" style="width: 30px; height: 20px; border: 1px solid gray;"/>&nbsp;/&nbsp;${ bList.size() }&nbsp;<a onclick="goBucket()">이동</a>
							</c:if>
							<c:if test="${ empty bList }">
								<input type="text" value="0" style="width: 30px; height: 20px; border: 1px solid gray;" readonly="readonly"/>&nbsp;/&nbsp;${ bList.size() }&nbsp;<a>이동</a>
							</c:if>
						</td>
					</tr>
					<tr>
						<td>
							<br>
							<img src="resources/member/images/top.png" alt="" style="width:20px; height: 20px;"/>
						</td>
						<td>
							<br>
							<img src="resources/member/images/bottom.png" alt="" style="width:20px; height: 20px;"/>						
						</td>
						<td>
							<br>
							<img src="resources/member/images/list.png" alt="" style="width:20px; height: 20px;"/>						
						</td>
					</tr>
					<tr>
						<td>
							<a href="#extra">맨위로</a>
						</td>
						<td>
							<a href="#bottom_scroll">아래로</a>
						</td>
						<td>
							<a href="myBucket.me?nickName=${ nickName }">&nbsp;목록&nbsp;</a>
						</td>
					</tr>
				</table>
				<c:if test="${ !empty bList }">
					<script>
						function prev2Btn() {
							var last = "${ bList.size() }"
							var go = $('#goElement').val();
							$('.blogBucket').eq(0).children('input').next().focus();
							$('#goElement').val(1);
						}
						
						function prevBtn() {
							var last = "${ bList.size() }"
							var go = $('#goElement').val();
							if(go > 1) {
								console.log(go)
								go--;
								console.log(go)
								$('.blogBucket').eq(parseInt(go)-1).children('input').next().focus();
								$('#goElement').val(go);																													
							} else {
								console.log(go)
								prev2Btn();
							}
						}
						
						function nextBtn() {
							var last = "${ bList.size() }"
							var go = $('#goElement').val();
							if(last > go) {
								console.log(go)
								go++;
								console.log(go)
								$('.blogBucket').eq(parseInt(go)-1).children('input').next().focus();
								$('#goElement').val(go);																													
							} else {
								console.log(go)
								next2Btn();
							}
						}

						function next2Btn() {
							var last = "${ bList.size() }"
							var go = $('#goElement').val();
							$('.blogBucket').eq(parseInt(last)-1).children('input').next().focus();
							$('#goElement').val(last)
						}
						
						function goBucket() {
							var go = $('#goElement').val();
							$('.blogBucket').eq(parseInt(go)-1).children('input').next().focus();
						}
					</script>
				</c:if>			
			</div>
			
			<div id="div-area">
				<c:if test="${ empty myBucketList }">
				</c:if>
				<c:if test="${ !empty myBucketList }">
					<div id="bucketTitle">
						<h3>
							<%= mbl.get(index).getBucket().getBkName() %>
						</h3>
					</div>
					<br>
					<div id="bucketImg">
						<img style="max-width: 600px; max-height: 337.5;" src="/BucketStory/resources/muploadFiles/<%= mbl.get(index).getMedia().getMweb() %>" alt="" />
					</div>
					<br>
					<div id="bucketContent">
						<textarea readonly="readonly">
							<%= mbl.get(index).getBucket().getBkContent() %>
						</textarea>
						<script>
							var bucketContent = $('#bucketContent').children()
							var content = $('#bucketContent').children().val()
							bucketContent.text(content.trim());
						</script>
					</div>
					<div id="bucketTag"></div>
					<script>
						var tag = '<%= mbl.get(index).getBucket().getTag() %>'
						var tags = tag.split(',');
						for(var i = 0; i < tags.length; i++) {
							if(tags[i] == "") {
							} else {
								$tagBtn = $('<button class="tagBtn">').text("#" + tags[i])
								$('#bucketTag').append($tagBtn)
							}
						}
					</script>
					<input type="hidden" value="<%= mbl.get(index).getBucket().getBkNo() %>" />
					<c:if test="${ flag eq 'true' }">
						<button id="blogWriteBtn">작성하기</button>
					</c:if>
				</c:if>
			</div>		
			<c:if test="${ !empty bList }">
				<c:forEach items="${ bList }" var="bl" varStatus="status">
					<div class="blogBucket">
						<input type="hidden" value="${ bl.bNo }" />
						<input type="text" readonly="readonly" value="${ status.index }" style="width:0px; height:0px; font-size: 0px; border: none;">
						<h3>${ bl.bTitle }</h3>
						<div class="profile-area">
							<img src="/BucketStory/resources/member/images/profiles/${ getMember.prImage }" style="width: 23px; height: 23px; border-radius: 100px;" />
							<span>${ getMember.nickName }</span>
							<span>${ bl.enrollDate }</span>
							<span>팔로우</span>
						</div>
						<div>
							${ bl.bContent }
						</div>
						<div class="reply">
							<div class="reply_profile_area">
								<img src="/BucketStory/resources/member/images/profiles/${ loginUser.prImage }" style="width: 23px; height: 23px; border-radius: 100px;" />
								<span>${ loginUser.nickName }</span>
							</div>
							<div class="reply_content">
								<textarea name="cmcontent" class="cmcontent" cols="10" rows="5" style="width: 100%;"></textarea>
							</div>
							<div>
								
							</div>
						</div>
					</div>	
				</c:forEach>
			</c:if>
			<c:if test="${ empty bList }">
				<div class="blogBucket">
					<h4>등록된 글이 없습니다.</h4>
					<h4>멋진 내용을 등록해보세요.</h4>
				</div>
			</c:if>
			<div id="bottom_scroll">
				<br>
				<table>
					<thead>
						<tr>
							<th>
								<div class="wrap_td">
									<span>글 제목</span>
									<i class="cline"></i>
								</div>
							</th>
							<th>
								<div class="wrap_td">
									<span>작성일</span>
									<i class="cline"></i>
								</div>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${ empty myBucketList }">
						</c:if>
						<c:if test="${ !empty myBucketList }">
							<c:forEach items="${ myBucketList }" var="mbl" >
								<tr>
									<td>
										<input type="hidden" class="hidden_BKNO" value="${ mbl.bkNo }"/>
										<div class="wrap_td">
											<span class="bkName2">${ mbl.bucket.bkName }</span>
										</div>
									</td>
									<td>
										<div class="wrap_td">
											<span class="date2">${ mbl.bucket.enrolldate }</span>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
				<div class="pagingBtn-area2">
					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="myBlog.me">
							<c:param name="nickName" value="${ getMember.nickName }"></c:param>
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }">[이전]</a> &nbsp;
					</c:if>
					
					<!-- 페이지 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<b>${ p }</b> &nbsp;
						</c:if>
						
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="myBlog.me">
								<c:param name="nickName" value="${ getMember.nickName }"></c:param>
								<c:param name="page" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						 [다음]
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="myBlog.me">
							<c:param name="nickName" value="${ getMember.nickName }"></c:param>
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">[다음]</a> &nbsp;
					</c:if>
				</div>
			</div>
		</section>
	</div>
<script>

	$(function(){
		var length = ${ myBucketList.size() };
		var bkNo = $('#bucketTag').next().next().val();
		for (var i = 0; i < length; i++) {
			if($.trim($('.hidden_BKNO').eq(i).val()) == bkNo) {
				$('.bkName').eq(i).css({'font-weight':'900', 'border-bottom':'1px solid black'})
				$('.bkName2').eq(i).css({'font-weight':'900', 'border-bottom':'1px solid black'})
			}
		}
		var list_table = $('.bucketList-area>table').hide()
		var list_page = $('.pagingBtn-area').hide();
		
		var bNo = '${ bNo }'
		if(bNo != "") {
			var length = $('.blogBucket').children('input[type=hidden]').length
			for(var i = 0; i < length; i++) {
				if($('.blogBucket').children('input[type=hidden]').eq(i).val() == bNo){
					console.log(i);
					$('.blogBucket').children('input[type=hidden]').eq(i).next().focus();
				}
			}
		}
	})
	
	/* 글자수 스크립트 */
	$('.reply_TEXT').keyup(function (e){
       var content = $(this).val();
       $('#counter').html(content.length+"/200");//글자수 실시간 카운팅

       if (content.length > 300){
           alert("최대 200자까지 입력 가능합니다.");
           $(this).val(content.substring(0, 200));
           $('#counter').html("200/200");
       }
   });
	
	function listSH() {
		if($('#listBtn').text() == '목록열기'){
			var list_table = $('.bucketList-area>table').show()
			var list_page = $('.pagingBtn-area').show();	
			$('#listBtn').text("목록닫기")
		} else if($('#listBtn').text() == '목록닫기') {
			var list_table = $('.bucketList-area>table').hide()
			var list_page = $('.pagingBtn-area').hide();	
			$('#listBtn').text("목록열기")			
		}
	}
	
	$('span.bkName').on('click', function(){
		var bkNo = $(this).parent().prev().val();
		var page = ${ pi.currentPage }
		location.href="myBlog.me?nickName=${ nickName }&bkNo=" + bkNo + "&page=" + page;
	})
	
	$('span.bkName2').on('click', function(){
		var bkNo = $(this).parent().prev().val();
		var page = ${ pi.currentPage }
		location.href="myBlog.me?nickName=${ nickName }&bkNo=" + bkNo + "&page=" + page;
	})
	
	$('#blogWriteBtn').on('click', function(){
		var page = ${ pi.currentPage }
		var bkNo = $(this).prev().val();
		location.href="blogWrite.me?nickName=${ nickName }&bkNo=" + bkNo + "&page=" + page;
	})
	
	$(function(){
		$('#img_area').on('click',function(){
			$('#imgInput').click();
		})
		$('#imgInput').css('display','none');
		$('#img_area>img').attr('src', "resources/main/images/loginback.jpg");
		$('#img_area>img').css('width', '100%');
	});
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$('#img_area>img').css('width', 'auto');
				$('#img_area>img').attr('src', e.target.result);  
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	$("#imgInput").change(function(){
		readURL(this);
	});
	
	$('#overlay').css('top','-2px');
	$('#sidewrap').css('top','60.3px');
	$('nav>a:eq(0)').css('border-top','3px solid rgba(var(--b38,219,219,219),1)');
	
	////////////////////////
	// Make the DIV element draggable:
	dragElement(document.getElementById("mydiv"));
	
	function dragElement(elmnt) {
		var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
		if (document.getElementById(elmnt.id + "header")) {
		  // if present, the header is where you move the DIV from:
		  document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
		} else {
		  // otherwise, move the DIV from anywhere inside the DIV:
		  elmnt.onmousedown = dragMouseDown;
		}
	
		function dragMouseDown(e) {
			e = e || window.event;
			e.preventDefault();
			// get the mouse cursor position at startup:
			pos3 = e.clientX;
			pos4 = e.clientY;
			document.onmouseup = closeDragElement;
			// call a function whenever the cursor moves:
			document.onmousemove = elementDrag;
		}
	
		function elementDrag(e) {
			e = e || window.event;
			e.preventDefault();
			// calculate the new cursor position:
			pos1 = pos3 - e.clientX;
			pos2 = pos4 - e.clientY;
			pos3 = e.clientX;
			pos4 = e.clientY;
			// set the element's new position:
			elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
			elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
		}
	
		function closeDragElement() {
			// stop moving when mouse button is released:
			document.onmouseup = null;
			document.onmousemove = null;
		}
	}
</script>
</body>
</html>