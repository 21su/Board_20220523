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
    <script>
      function passwordCheck(){
        const pw = document.getElementById("pwCheck").value;
        const pwcheck = ${modelDTO.boardPassword};
        if(pw == pwcheck){
          location.href="/${type}/?id=${id}";
        }else{
          document.getElementById("ms").innerHTML = "비밀번호가 틀렸습니다.<br />";
        }
      }
    </script>
  </head>
  <body>
  <jsp:include page="./layout/header.jsp" flush="false"></jsp:include>
      <h2>비밀번호 확인</h2>
      비밀번호 입력: <input type="password" name="boardPassword" id="pwCheck" placeholder="비밀번호 확인"><br />
      <a id="ms" style="color: red; font-size: 7px"></a>
      <input type="button" onclick="passwordCheck()" value="확인">
    <input type="button" onclick="location.href='/detail?id=${id}'" value="되돌아가기">
  </body>
</html>
