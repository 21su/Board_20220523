<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-23
  Time: 오전 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>글 상세조회</title>
    <script src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script>


        window.onload = function (){
            if(${boardDTO.boardFileName != null} && ${boardDTO.boardFileName.length() != 14}){
                const image = document.getElementById("img");
                image.innerHTML = image.innerHTML + "<br /> <img src='${pageContext.request.contextPath}/upload/${boardDTO.boardFileName}'" +
                "alt='' height='100' width='100'>"+"<br />";
            }
        }
        const paging= () =>{
            location.href = "/paging?page=${page}";
        }
    </script>
</head>
<body>
<jsp:include page="./layout/header.jsp" flush="false"></jsp:include>
    <div class="container">
        <h1>${boardDTO.boardTitle}</h1>
        ${boardDTO.boardWriter}<br/>
        ${boardDTO.boardHits}
         <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${Board.boardCreatedDate}"></fmt:formatDate><br />
        <p></p>
        <p  id="img" style="font-size: 20px; width: 200px ;height: 300px">${boardDTO.boardContents}</p><br />
        <button onclick="location.href='/passwordCheck?id=${boardDTO.id}&type=update'">수정</button>
           <button onclick="location.href='/passwordCheck?id=${boardDTO.id}&type=delete'">삭제</button><br /><br/>
        <button onclick="location.href='/findAll'">글목록</button>
           <button onclick="location.href='/'">메인</button>
        <button onclick="paging()">페이징목록</button>
    </div>
<br />
<div class="container">
    <div id="comment-write" class="mb-3 form-floating">
        <input type="text" id="commentWriter" placeholder="작성자">
        <input type="text" id="commentContents" placeholder="내용">
        <button id="comment-write-btn" class="btn btn-primary">댓글작성</button>
    </div>

    <div id="comment-List">
        <table class="table">
            <tr>
                <th>댓글번호</th>
                <th>작성자</th>
                <th>내용</th>
                <th>작성시간</th>
            </tr>
            <c:forEach items="${commentList}" var="comment">
                <tr>
                    <td>${comment.id}</td>
                    <td>${comment.commentWriter}</td>
                    <td>${comment.commentContents}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${comment.commentCreatedDate}"></fmt:formatDate></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<script>
    $("#comment-write-btn").click(function (){
        // alert("ㅇㅇ")
        // 댓글 작성자, 내용을 가져오고
        // ajax 문법을 활용하여 /comment/save 주소로 post 방식으로 작성자 ,내용 글번호 이렇게
        // 세개의 값을 보내는 코드를 작성
        const commentWriter = document.getElementById("commentWriter").value;
        const commentContents = $("#commentContents").val();
        const boardId = '${boardDTO.id}';
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                "boardId": boardId,
                "commentWriter": commentWriter,
                "commentContents": commentContents
            },
            dataType: "json",
            success: function (result){
                let output = "<table class='table'>";
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th></tr>";
                for(let i in result){
                    output += "<tr>";
                    output += "<td>"+result[i].id+"</td>";
                    output += "<td>"+result[i].commentWriter+"</td>";
                    output += "<td>"+result[i].commentContents+"</td>";
                    output += "<td>"+moment(result[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss")+"</td>";
                    output += "</tr>";
                }
                document.getElementById("comment-List").innerHTML = output;
                document.getElementById("commentWriter").value = "";
                document.getElementById("commentContents").value = "";
                alert("댓글을 작성했습니다.")
            },
            error: function (){
                alert("실패");
            }
        });
    });
</script>
</body>
</html>
