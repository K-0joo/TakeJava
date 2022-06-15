<%--
  Created by IntelliJ IDEA.
  User: tyty4
  Date: 2022-05-29
  Time: 오후 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

  <!-- 메타 태그 작성 -->
  <!-- width=device-width는 디바이스 화면 크기 고려 -->
  <!-- initial-scale="1"은 초기 비율 1로 설정-->
  <meta name="viewport" content="width=device-width", inital-scale="1">

  <!-- link 태그를 이용해서, stylesheet를 참조 선언. 링크로 css 폴더 안에 있는 bootstrap.css를 사용해 준다고 명시. -->
  <!-- link 태그 오류로 아래와 같이 변경함.-->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <!--link rel="stylesheet" href="../css/custom.css" -->

  <title>로그인 페이지</title>


</head>

<body>

<!-- 네비게이션 구현. 웹 사이트의 전반적인 구성을 보여줌. -->
<nav class="navbar navbar-default">

  <!-- header 부분. 로고 및 상단 고정바 파트 -->
  <div class="navbar-header">
    <!-- <1> 웹페이지 로고 글자 지정.-->
    <a class ="navbar-brand">컴퓨터 좌석 예약 시스템</a>
  </div>

  <!-- 조교 전용 페이지로 이동 -->
  <ul>
    <li><a href="ManageLogIn.jsp">관리자 로그인</a></li>
  </ul>

  <!-- 버튼 추가 파트.(아직 논의 X) -->

</nav>

<div class="container" align="center">

  <!-- 로그인 폼 작성 -->
  <!-- col은 colspan, lg는 large screen, 4는 pc 버전에서 3분의 1 정도 크기고 모바일에선 절반 크기를 지정해준 것-->
  <div class="col-lg-4"></div>
  <div class="col-lg-4">

    <!-- jumbotron이란 간단한 정보를 눈에 띄게 보여주는 박스 -->
    <div class="jumbotron" style="padding-top: 40px;">

      <!-- 양식 삽입. post는 회원가입이나 로그인같이 어떠한 정보 값을 숨기면서 보내는 메소드-->
      <!-- 로그인 Action 페이지로 정보를 보내겠다.-->
      <form method="post" action="loginAction.jsp">

        <!-- 로그인 페이지 내부의 문장 가운데 정렬로 삽입 -->
        <h3 style="text-align: center;">로그인</h3>

        <!-- 아이디 입력 공간 구현 -->
        <div class="form-group">

          <!-- name="userID" 쪽은 나중에 서버 프로그램을 작성할 때 사용하기 때문에 대소문자 구별 -->
          <input type="text" class="form-control" placeholder="아이디" name="stu_id" maxlength="20">

        </div>

        <!-- 패스워드 입력 공간 구현 -->
        <div class="form-group">
          <input type="password" class="form-control" placeholder="비밀번호" name="stu_pwd" maxlength="20">
        </div>

        <!-- 로그인 버튼 구현 -->
        <input type="submit" class="btn btn-primary form-control" value="로그인">

        <button type="button" class="btn btn-link" onclick="location.href='../Register/Register.jsp'">회원가입</button>

        <button type="button" class="btn btn-link" onclick="location.href='../ResetPassword/ResetPassword.jsp'">비밀번호 찾기</button>
      </form>
    </div>
  </div>

  <div class="col-lg-4"></div>

</div>

<!-- 이 파일의 애니메이션을 담당할 자바스크립트 참조 선언 jquery를 특정 홈페이지에서 호출 -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- js 폴더 안에 있는 bootstrap.js를 사용 선언 -->
<!-- script src="../js/bootstrap.js"></script -->
<!-- 위와 동일한 오류로 아래와 같이 선언 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</body>
</html>
