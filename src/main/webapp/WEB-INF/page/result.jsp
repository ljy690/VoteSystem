<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fs"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<base href="/VoteSystem/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>结果分析</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/result.js"></script>
</head>
<body>
<jsp:include page="top.jsp" />
<div id="vote" class="wrap">
	<h2>结果分析</h2>
	<ul class="list">
		<li>
			<input type="hidden" name="vsId" id="vsId" value="${currSubject.vsId }"/>
			<h4>${currSubject.vsTitle }[${currSubject.vsType eq 1 ? '单选':'多选'}]
			<span style="float:right;font-size:14px;">发布者：${currSubject.vuUsername }&nbsp;&nbsp;
					发布日期：${currSubject.vsBeginTime }</span>
			</h4>
			<p style="margin-left:20px;">主题介绍：
			<c:choose>
				<c:when test="${currSubject.vsIntroduction==null }">
				无
				</c:when>
				<c:otherwise>
				${currSubject.vsIntroduction }
				</c:otherwise>
			</c:choose>
			</p>
			<p class="info">共有${currSubject.optionCount }个选项，已有${currSubject.voteAllCount }个网友参与了投票。 </p>
			<c:if test="${currSubject.vsStatus == 2 }">
			<p class="info" style="color:red;"> 该投票已关闭 </p>
			</c:if>
				<ul>
					<c:forEach items="${options}" var="voteOption" varStatus="status">
						<li>
							<c:choose>
							<c:when test="${status.index == 0}">
								<c:choose>
									<c:when test="${ voteOption.voteUserCount==0}">
									<div>${voteOption.voOrder}.${voteOption.voOption}</div>
									</c:when>
									<c:otherwise><div class="impword">${voteOption.voOrder}.${voteOption.voOption}&nbsp;&nbsp;NO.1</div></c:otherwise>
								</c:choose>
								<%-- <p>简介：${voteOption.voIntro}</p> --%>
								<div class="rate">
									<div class="ratebg">
										<div
										<c:choose>
											<c:when test="${ voteOption.voteUserCount==0}"> class="percent"</c:when>
											<c:otherwise>class="percent3"</c:otherwise>
										</c:choose> 
										style='width:
											<c:choose>
												<c:when test="${voteOption.voteUserCount == 0}">0</c:when>
												<c:otherwise><fmt:formatNumber value="${voteOption.voteUserCount/voteOption.totalVote}" type="percent" maxFractionDigits="2"/></c:otherwise>
											</c:choose>'>
										</div>
									</div>
									<p>
										<span>(
											<c:choose>
												<c:when test="${voteOption.voteUserCount == 0}">0</c:when>
												<c:otherwise><fmt:formatNumber value="${voteOption.voteUserCount/voteOption.totalVote}" type="percent" maxFractionDigits="2"/></c:otherwise>
											</c:choose>)
										</span>总：${voteOption.voteUserCount}票
									</p>
								</div>
							</c:when>
							
							<c:when test="${status.index == 1}">
								<c:choose>
									<c:when test="${ voteOption.voteUserCount==0}">
									<div>${voteOption.voOrder}.${voteOption.voOption}</div>
									</c:when>
									<c:otherwise><div class="impword">${voteOption.voOrder}.${voteOption.voOption}&nbsp;&nbsp;NO.2</div></c:otherwise>
								</c:choose>
								<%-- <p>简介：${voteOption.voIntro}</p> --%>
								<div class="rate">
									<div class="ratebg">
										<div
										<c:choose>
											<c:when test="${ voteOption.voteUserCount==0}"> class="percent"</c:when>
											<c:otherwise>class="percent3"</c:otherwise>
										</c:choose> 
										style='width:
											<c:choose>
												<c:when test="${voteOption.voteUserCount == 0}">0</c:when>
												<c:otherwise><fmt:formatNumber value="${voteOption.voteUserCount/voteOption.totalVote}" type="percent" maxFractionDigits="2"/></c:otherwise>
											</c:choose>'>
										</div>
									</div>
									<p>
										<span>(
											<c:choose>
												<c:when test="${voteOption.voteUserCount == 0}">0</c:when>
												<c:otherwise><fmt:formatNumber value="${voteOption.voteUserCount/voteOption.totalVote}" type="percent" maxFractionDigits="2"/></c:otherwise>
											</c:choose>)
										</span>总：${voteOption.voteUserCount}票
									</p>
								</div>
							</c:when>
							
							<c:when test="${status.index == 2}">
								<c:choose>
									<c:when test="${ voteOption.voteUserCount==0}">
									<div>${voteOption.voOrder}.${voteOption.voOption}</div>
									</c:when>
									<c:otherwise><div class="impword">${voteOption.voOrder}.${voteOption.voOption}&nbsp;&nbsp;NO.3</div></c:otherwise>
								</c:choose>
								<%-- <p>简介：${voteOption.voIntro}</p> --%>
								<div class="rate">
									<div class="ratebg">
										<div
										<c:choose>
											<c:when test="${ voteOption.voteUserCount==0}"> class="percent"</c:when>
											<c:otherwise>class="percent3"</c:otherwise>
										</c:choose> 
										style='width:
											<c:choose>
												<c:when test="${voteOption.voteUserCount == 0}">0</c:when>
												<c:otherwise><fmt:formatNumber value="${voteOption.voteUserCount/voteOption.totalVote}" type="percent" maxFractionDigits="2"/></c:otherwise>
											</c:choose>'>
										</div>
									</div>
									<p>
										<span>(
											<c:choose>
												<c:when test="${voteOption.voteUserCount == 0}">0</c:when>
												<c:otherwise><fmt:formatNumber value="${voteOption.voteUserCount/voteOption.totalVote}" type="percent" maxFractionDigits="2"/></c:otherwise>
											</c:choose>)
										</span>总：${voteOption.voteUserCount}票
									</p>
								</div>
							</c:when>
							<c:otherwise>
								<div>${voteOption.voOrder}.${voteOption.voOption}</div>
								<%-- <p>简介：${voteOption.voIntro}</p> --%>
								<div class="rate">
									<div class="ratebg">
										<div class="percent" style='width:
											<c:choose>
												<c:when test="${voteOption.voteUserCount == 0}">0</c:when>
												<c:otherwise><fmt:formatNumber value="${voteOption.voteUserCount/voteOption.totalVote}" type="percent" maxFractionDigits="2"/></c:otherwise>
											</c:choose>'>
										</div>
									</div>
									<p>
										<span>(
											<c:choose>
												<c:when test="${voteOption.voteUserCount == 0}">0</c:when>
												<c:otherwise><fmt:formatNumber value="${voteOption.voteUserCount/voteOption.totalVote}" type="percent" maxFractionDigits="2"/></c:otherwise>
											</c:choose>)
										</span>总：${voteOption.voteUserCount}票
									</p>
								</div>
							</c:otherwise>
							</c:choose>
							
							<!-- <p style="height:15px;">此选项中男性和女性分别占的比例如下所示：</p> -->
							<!-- 男票分割线 -->
							<div class="rate">
								<div class="ratebg">
									<div class="percent1" style='width:
										<c:choose>
											<c:when test="${voteOption.voteMaleSex == 0}">0</c:when>
											<c:otherwise><fmt:formatNumber value="${voteOption.voteMaleSex/voteOption.voteUserCount}" type="percent" maxFractionDigits="2"/></c:otherwise>
										</c:choose>'>
									</div>
								</div>
								<p>
									<span>(
										<c:choose>
											<c:when test="${voteOption.voteMaleSex == 0}">0</c:when>
											<c:otherwise><fmt:formatNumber value="${voteOption.voteMaleSex/voteOption.voteUserCount}" type="percent" maxFractionDigits="2"/></c:otherwise>
										</c:choose>)
									</span>男：${voteOption.voteMaleSex}票
								</p>
							</div>
							<!-- 女票分割线 -->
							<div class="rate">
								<div class="ratebg">
									<div class="percent2" style='width:
										<c:choose>
											<c:when test="${voteOption.voteFemaleSex == 0}">0</c:when>
											<c:otherwise><fmt:formatNumber value="${voteOption.voteFemaleSex/voteOption.voteUserCount}" type="percent" maxFractionDigits="2"/></c:otherwise>
										</c:choose>'>
									</div>
								</div>
								<p>
									<span>(
										<c:choose>
											<c:when test="${voteOption.voteFemaleSex == 0}">0</c:when>
											<c:otherwise><fmt:formatNumber value="${voteOption.voteFemaleSex/voteOption.voteUserCount}" type="percent" maxFractionDigits="2"/></c:otherwise>
										</c:choose>)
									</span>女：${voteOption.voteFemaleSex}票
								</p>
							</div>
						</li>
					</c:forEach> 
					<div class="analRes" id="analRe">
						<c:if test="${currSubject.optionCount>0 && currSubject.optionCount<=3 }">
							<a href="javascript:void(0)" onclick="getHotData(1,${currSubject.vsId })">点击查看结果分析</a>
						</c:if>
						<c:if test="${currSubject.optionCount>3 && currSubject.optionCount<=10 }">
							<a href="javascript:void(0)" onclick="getHotData(3,${currSubject.vsId })">点击查看结果分析</a>
						</c:if>
						<c:if test="${currSubject.optionCount>10 }">
							<a href="javascript:void(0)" onclick="getHotData(5,${currSubject.vsId })">点击查看结果分析</a>
						</c:if>
						<!-- <p>分析参考如下：</p>
						<p>此投票最受大众欢迎的前几名是：加糖玛奇朵。所得票数分别为：</p>
						<p>其中，</p>
						<p>最受男性欢迎的前几名是拿铁咖啡，所得票数分别为：</p>
						<p>最受女性欢迎的前几名是焦糖玛奇朵，所得票数分别为：</p> -->
					</div>
				</ul>
				<div class="goback"><a href="javascript:history.go(-1)">返回上一级</a></div>
		</li>
	</ul>
</div>
<jsp:include page="footer.jsp" />
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/view.js"></script>
</body>
</html>
