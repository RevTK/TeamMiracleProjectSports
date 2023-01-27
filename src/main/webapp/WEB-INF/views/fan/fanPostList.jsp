<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<nav>
		<div id="community_area">
			<ul id="community_list">
				<li><a style="cursor: pointer"
					href="fan.board.go?post_board=21">야구 게시판</a></li>
				<li><a style="cursor: pointer"
					href="fan.board.go?post_board=22">축구 게시판</a></li>
				<li><a style="cursor: pointer"
					href="fan.board.go?post_board=23">농구 게시판</a></li>
				<li><a style="cursor: pointer"
					href="fan.board.go?post_board=24">배구 게시판</a></li>
				<li><a style="cursor: pointer"
					href="fan.board.go?post_board=41">분석 게시판</a></li>
			</ul>
		</div>
	</nav>

	<h1>${param.post_board }게시판</h1>

	<!--==================== 게시판 ====================-->
	<main class="board__main"> <br>
	<div class="board__container">
		<div class="board__top">
			<c:choose>
				<c:when test="${sessionScope.loginAccount ne null}">
					<a href="fan.reg.go?post_board=${param.post_board}"> 새글쓰기</a>
				</c:when>
				<c:otherwise>
					<a href="fan.reg.go?post_board=${param.post_board}"
						onclick="alert('로그인하세요')">새글쓰기</a>
				</c:otherwise>
			</c:choose>
		</div>


		<table class="board__table" border="1">
			<thead>
				<tr>
					<th>게시판넘버</th>
					<th>글번호</th>
					<th>탭</th>
					<th>제목</th>
					<th>등록일</th>
					<th>닉네임</th>
 					<th>조회수</th>
					<th>추천수</th>
				</tr>
				<c:forEach var="p" items="${posts }">
					<tr>
						<td>${p.post_board}</td>
						<td>${p.post_id}</td>
						<td>${p.post_category}</td>
						<td><a
							href="fan.detail.go?post_id=${p.post_id }&post_member=${p.post_member}">${p.post_title } [${p.post_reply_count}]</a></td>
						<td><c:choose>
								<c:when test="${p.post_update_date eq null }">
									<fmt:formatDate value="${p.post_reg_date}"
										pattern="yy-MM-dd HH:mm" />
								</c:when>
								<c:otherwise>
									<fmt:formatDate value="${p.post_update_date}"
										pattern="yy-MM-dd HH:mm" />
								</c:otherwise>
							</c:choose></td>
						<td>${p.member_nick}</td>
						<td>${p.post_hit_count}</td>
						<td>${p.post_like_count}</td>
					</tr>
				</c:forEach>
			</thead>
		</table>


		<div class="board__bot">
			<div class="board__bot-search">
				<form action="fan.search.do" name="boardSearchForm"
					onsubmit="return boardSearchCheck();">
					<input type="hidden" name="post_board" value="${param.post_board}"> 
					<table id="snsSearchArea">
						<tr>
							<td id="ssaTd1"><input name="search" maxlength="10"
								autocomplete="off"></td>
							<td id="ssaTd2"><button>검색</button></td>
						</tr>
					</table>
				</form>
			</div>
			${pageCount}
			<div class="board__bot-paging">
				<c:if test="${curPage != 1}">
					<span><a href="fan.page.change?pg=1&post_board=${param.post_board }">[맨처음]</a></span>
					<span><a href="fan.page.change?pg=${curPage - 1}&post_board=${param.post_board }">
							◀이전 </a></span>
				</c:if>
				<c:forEach var="i" begin="1" end="${pageCount}">
					<a href="fan.page.change?pg=${i}&post_board=${param.post_board }"> [${i}] </a>
				</c:forEach>
				<c:if test="${curPage != pageCount}">
					<span> <a href="fan.page.change?pg=${curPage + 1}&post_board=${param.post_board }">
							다음▶ </a></span>
					<span><a href="fan.page.change?pg=${pageCount}&post_board=${param.post_board }">[맨끝]</a></span>
				</c:if>
			</div>
		</div>

	</div>
	</main>
</body>
</html>