<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>物品信息界面</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"
	type="text/css" />
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/jquery.dropdown.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body
	style="background-image: url(backgroundImages/loginBackground.jpg); background-size: 100%">
	<div class="container">
		<div class="navbar navbar-default navbar-fixed-top" role="navigation">
			<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
				style="margin-left: 200px; margin-right: 150px;">
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="QueryAllGoodsByPage?goodsType=all">所有物品</a></li>
						<li><a href="QueryAllGoodsByPage?goodsType=电子产品">电子产品</a></li>
						<li><a href="QueryAllGoodsByPage?goodsType=生活用品">生活用品</a></li>
						<li><a href="QueryAllGoodsByPage?goodsType=体育用品">体育用品</a></li>
						<li><a href="QueryAllGoodsByPage?goodsType=手工品">手工品</a></li>
						<li><a href="QueryAllGoodsByPage?goodsType=服装">服装</a></li>
						<li><a href="QueryAllGoodsByPage?goodsType=书籍">书籍</a></li>
						<li><a href="QueryAllGoodsByPage?goodsType=其他">其他</a></li>
					</ul>
					<form class="navbar-form navbar-left" role="search"
						action="SelectGoodsLikeGoodsNameController" method="post">
						<div class="form-group">
							<input type="text" class="form-control" name="keyWord" />
						</div>
						<button type="submit" class="btn btn-default">搜索</button>
					</form>
					<ul class="nav navbar-nav">

						<%
							if (session.getAttribute("user") != null) {
						%>
						<li><img alt="" width=50px height=50px
							src="userImages/${sessionScope.user.userImage}"></li>
						<li><a href="#">${sessionScope.user.userName}</a></li>
						<li><a href="signOut.jsp">退出</a></li>
						<%
							} else {
						%>
						<li><a href="login.jsp">登录</a></li>
						<li><a href="register.jsp">注册</a></li>

						<%
							}
						%>

						<!-- 根据用户权限的不同设置管理中心 或者个人中心-->
						<c:choose>
							<c:when test="${user.permissionLevel==2}">
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown">管理中心<strong class="caret"></strong></a>
									<ul class="dropdown-menu">
										<li><a href="sendMessge.jsp">发消息</a></li>
										<li><a
											href="SelectAllCheckedGoodsController?goodsStatus=1">已审核</a>
										</li>
										<li><a
											href="SelectAllCheckedGoodsController?goodsStatus=0">待审核</a>
										</li>
										<li><a href="SelectAllUserController">用户管理</a></li>
										<li><a href="addAnnouncement.jsp">发布公告</a></li>
										<li><a href="SelectAllAnnouncementController">管理公告</a></li>
										<li><a
											href="SelectAllSendMessageController?userEmail=${user.userEmail}">发出的消息</a>
										</li>
										<li><a
											href="SelectAllReceiveMessageController?userEmail=${user.userEmail}">收到的消息</a>
										</li>

									</ul></li>
							</c:when>
							<c:otherwise>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown">个人中心<strong class="caret"></strong></a>
									<ul class="dropdown-menu">
										<li><a href="sendMessge.jsp">发消息</a></li>
										<li><a href="addGoods.jsp">上传物品</a></li>
										<li><a
											href="SelectAllGoodsByUserEmailController?userEmail=${user.userEmail}">我的上传</a>
										</li>
										<li><a
											href="SelectAllCollectController?userId=${user.userId}">我的收藏</a>

										</li>
										<li><a href="SelectAllAnnouncementController">查看公告</a></li>
										<li><a
											href="SelectOneUserController?userId=${user.userId}">个人信息</a>
										</li>
										<li><a
											href="SelectAllSendMessageController?userEmail=${user.userEmail}">发出的消息</a>
										</li>
										<li><a
											href="SelectAllReceiveMessageController?userEmail=${user.userEmail}">收到的消息</a>
										</li>
										<li><a
											href="SelectAllSendExchangeController?userEmail=${user.userEmail}">发出的换物请求</a></li>
										<li><a
											href="SelectAllReceiveExchangeController?userEmail=${user.userEmail}">收到的换物请求</a></li>
										<li><a href="updatePersonageInfo.jsp">个人信息修改</a></li>
									</ul></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>

			</nav>
		</div>
		<div style="height: 50px;"></div>
		<div class="row clearfix"
			style="margin-left: 150px; margin-top: 50px;">
			<div class="col-md-12 column">
				<div class="row">
					<div class="col-md-10">
						<div class="thumbnail"
							style="margin-left: 50px; background: #D1EEEE;">
							<img alt="300x200"  style="width: 400px;height: 400px;" src="goodsImages/${goods.goodsImage}" />
							<div class="caption">
								<h3>编号：${goods.goodsId}</h3>
								<h3>${goods.goodsName}</h3>
								<h2>${goods.goodsDegree}</h2>
								<h3>${goods.goodsType}</h3>
								<p>${goods.goodsDescription}</p>
								<h4>
									用户 <font size="5px" color="#e33e33"><i><b>${goods.userEmail}</b>
									</i></font>在 ${goods.goodsReleaseTime} 上传该物品
								</h4>
								<p>
									<a class="btn btn-primary"
										href="AddCollectController?goodsId=${goods.goodsId}&goodsName=${goods.goodsName}&goodsType=${goods.goodsType}&userId=${sessionScope.user.userId}&userEmail=${goods.userEmail}">收藏物品</a>
									<a class="btn btn-primary"
										href="exchangeApply.jsp?goodsId=${goods.goodsId}&userEmail=${goods.userEmail}">换此物</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>