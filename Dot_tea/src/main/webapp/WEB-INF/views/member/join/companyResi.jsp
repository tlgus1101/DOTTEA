<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<body>

	<table>
		<tr>
			<th scope="col">사업자 번호</th>
			<th scope="col">사업자 발행일</th>
			<th scope="col">사업장명</th>
			<th scope="col">사업장 도로명상세 주소</th>
		</tr>
		<c:choose>
			<c:when test="${fn:length(list)>0}">
				<c:forEach items="${ResiList }" var="row">
					<c:if test="${row.wkplJnngStcd = 1 }">
						<tr>
							<td>${row.bzowrRgstNo }</td>
							<td>${row.dataCrtYm }</td>
							<td><a href="#this" name="title">${row.wkplNm }</a> <input
								type="hidden" id="IDX" value="${row.IDX }"></td>
							<td>${row.wkplRoadNmDtlAddr }</td>
							<td>${row.wkplJnngStcd }</td>
						</tr>
					</c:if>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
</body>
</html>