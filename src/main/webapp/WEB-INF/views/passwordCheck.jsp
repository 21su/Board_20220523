<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-23
  Time: 오후 1:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
  </head>
  <body>
    <form method="get" action="/${type}" name="checkForm">
      <h2>비밀번호 확인</h2>
      비밀번호 입력: <input type="password" name="boardPassword" id="pwCheck" placeholder="비밀번호 확인"><br />
      <a id="ms" style="color: red; font-size: 7px">${ms}</a>
      <input type="hidden" name="id" value="${id}">
      <input type="submit" value="확인">
    </form>
    <input type="button" onclick="location.href='detail?id=${id}'" value="되돌아가기">
  </body>
</html>
