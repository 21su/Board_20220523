<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-23
  Time: 오후 2:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <h1>게시글 수정</h1>
    <form method="post" action="update">
        <input type="hidden" name="id" value="${idDTO.id}">
        <table class="table table-striped">
            <tr>
                <td>제목: </td>
                <td><input type="text" name="boardTitle" placeholder="제목" value="${idDTO.boardTitle}" required></td>
            </tr>
            <tr>
                <td>내용:</td>
                <td><textarea name="boardContents" rows="50" cols="50">${idDTO.boardContents}</textarea></td>
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
