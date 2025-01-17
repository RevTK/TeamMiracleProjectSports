<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TRIPPLE: Review</title>

</head>

<body>
	<div class="review__bg-1"
		style="float: right; position: absolute; top: 400px; left: 80%;">
		<img src="resources/files/backgroundImg/review5.png">
	</div>
	<div class="watch__container">

		<!-- watch 페이지 헤더 -->
		<div class="watch__header">
			<div class="watch__header-title">
				<a href="review.board.go?post_board=12" class="nav__link"
					style="font-size: 15px">&nbsp;&nbsp;&nbsp;&nbsp;REVIEW</a>
			</div>
			<div class="watch__header-title">
				스포츠 열기는<span> 모두와 함께</span>
			</div>
			<div class="move__button-wrapper">
				<c:choose>
					<c:when test="${sessionScope.loginAccount ne null}">
						<button class="action-button"
							onclick="location.href='review.reg.go?post_board=${param.post_board}'">
							새글쓰기</button>
					</c:when>
					<c:otherwise>
						<a href="review.reg.go?post_board=${param.post_board}"
							onclick="alert('로그인하세요')">새글쓰기</a>
					</c:otherwise>
				</c:choose>
			</div>

		</div>


		<!-- 리뷰 : top 슬라이더 -->
		<div class="review__slide">
			<div class="review js-flickity"
				data-flickity-options='{ "wrapAround": true }'>

				<!-- 야구 -->
				<div class="review__cell">
					<div class="review__img">
						<img
							src="https://images.pexels.com/photos/5184705/pexels-photo-5184705.jpeg?auto=compress&cs=tinysrgb&w=600"
							alt="" class="review__photo">
					</div>
					<div class="review__content">
						<div class="review__title">야구 리뷰 제목</div>
						<div class="review__member">by 김태형</div>
						<div class="rate">
							<span class="review__voters">1.987 voters</span>
						</div>
						<div class="review__sum">Readers of all ages and walks of
							life have drawn inspiration and empowerment from Elizabeth
							Gilbert’s books for years.</div>
						<div class="review__see">리뷰보기</div>
					</div>
				</div>

				<!-- 축구 -->
				<div class="review__cell">
					<div class="review__img">
						<img
							src="https://images.pexels.com/photos/5246966/pexels-photo-5246966.jpeg?auto=compress&cs=tinysrgb&w=600
