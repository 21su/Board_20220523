<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-23
  Time: 오전 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>글목록</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="./layout/header.jsp" flush="false"></jsp:include>
    <h2>회원목록</h2>
    <table class="table table-striped">
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        <c:forEach var="Board" items="${boardList}">
            <tr>
                <td>${Board.id}</td>
                <td><a href="detail?id=${Board.id}" style="color: black">${Board.boardTitle}</a> </td>
                <td>${Board.boardWriter}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${Board.boardCreatedDate}"></fmt:formatDate></td>
                <td>${Board.boardHits}</td>
            </tr>
        </c:forEach>
    </table>
    <button onclick="location.href='/'">메인</button>
</body>
</html>
