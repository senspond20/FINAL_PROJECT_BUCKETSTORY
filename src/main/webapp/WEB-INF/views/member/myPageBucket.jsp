<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.BucketStory.bucket.model.vo.BucketList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/member/css/myPageBucket.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<style type="text/css">
		.link_item.top_item._btnFloating:hover {
			text-decoration: none;
		}
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
					<td id="profile_td" rowspan="4" style="width: 250px;">
						<c:if test="${ loginUser != null && getMember.userId eq loginUser.userId }">
							<i class="fa fa-cog" aria-hidden="true" style="display: none;"></i>
						<script type="text/javascript">
							$('#profile_td').mouseenter(function(){
								$('i.fa.fa-cog').css('display','block');
								$(this).find('img').css('cursor','pointer').css('border','2px solid')
								$(this).on('click',function(){
								    var url = "profileChangeGo.me";
						            var name = "profile change popup";
						            var option = "width = 400, height = 500, top = 100, left = 200, location = no"
						            window.open(url, name, option);
								})
							})
							
							$('#profile_td').mouseleave(function(){
								$('i.fa.fa-cog').css('display','none');
								$(this).find('img').css('cursor','pointer').css('border','none')
							})
						</script>
						</c:if>
						<c:if test="${ getMember.prImage == null }">
							<img id="profileImg" src="/BucketStory/resources/member/images/profiles/basicProfile.jpg" />					
						</c:if>
						<c:if test="${ getMember.prImage != null }">
							<img id="profileImg" src="/BucketStory/resources/member/images/profiles/${ getMember.prImage }" />					
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: 30px;">${ getMember.nickName }</td>
					<td>
						<c:if test="${ loginUser != null && getMember.userId ne loginUser.userId}">
							<c:if test="${ followCheck == 1 }">
								<button type="button" id="unFollowBtn" onclick="unfollow(this);">팔로우 취소</button>
							</c:if>
							<c:if test="${ followCheck == 0 }">
								<button type="button" id="followBtn" onclick="follow(this);">팔로우</button>
							</c:if>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="font-size: 20px;">${ getMember.userName }</td>
				</tr>
				<tr>
					<td>게시물 ${ list }</td>
					<td id="follower-td" style="cursor: pointer;" >팔로워 <span id="follower">${ followerList.size() }</span></td>
					<td id="following-td" style="cursor: pointer;">팔로잉 ${ followingList.size() }</td>
				</tr>
			</table>
		</div>
		
		<div id="follower-area">
			<c:forEach items="${ followerList }" var="fwl" varStatus="status">
				<div>
					<c:if test="${ empty fwl.member.prImage }">
						<img style="width: 24px; height: 24px;" src="resources/member/images/profiles/basicProfile.jpg" alt="" />
					</c:if>
					<c:if test="${ !empty fwl.member.prImage }">
						<img style="width: 24px; height: 24px;" src="resources/member/images/profiles/${ fwl.member.prImage }" alt="" />
					</c:if>
					<span onclick="location.href='myBucket.me?nickName=${ fwl.member.nickName }'">${ fwl.member.nickName }</span>
				</div>
				<br>
			</c:forEach>
		</div>
		<div id="following-area">
			<c:forEach items="${ followingList }" var="fwl" varStatus="status">
				<div>
					<c:if test="${ empty fwl.member.prImage }">
						<img style="width: 24px; height: 24px;" src="resources/member/images/profiles/basicProfile.jpg" alt="" />
					</c:if>
					<c:if test="${ !empty fwl.member.prImage }">
						<img style="width: 24px; height: 24px;" src="resources/member/images/profiles/${ fwl.member.prImage }" alt="" />
					</c:if>
					<span onclick="location.href='myBucket.me?nickName=${ fwl.member.nickName }'">${ fwl.member.nickName }</span>
				</div>
				<br>
			</c:forEach>
		</div>
		<jsp:include page="/WEB-INF/views/layout/MyPageNav.jsp"/>
		<c:if test="${ !empty getBLikeList }">
			<div id="BLikeList-area">
				<ul>
					<li id="BlikeList-header">게시글 좋아요 리스트</li>
					<c:forEach items="${ getBLikeList }" var="gbl" varStatus="status">
						<li>
							<span>${ status.index + 1 }</span>
							<c:if test="${ empty gbl.b_member.prImage }">
								<img style="width: 24px; height: 24px;" src="resources/member/images/profiles/basicProfile.jpg" alt="" />
							</c:if>
							<c:if test="${ !empty gbl.b_member.prImage }">
								<img style="width: 24px; height: 24px;" src="resources/member/images/profiles/${ gbl.b_member.prImage }" alt="" />
							</c:if>
							<span>${ gbl.b_member.nickName }</span>
							<span id="BLikeCon" onclick="location.href='myBlog.me?nickName=${ gbl.b_member.nickName }&bkNo=${ gbl.board.bkNo }&bNo=${ gbl.bNo }'">${ gbl.board.bTitle }</span>
							<span>${ gbl.board.enrollDate }</span>	
						</li>
					</c:forEach>		
				</ul>			
			</div>
		</c:if>
		<section>
			<c:if test="${ empty myBucketList }">
				<div style="text-align: center; margin: 200px;">등록된 버킷리스트가 없습니다.</div>
			</c:if>
			<c:if test="${ !empty myBucketList }">
				<c:forEach var="b" items="${ myBucketList }" varStatus="status">
					<div class="bucket ${ b.bkNo }" id="bucket${ b.bkNo }" onclick="bkDetail(${b.bkNo}, '${b.cateName}', '${b.bucket.bkName}', '${b.bucket.bkContent}', '${b.bucket.tag}', '${b.member.nickName}');">
					<script>
 						$('.bucket').eq(${ status.index }).css('background-image', 'url(resources/muploadFiles/${ b.media.mweb })');
					</script>
					<c:set var="Sloop_flag" value="false"/>
					<c:forEach var="s" items="${ shareList }">
						<c:if test="${s.bkNo == b.bkNo}">
							<c:set var="Sloop_flag" value="true"/>
						</c:if>
					</c:forEach>
						<div class="bucketContent">
							<div class="c-category">
								<c:choose>
									<c:when test="${ b.cateName == 'Travel' }"><span style="color:#00c5bc;">Travel</span><c:set var="cateName" value="Travel"/></c:when>
									<c:when test="${ b.cateName == 'Sport' }"><span style="color:#fd8ab1;">Sport</span><c:set var="cateName" value="Sport"/></c:when>
									<c:when test="${ b.cateName == 'Food' }"><span style="color:#fd8b42;">Food</span><c:set var="cateName" value="Food"/></c:when>
									<c:when test="${ b.cateName == 'New Skill' }"><span style="color:#c78646;">New Skill</span><c:set var="cateName" value="New Skill"/></c:when>
									<c:when test="${ b.cateName == 'Culture' }"><span style="color:#9f7ed7;">Culture</span><c:set var="cateName" value="Culture"/></c:when>
									<c:when test="${ b.cateName == 'Outdoor' }"><span style="color:#6fc073;">Outdoor</span><c:set var="cateName" value="Outdoor"/></c:when>
									<c:when test="${ b.cateName == 'Shopping' }"><span style="color:#efc648;">Shopping</span><c:set var="cateName" value="Shopping"/></c:when>
									<c:when test="${ b.cateName == 'Lifestyle' }"><span style="color:#87adf8;">Lifestyle</span><c:set var="cateName" value="Lifestyle"/></c:when>
								</c:choose>
							</div>
							<div class="c-bucket">
								<div class="c-bucket-1">${ b.bucket.bkName }</div>
							</div>
							<c:if test="${ not empty loginUser}">
							<c:if test="${ not Sloop_flag }">
								<div class="c-Add ${ b.bkNo }" id="c-Add${ b.bkNo }">
									<div class="c-addBtn" onclick="sharebl(${ b.bkNo }, '${ b.bucket.userId }');"> + ADD</div>
								</div>
							</c:if>	
							<div class="c-likewish ${ b.bkNo }" id="c-likewish${ b.bkNo }">
								<div class="c-likeBtn ${ b.bkNo }" id="c-likeBtn${ b.bkNo }" onclick="blLikeUp(${ b.bkNo });"><span class="likehover" style="font-size:20px">♡ </span><label class="likelabel">${ b.bucket.bkLike }</label></div>
								<div class="c-wishBtn ${ b.bkNo }" id="c-wishBtn${ b.bkNo }" onclick="wishRegist(${ b.bkNo }, '${ b.member.nickName }');">
									<span class="wishhover" style="font-size:20px">☆ </span>
									위시 
									<c:set var="loop_flag" value="false"/>
									<c:forEach var="w" items="${ wishList }">
										<c:if test="${w.bkNo == b.bkNo && w.bucketId == b.member.nickName}">
											<c:set var="loop_flag" value="true"/>
										</c:if>
									</c:forEach>
									<c:if test="${loop_flag}"><label class="wishlabel">취소</label></c:if>
									<c:if test="${not loop_flag}"><label class="wishlabel">등록</label></c:if>
								</div>
							</div>
							</c:if>
						</div>
					</div>	
					<script>
						//좋아요위시버튼 나오게하기
						$('.bucket.${ b.bkNo }').hover(function(){
							$('.c-likewish.${ b.bkNo }').show();
						}, function(){
							$('.c-likewish.${ b.bkNo }').hide();
						});
						if('${loginUser}' != ""){
							if('${loginUser.userId}' == '${b.bucket.userId}') {
								$('.c-Add.${b.bkNo}').hide();
							}
						}
					</script>		
				</c:forEach>
			</c:if>
			<c:if test="${ flag eq 'true' }">
				<div id="bucketAddBtn">
					<a href="#" class="link_item top_item _btnFloating" data-type="top" style="">
						<span class="icon icon_top"></span><span class="text blind" style=" font-size: 39px; color: black;">+</span>
					</a>
				</div>
			</c:if>
			<c:if test="${ flag eq 'false' }">
			</c:if>
		</section>

		<div id="FullOverLay">
			<div id="bucketDatail">
				<div id="bucketexit">X</div>
				<div id="bucketGoBlog">블로그 가기</div>
				<div id="bucketimg">
					<ul>
					</ul>
					<div id="bucketcate">FOOD</div>
					<div id="buckettitle">리틀 포레스트에 나오는 음식 따라 만들기</div>
					<div id="bucketleft">〈</div>
					<div id="bucketright">〉</div>
					
					<!-- 회원만 해당(시작) -->
					<c:if test="${ not empty loginUser}">
					<div id="bucketAdd"> + ADD                       </div>
					<div id="bucketlike">♡ </div>
					<div id="bucketwish">☆ </div>
					</c:if>
					<!-- 회원만 해당(끝) -->
					<c:if test="${ not empty loginCompany }">
					<div id="bucketComAdd"> + ADD </div>
					</c:if>
					
				</div>
				<div id="bucketcp">
					<div id="bucketTag">
						<div id="bucketTag1"><span>#</span><label>화이트데이</label></div>
						<div id="bucketTag1"><span>#</span><label>화이트데이</label></div>
						<div id="bucketTag1"><span>#</span><label>화이트데이</label></div>
						<div id="bucketTag1"><span>#</span><label>화이트데이</label></div>
						<div id="bucketTag1"><span>#</span><label>화이트데이</label></div>
					</div>
					<div id="bucketexplain">한옥에서 즐기는 타이푸드 식당 동남아. 요즘 핫한 동네 익선동에 들어서면 '동남아' 세 글자가 쓰여진 정직한 간판이 반겨준다. 내부에는 깨진 장독대와 푸른 식물이 한옥과 어우러져 이색 풍경이 펼쳐진다. 태국 유명 쿠킹클래스인 바이파이 출신 셰프가 직접 선보이는 팟타이부터 똠양꿍, 태국식 만두 퉁텅까지 로컬의 맛을 그대로 살렸다. 창밖 아래 풍경을 보면서 식사할 수 있는 2층 좌석을 추천. 종로 3가역에서 걸어서 5분 거리로 위치도 좋다. 팟타이 10,000원, 똠양꿍 12,000원 영업시간은 12:00-22:00	</div>
					<div id="bucketcompany">
						<ul>
							<li>삼성 여행사<button>견적서 작성</button></li>
							<li>LG 식품<button>견적서 작성</button></li>
							<li>아시아나항공 숙박<button>견적서 작성</button></li>
							<li>오리온 과자<button>견적서 작성</button></li>
							<li>오리온 과자<button>견적서 작성</button></li>
							<li>오리온 과자<button>견적서 작성</button></li>
							<li>오리온 과자<button>견적서 작성</button></li>
						</ul>
					</div>
					<div id="bucketcpeventD">
						<button>행사 펼치기</button>
					</div>
				</div>
				<div id="bucketwith">
					<div id="bucketwithCount"><span>14</span>명이 이 버킷 리스트를 함께 합니다.</div>
					<div id="bucketwithPro">
						<div id="profile-div">
							<div id="profile1"></div>
							<div id="profile2">한호성</div>
						</div>
					</div>
				</div>
				<div id="bucketcpEvent">
					<div id="bucketcpEvent-1">
						<ul>
							<li><label>행사제목</label><br>삼성 여행사삼성 여행사삼성 여행사삼성 여행사삼성 여행사삼성 여행사<button>견적서 작성</button></li>
							<li><label>행사제목</label><br>LG 식품<button>견적서 작성</button></li>
							<li><label>행사제목</label><br>아시아나항공 숙박<button>견적서 작성</button></li>
							<li><label>행사제목</label><br>오리온 과자<button>견적서 작성</button></li>
							<li><label>행사제목</label><br>오리온 과자<button>견적서 작성</button></li>
							<li><label>행사제목</label><br>오리온 과자<button>견적서 작성</button></li>
							<li><label>행사제목</label><br>오리온 과자<button>견적서 작성</button></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
