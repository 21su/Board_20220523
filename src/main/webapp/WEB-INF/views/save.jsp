<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-23
  Time: 오전 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>save</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="./layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
            <h1>글작성</h1>
                    <form method="post" action="save">
            <table class="table table-striped">
                <tr>
                    <td>제목: </td>
                    <td><input type="text" name="boardTitle" placeholder="제목" required></td>
                </tr>
                <tr>
                    <td>작성자: </td>
                    <td><input type="text" name="boardWriter" placeholder="작성자" required></td>
                </tr>
                <tr>
                    <td>비밀번호: </td>
                    <td><input type="password" name="boardPassword" placeholder="비밀번호" required></td>
                </tr>
                <tr>
                    <td>내용:</td>
                    <td><textarea name="boardContents" rows="50" cols="50"></textarea></td>
                </tr>
                <tr>
                    <td><input type="submit" value="작성">  <input type="button" onclick="location.href='/'" value="취소"></td>
                    <td></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
