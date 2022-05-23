<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-23
  Time: 오전 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>글 상세조회</title>
</head>
<body>
    <div class="container">
        <h1>${boardDTO.boardTitle}</h1>
        ${boardDTO.boardWriter}<br/>
        ${boardDTO.boardHits}
         <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${Board.boardCreatedDate}"></fmt:formatDate><br />
        <p style="font-size: 20px; width: 200px ;height: 300px">${boardDTO.boardContents}</p><br />
        <button onclick="location.href='passwordCheck?id=${boardDTO.id}&type=update'">수정</button>
           <button onclick="location.href='passwordCheck?id=${boardDTO.id}&type=delete'">삭제</button><br /><br/>
        <button onclick="location.href='findAll'">글목록</button>
           <button onclick="location.href='/'">메인</button>
    </div>
</body>
</html>