<script>		

	$(function(){
		// 기업일때는 전체 기업 검색임
		if('${loginCompany.coId}' != ""){
			$('#bucketcompany>ul>li>label').css('width', '100%');
		}
		
		
		var hg = $('.bucket').css('width');
		$('.bucket').css('height', hg);
		
		$(window).resize(function(){
			var hg = $('.bucket').css('width');
			$('.bucket').css('height', hg);
			var bkhg = $('#bucketDatail').width()/16 * 9;
			$('#bucketimg').css('height', bkhg);
			var bkcphg = $('#bucketimg').width()-411;
			$('#bucketcp').css('width', bkcphg);
			$('#bucketleft').css('top', bkhg/2);
			$('#bucketright').css('top', bkhg/2);
			$('#bucketimg img').css('width', $('#bucketimg').width());
			$('#bucketimg img').css('height', bkhg);
		});
	})
	
	$(".followList").on("mouseenter", function(){
		event.stopPropagation();
  		event.preventDefault();
	})
	
	$(".followList").on("mouseleave", function(){
		event.stopPropagation();
  		event.preventDefault();
  		$('#follower-area').hide();
		$('#following-area').hide();
  		isPopup=false;
	})
	
	function follow(f) {
		var following = '${ loginUser.userId }';
		var follower = '${ getMember.userId }';
		var followCount = $('#follower').text();
		$.ajax({
			url: "follow.me",
			data: {
				following:following,
				follower:follower
			}, success: function(data) {
				$(f).text("팔로우 취소");
				$(f).attr("id", "unFollowBtn");
				$(f).attr("onclick", "unfollow(this);")
				$('#follower').text(parseInt(followCount)+1);
				location.reload();
			}
		})
	}
	
	function unfollow(f) {
		var following = '${ loginUser.userId }';
		var follower = '${ getMember.userId }';
		var followCount = $('#follower').text();
		$.ajax({
			url: "unfollow.me",
			data: {
				following:following,
				follower:follower
			}, success: function(data) {
				$(f).text("팔로우");
				$(f).attr("id", "followBtn");
				$(f).attr("onclick", "follow(this);")
				$('#follower').text(followCount-1);
				location.reload();
			}
		})
	}
	
	$('#bucketAddBtn').on('click', function(){
		location.href="bucketWrite.me?nickName=${ getMember.nickName }";
	});
	
	$('#overlay').css('top','-2px');
  	$('#sidewrap').css('top','56px');
	$('nav>a:eq(0)').css('border-top','3px solid rgba(var(--b38,219,219,219),1)');
	
	$('.gnb_menu .gnb_menu_ul li a .text:eq(0)').css('color', '#fff');
	$('.gnb_menu .gnb_menu_ul li a.gnb1').css('background','url("resources/layout/images/bg01_on.jpg") no-repeat 0 center #f3f3f2');
	$('.gnb_menu .gnb_menu_ul li a.gnb1 .ico').css('background', 'url("resources/layout/images/ico01_on.png") no-repeat 0 0');
	$('.gnb_menu .gnb_menu_ul li a.gnb1 .text span').css('color','#fff');
	
	//버킷 좋아요 올리기
	function blLikeUp(bkNo){
		$.ajax({
			url:'blLike.ho',
			data:{
				bkNo:bkNo
			},
			success:function(data){
				var blLike = '.c-likeBtn.'+bkNo+'>label';
				$(blLike).text(data);
				$('#bucketlike').text(data);
				setTimeout(function(){
					$('#bucketlike').text('♡');
				}, 2000);
			}
		});
	}

	//위시 등록취소하기
	function wishRegist(bkNo, userId){
		if('${loginUser}' != null){
			if('${loginUser.nickName}' == userId){
				alert("나의 버킷은 위시등록 할 수 없습니다.");
			} else{
				$.ajax({
					url:'wishRegi.ho',
					data:{
						bkNo:bkNo,
						bucketId:userId
					},
					async : false,
					success:function(data){
						var blwish = '.c-wishBtn.'+bkNo+'>label';
						$(blwish).text(data);
					}
				});
			}
			if($('.c-wishBtn.'+bkNo+'>label').text() == '취소'){
				$('#bucketwish').css('color', '#10ccc3');
			} else if($('.c-wishBtn.'+bkNo+'>label').text() == '등록'){
				$('#bucketwish').css('color', 'white');
			}
		}
	}

	// 공유버킷등록
	function sharebl(bkNo, userId){
		if('${loginUser}' != null){
			if('${loginUser.userId}' == userId){
				alert("나의 버킷은 공유할 수 없습니다.");
			} else{
				var result = confirm("이 버킷리스트를 공유하시겠습니까?");
				if(result){
					$.ajax({
						url:'sharebl.ho',
						data:{
							bkNo:bkNo
						},
						success:function(data){
							if(data == 'success'){
								var blshare = '.c-Add.'+bkNo;
								$(blshare).hide();
								$('#bucketAdd').hide();
								alert("나의 버킷에 공유되었습니다.");
							}
						}
					});
				} else{
					alert("공유 취소");
				}
			}
		}
	}
	function bkDetail(bkNo, cateName, bkName, bkContent, tag, userId){
		first = 1;
		dataNum = 0;
		$('#bucketimg>ul').css('left', 0);
		$('#bucketimg>ul').html('');
		switch(cateName){
			case 'Travel': $('#bucketcate').html('<span style="color:#00c5bc;">Travel</span>'); break;
			case 'Sport': $('#bucketcate').html('<span style="color:#fd8ab1;">Sport</span>'); break;
			case 'Food': $('#bucketcate').html('<span style="color:#fd8b42;">Food</span>'); break;
			case 'New Skill': $('#bucketcate').html('<span style="color:#c78646;">New Skill</span>'); break;
			case 'Culture': $('#bucketcate').html('<span style="color:#9f7ed7;">Culture</span>'); break;
			case 'Outdoor': $('#bucketcate').html('<span style="color:#6fc073;">Outdoor</span>'); break;
			case 'Shopping': $('#bucketcate').html('<span style="color:#efc648;">Shopping</span>'); break;
			case 'Lifestyle	': $('#bucketcate').html('<span style="color:#87adf8;">Lifestyle</span>'); break;
		}
		$('#buckettitle').text(bkName);
		$('#bucketexplain').html(bkContent);
		$('#bucketlike').attr('onclick', 'blLikeUp('+bkNo+');');
		$('#bucketAdd').attr('onclick', 'sharebl('+bkNo+',"'+userId+'");');
		$('#bucketwish').attr('onclick', 'wishRegist('+bkNo+',"'+userId+'");');
		$('#bucketleft').attr('onclick', 'left('+bkNo+',"'+userId+'","'+bkName+'");');
		$('#bucketright').attr('onclick', 'right('+bkNo+',"'+userId+'");');
		$('#bucketright')
		var tags = tag.split(',');
		$('#bucketTag').html('');
		for(var i in tags){
			if(tags[i] != ""){
				var $div = $('<div>');
				$div.attr('id', 'bucketTag1');
				$div.attr('onclick', 'searchTag("'+tags[i]+'");');
				$div.append('<span>#</span>'+tags[i]);
				$('#bucketTag').append($div);
			}
		}
		$('#bucketAdd').show();
		if($('.c-wishBtn.'+bkNo+'>label').text() == '취소'){
			$('#bucketwish').css('color', '#10ccc3');
		}
		
		$('#bucketComAdd').attr('onclick', 'InPutCoBucket('+bkNo+');');
		// 기업 버킷 추가버튼 할지 말지
		if('${loginCompany.coId}' != ""){
			$.ajax({
				url:'bkDetailWhatAdd.ho',
				data:{
					bkNo:bkNo
				},
				async:false,
				success:function(data){
					if(data == '1'){
						$('#bucketComAdd').hide();
					} else{
						$('#bucketComAdd').show();
					}
				}
			});
			var cateNum1 = '${loginCompany.cateNum}';
			var cateName2 = 0;
			switch(cateNum1){
				case '1': cateName2 = 'Travel'; break;
				case '2': cateName2 = 'Sport'; break;
				case '3': cateName2 = 'Food'; break;
				case '4': cateName2 = 'New Skill'; break;
				case '5': cateName2 = 'Culture'; break;
				case '6': cateName2 = 'Outdoor'; break;
				case '7': cateName2 = 'Shopping'; break;
				case '8	': cateName2 = 'Lifestyle'; break;
			}
			if(cateName2 != cateName){
				$('#bucketComAdd').hide();
			}
		}
		// 버킷 기업 가져오기
		$.ajax({
			url:'bkDetailCompany.ho',
			data:{
				bkNo:bkNo
			},
			async : false,
			success:function(data){
				$('#bucketcompany>ul').html('');
				for(var key in data){
					var $value = $('<li>');
					var $label = $('<label>');
					$label.attr('onclick', 'searchCompany("'+data[key].coName+'");');
					$label.text(data[key].coName);
					$value.append($label);
					if('${loginUser}' != ""){
						var $button = $('<button>');
						$button.attr('onclick', 'estimate('+bkNo+', "'+data[key].coId+'");');
						$button.text('견적서 작성');
						$value.append($button);
					}
					$('#bucketcompany>ul').append($value);
				}
			}
		});
		// 버킷 기업 행사 가져오기
		$.ajax({
			url:'bkDetailCpFestival.ho',
			data:{
				bkNo:bkNo
			},
			async: false,
			success:function(data){
				$('#bucketcpEvent-1>ul').html('');
				for(var key in data){
					var $value = $('<li>');
					$value.html('<label>'+data[key].eventTitle+'</label><br>'+data[key].eventContent);
					if('${loginUser}' != ""){
						var $button = $('<button>');Festimate
						$button.attr('onclick', 'Festimate('+data[key].bkNo+',"'+data[key].coId+'","'+data[key].eventTitle+'","'+data[key].eventContent+'")');
						$button.text('요청서 보내기');
						$value.append($button);
					}
					$('#bucketcpEvent-1>ul').append($value);
				}
			}
		});
		
		// 버킷사진 가져오기
		if(1<=bkNo&&bkNo<=20){
			$.ajax({
				url:'bkDetailMedia.ho',
				data:{
					bkNo:bkNo
				},
				async : false,
				success:function(data){
					var value = data.substring(0,5);
					var $li = '<li><img src="http://images.hwlife.hscdn.com//library/'+value+'_view_01.jpg"></li>';
					$('#bucketimg>ul').append($li);
				}
			});
		} else{
			$.ajax({
				url:'bkDetailMedia.ho',
				data:{
					bkNo:bkNo
				},
				async : false,
				success:function(data){
					var $li = '<li><img src="resources/muploadFiles/'+data+'"></li>';
					$('#bucketimg>ul').append($li);
				}
			});
		}
		// 블로그 사진 가져오기
		$('#bucketGoBlog').show();
		$('#bucketGoBlog').attr('onclick', 'location.href="myBlog.me?bkNo='+bkNo+'&nickName='+'${ getMember.nickName }'+'"');
		if(userId == '관리자찡'){
			$('#bucketGoBlog').hide();
		}
		$.ajax({
			url:'blogMedia.ho',
			data:{
				bkNo:bkNo,
				nickName:userId
			},
			async : false,
			success:function(data){
				if(data.length > 0){
					$('#bucketright').show();
					for(var key in data){
						var $li = '<li><img src="resources/member/images/blogUploade/'+data[key]+'"></li>';
						$('#bucketimg>ul').append($li);
					}
				} else{
					$('#bucketright').hide();
				}
			}
		});
		// 공유한 사람
		$.ajax({
			url:'bkDetailShare.ho',
			data:{
				bkNo:bkNo
			},
			async : false,
			success:function(data){
				if(data.length > 0){
					$('#bucketwithPro').html('');
					$('#bucketwithCount>span').text(data.length);
					for(var key in data){
						if('${loginUser}' != ""){
							if(data[key].nickName == '${loginUser.nickName}'){
								$('#bucketAdd').hide();
							}
						}
						if(data[key].userId != 'admin'){
							if(data[key].prImage == null){
								var $div = '<a href="myBucket.me?nickName='+data[key].nickName+'"><div id="profile-div"><div id="profile1"></div><div id="profile2">'+data[key].nickName+'</div></div></a>';
								$('#bucketwithPro').append($div);
							} else {
								var $div = '<a href="myBucket.me?nickName='+data[key].nickName+'"><div id="profile-div"><div id="profile1"><img src="resources/member/images/profiles/'+data[key].prImage+'" style="width:100%;height:100%; border-radius: 100px;"></div><div id="profile2">'+data[key].nickName+'</div></div></a>';
								$('#bucketwithPro').append($div);
							}
						} else{
							$('#bucketwithCount>span').text(data.length-1);
						}
					}
				} else{
					$('#bucketwithPro').html('');
					$('#bucketwithCount>span').text('0');
				}
			}
		});
	}
	// 버킷리스트 상세보기 클릭 종류
	$('.bucket').click(function(e){
		if($(e.target).hasClass('c-likeBtn') || $(e.target).hasClass('likehover') || $(e.target).hasClass('likelabel')){
			
		} else if($(e.target).hasClass('c-addBtn')){
			
		} else if($(e.target).hasClass('c-wishBtn') || $(e.target).hasClass('wishhover') || $(e.target).hasClass('wishlabel')){
			
		} else{
			$('body').css('height', '100%');
			$('body').css('overflow', 'hidden');
			$('#FullOverLay').show();
			var bkhg = $('#bucketDatail').width()/16 * 9;
			$('#bucketimg').css('height', bkhg);
			$('#bucketleft').css('top', bkhg/2);
			$('#bucketright').css('top', bkhg/2);
			var bkcphg = $('#bucketimg').width()-411;
			$('#bucketcp').css('width', bkcphg);
			$('#bucketimg img').css('width', $('#bucketimg').width());
			$('#bucketimg img').css('height', bkhg);
		}
	});
	
	// 버킷리스트 상세보기 닫기
	$('#bucketexit').click(function(){
		$('#FullOverLay').hide();
		$('body').css('height', 'auto');
		$('body').css('overflow', 'visible');
	});
	
	// 행사 펼치기
	$('#bucketcpeventD>button').click(function(){
		if($('#bucketcpEvent').css('display') == 'none'){
			$('#bucketwith').hide();
			$('#bucketcpEvent').show();
			$('#bucketcpeventD>button').text("행사 접기");
		} else{
			$('#bucketcpEvent').hide();
			$('#bucketwith').show();
			$('#bucketcpeventD>button').text("행사 펼치기");
		}
	});
	
	// 기업 버킷 등록하기
	function InPutCoBucket(bkNo){
		var result = confirm("이 버킷을 등록하시겠습니까?");
		
		if(result){
			$.ajax({
				url:'expertUpdate.ex',
				data:{
					bucket:bkNo
				},
				async : false,
				success:function(data){
					if(data == 'success'){
						$('#bucketComAdd').hide();
					}
				}
			});
		} else{
			alert("취소");
		}
	}
	// 행사 참여
	function Festimate(bkNo, coId, eventTitle, eventContent){
		var result = confirm("이 행사로 견적서 요청 하시겠습니까?");
		if(result){
			location.href='esrequest.ex?bkNo='+bkNo+'&coId='+coId+'&eventTitle='+eventTitle+'&eventContent='+eventContent;
		} else{
			alert("취소");
		}
	}
	// 견적서 요청 하기
	function estimate(bkNo, coId){
		var result = confirm("견적서 요청 하시겠습니까?");
		if(result){
			location.href="esrequest.ex?bkNo="+bkNo+"&coId="+coId;
		} else{
			alert("취소");
		}
	}
	
	function right(bkNo, userId){
		first++;
		$.ajax({
			url:'blogMedia.ho',
			data:{
				bkNo:bkNo,
				nickName:userId
			},
			async : false,
			success:function(data){
				if(data.length > 0){
					dataNum = data.length+2;
				}
			}
		});
		$.ajax({
			url:'bloginfo.ho',
			data:{
				bkNo:bkNo,
				nickName:userId
			},
			async : false,
			success:function(data){
				$('#buckettitle').text(data[first-2].bTitle);
				$('#bucketGoBlog').attr('onclick', 'location.href="myBlog.me?bkNo='+bkNo+'&nickName='+userId+'&bNo='+data[first-2].bNo+'"');
			}
		});
		var val1 = $('#bucketimg>ul').css('left').replace('px', '');
		var val2 = $('#bucketimg li').width();
		var leftval = val1 - val2;
		if(first < dataNum){
			$('#bucketimg>ul').animate({
				left:leftval
			});
			if(first == 1){
				$('#bucketleft').hide();
			} else{
				$('#bucketleft').show();
			}
			if(first == dataNum-1){
				$('#bucketright').hide();
			} else{
				$('#bucketright').show();
			}
		}
	}
	

	function left(bkNo, userId, bkName){
		first--;
		$.ajax({
			url:'blogMedia.ho',
			data:{
				bkNo:bkNo,
				nickName:userId
			},
			async : false,
			success:function(data){
				if(data.length > 0){
					dataNum = data.length+2;
				}
			}
		});
		$.ajax({
			url:'bloginfo.ho',
			data:{
				bkNo:bkNo,
				nickName:userId
			},
			async : false,
			success:function(data){
				if(first==1){
					$('#buckettitle').text(bkName);
					$('#bucketGoBlog').attr('onclick', 'location.href="myBlog.me?bkNo='+bkNo+'&nickName='+userId+'"');
				} else{
					$('#buckettitle').text(data[first-2].bTitle);
					$('#bucketGoBlog').attr('onclick', 'location.href="myBlog.me?bkNo='+bkNo+'&nickName='+userId+'&bNo='+data[first-2].bNo+'"');
				}
			}
		});
		var val1 = $('#bucketimg>ul').css('left').replace('px', '');
		var val2 = $('#bucketimg li').width();
		var leftval = parseInt(val1) + val2;
		if(first > 0){
			$('#bucketimg>ul').animate({
				left:leftval
			});
			if(first == 1){
				$('#bucketleft').hide();
			} else{
				$('#bucketleft').show();
			}
			if(first == dataNum-1){
				$('#bucketright').hide();
			} else{
				$('#bucketright').show();
			}
		}
	}
</script>
<script type="text/javascript" src="resources/member/js/myPageBucket.js"></script>
</html>