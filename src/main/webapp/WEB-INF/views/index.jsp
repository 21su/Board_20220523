<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-23
  Time: 오전 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>시작페이지</title>
</head>
<body>
<jsp:include page="./layout/header.jsp" flush="false"></jsp:include>
    <h1>시작페이지</h1>
    <a href="save">글작성 페이지</a><br />
    <a href="findAll">글 목록</a>
</body>
</html>
