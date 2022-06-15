<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">

    <!-- 부트 스트랩 설정 -->
    <meta name="viewport" content="width=device-width" , inital-scale="1">

    <!--스타일시트를 참조, 주소는 css안에 부트스트랩.css-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <title>회원 가입</title>

</head>

<body>
    <!-- 네비게이션 구현 -->
    <nav class="navbar navbar-default">

        <!-- 헤더 생성 -->
        <div class="navbar-header">
            <a class ="navbar-brand">컴퓨터 좌석 예약 시스템</a>
        </div>

    </nav>


    <div class="container">
        <div class="col-lg-4"></div>

        <!-- 회원가입 폼은 위의 양식은 일치하며, 내부 폼만 바꿔준다. -->
        <div class="col-lg-4">
            <div class="jumbotron" style="padding-top: 20px;">

                <!-- 로그인 Action 페이지로 정보를 보내겠다 -->
                <form method="post" action="RegisterAction.jsp">

                    <!-- 회원 가입에 맞게 하기 위에 액션은 RegisterAction 페이지로 밑에 제목은 회원가입 화면으로 변경 -->
                    <h3 style="text-align: center;">회원가입</h3>

                    <!-- 아이디 -->
                    <div class="form-group">
                        <!-- 회원 가입에서도 userID or userPassword는 동일하게 가져가고, 회원가입에 필요한 나머지 속성추가 -->
                        <input type="text" class="form-control" placeholder="아이디" name="stu_id" maxlength="20">
                    </div>

                    <!-- 패스워드 -->
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="비밀번호" name="stu_pwd" maxlength="20">
                    </div>

                    <!-- 사용자 이름-->
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="이름" name="stu_name" maxlength="20">
                    </div>

                    <!-- email -->
                    <div class="form-group">
                        <!-- placeholder는 아무런 입력이 없을때 띄워주는 값 -->
                        <input type="email" class="form-control" placeholder="이메일" name="stu_email" maxlength="50">
                    </div>

                    <!-- 휴대폰 -->
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="전화번호" name="stu_phone" maxlength="20">
                    </div>

                    <!-- 토큰 -->
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="토큰" name="token" maxlength="20">

                        <!-- 토큰 확인 버튼-->
<%--                        <div class="btn-group" data-toggle="buttons">--%>
<%--                            <!-- 선택이 된곳에 표시를 하는 active를 설정해준다. -->--%>

<%--&lt;%&ndash;                            <input type="button" class="btn btn-primary active" name="tokenCheck" autocomplete="off" value="확인" checked>&ndash;%&gt;--%>

<%--                        </div>--%>

                    </div>

                    <!-- 버튼 또한 회원가입으로 value변경 -->
                    <input type="submit" class="btn btn-primary form-control" value="회원가입">
                </form>
            </div>
        </div>

        <div class="col-lg-4"></div>

    </div>

    <!-- 애니메이션을 담당하게 될 자바스크립트 참조 -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

    <!-- 특정홈페이지에서 제이쿼리 호출 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</body>

</html>