"
							alt="" class="review__photo">
					</div>
					<div class="review__content">
						<div class="review__title">축구 리뷰 제목</div>
						<div class="review__member">by 임형규</div>
						<div class="rate">
							<span class="review__voters">1.987 voters</span>
						</div>
						<div class="review__sum">The hunt for each splinter of
							Paul's soul sends Marguerite racing through a war-torn San
							Francisco.</div>
						<div class="review__see review-blue">리뷰보기</div>
					</div>
				</div>

				<!-- 농구 -->
				<div class="review__cell">
					<div class="review__img">
						<img
							src="https://images.pexels.com/photos/159611/basketball-player-game-sport-159611.jpeg?auto=compress&cs=tinysrgb&w=600"
							alt="" class="review__photo">
					</div>
					<div class="review__content">
						<div class="review__title">농구 리뷰 제목</div>
						<div class="review__member">by 정 권</div>
						<div class="rate">
							<span class="review__voters">1.987 voters</span>
						</div>
						<div class="review__sum">The Great Gatsby, F. Scott
							Fitzgerald’s third book, stands as the supreme achievement of his
							career.</div>
						<div class="review__see review-purple">리뷰보기</div>
					</div>
				</div>

				<!-- 배구 -->
				<div class="review__cell">
					<div class="review__img">
						<img
							src="https://images.pexels.com/photos/6203676/pexels-photo-6203676.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
							alt="" class="review__photo">
					</div>
					<div class="review__content">
						<div class="review__title">배구 리뷰 제목</div>
						<div class="review__member">by 송준우</div>
						<div class="rate">
							<span class="review__voters">1.987 voters</span>
						</div>
						<div class="review__sum">Louisa Clark is no longer just an
							ordinary girl living an ordinary life. After the transformative
							six months spent.</div>
						<div class="review__see review-yellow">리뷰보기</div>
					</div>
				</div>
			</div>
		</div>


		<!-- 리뷰 : bot -->
		<div class="watch__wrapper">
			<div class="review__posts__wrapper">

				<!-- 리뷰 : bot right top -->
				<div class="review__posts__menu">
					<div class="review__posts__genre">
						<!-- 왼쪽 검색바 -->
						<form action="review.search.do" name="boardSearchForm"
							onsubmit="return boardSearchCheck();">
							<input type="hidden" name="post_board"
								value="${param.post_board}">
							<div id="snsSearchArea">
								<input class="search-bar" name="search" type="search"
									maxlength="10" autocomplete="off" placeholder="검색">
							</div>
						</form>
					</div>
					<div class="review__sports__types">
						<a href="#" class="review__sports__type active"> All Sports</a> <a
							href="#" class="review__sports__type"> Baseball</a> <a href="#"
							class="review__sports__type"> Soccer</a> <a href="#"
							class="review__sports__type"> Basketbll</a> <a href="#"
							class="review__sports__type"> Volleyball</a>
					</div>
				</div>


				<!-- 리뷰 : bot right bot -->
				<div class="review__posts">
					<c:forEach var="p" items="${posts }">
						<div class="review__post">
							<div class="review__post__content-wrapper">
								<img src="resources/ckeditor/fileUpload/${p.post_img}" alt=""
									class=review__post__img>

								<div class="review__post__content">
									<div class="review__post__title">
										<a
											href="review.detail.go?post_id=${p.post_id }&post_member=${p.post_member}">${p.post_title }
											[${p.post_reply_count}]</a>
									</div>
									<div class="review__post__by">by ${p.member_nick}</div>
									<div class="rate">
										<span class="review__voters card-vote">${p.post_like_count}
											추천</span>
									</div>
									<div class="review__sum card-sum">Readers of all ages and
										walks of life have drawn inspiration and empowerment from
										Elizabeth Gilbert’s books for years.</div>
									<!-- ck에디터 안에 이미지주소도 들어있어서 이미지가 또 나온다 -->
								</div>
							</div>
						</div>
					</c:forEach>

				</div>

				<!-- 페이징 -->
				<div class="board__bot-paging">
					<c:if test="${curPage != 1}">
						<span><span style="cursor: pointer"
							onclick="location.href='review.page.change?pg=1&post_board=${param.post_board }'">[맨처음]</span></span>
						<span><span style="cursor: pointer"
							onclick="location.href='review.page.change?pg=${curPage - 1}&post_board=${param.post_board }'">
								◀이전 </span></span>
					</c:if>
					<c:forEach var="i" begin="1" end="${pageCount}">
						<span style="cursor: pointer"
							onclick="location.href='review.page.change?pg=${i}&post_board=${param.post_board }'">
							[${i}] </span>
					</c:forEach>
					<c:if test="${curPage != pageCount}">
						<span> <span style="cursor: pointer"
							onclick="location.href='review.page.change?pg=${curPage + 1}&post_board=${param.post_board }'">
								다음▶ </span></span>
						<span><span style="cursor: pointer"
							onclick="location.href='review.page.change?pg=${pageCount}&post_board=${param.post_board }'">[맨끝]</span></span>
					</c:if>
				</div>
			</div>

		</div>
	</div>

	<script>
		/*=============== 스크롤 나타나는 효과 ===============*/
		const srReview = ScrollReveal({
			origin : 'right',
			distance : '290px',
			duration : 2400,
			delay : 200
		//reset: true, // 애니메이션은 반복
		})

		srReview.reveal(`.review__bg-1`, {
			origin : 'right'
		});

		srReview.reveal(`.watch__container`, {
			origin : 'right'
		});

		srReview.reveal(`.watch__header`, {
			origin : 'right'
		});
		srReview.reveal(`.review__slide, .watch__wrapper`, {
			origin : 'right'
		});
	</script>
</body>
</html>