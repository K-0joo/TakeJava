<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<title>자리예약시스템</title>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css?after">
    <%--  좌석 css 파일  --%>
    <link rel="stylesheet" href="./laboratory.css?after" type="text/css">
    <title>자리예약 시스템</title>
</head>
<body>
<!-- 네비게이션 구현 네비게이션이라는 것은 하나의 웹사이트의 전반적인 구성을 보여주는 역할 -->

<%--반응형웹을 구현하기 위해 container로 감싸준다.--%>

<div class="container">
    <!-- 이건 왜 넣어주는걸까 -->
    <div class="row"></div>
    <!-- 768px 이하에서 세로로 표시 시작 -->
    <h3 style="text-align: center;">자리예약 시스템</h3>
    <!-- 자리 예약 시스템 구현 -->
    <div class="box1">
        <div class="seat" onclick="showPopup();">1</div>
        <div class="seat" onclick="showPopup();">2</div>
        <div class="seat" onclick="showPopup();">3</div>
        <div class="seat" onclick="showPopup();">4</div>
        <div class="seat" onclick="showPopup();">9</div>
        <div class="seat" onclick="showPopup();">10</div>
        <div class="seat" onclick="showPopup();">11</div>
        <div class="seat" onclick="showPopup();">12</div>
    </div>
    <div class="box2">
        <div class="seat" onclick="showPopup();">5</div>
        <div class="seat" onclick="showPopup();">6</div>
        <div class="seat" onclick="showPopup();">7</div>
        <div class="seat" onclick="showPopup();">8</div>
        <div class="seat" onclick="showPopup();">13</div>
        <div class="seat" onclick="showPopup();">14</div>
        <div class="seat" onclick="showPopup();">15</div>
        <div class="seat" onclick="showPopup();">16</div>
    </div>
    <div class="box1">
        <div class="seat" onclick="showPopup();">17</div>
        <div class="seat" onclick="showPopup();">18</div>
        <div class="seat" onclick="showPopup();">19</div>
        <div class="seat" onclick="showPopup();">20</div>
        <div class="seat" onclick="showPopup();">25</div>
        <div class="seat" onclick="showPopup();">26</div>
        <div class="seat" onclick="showPopup();">27</div>
        <div class="seat" onclick="showPopup();">28</div>
    </div>
    <div class="box2">
        <div class="seat" onclick="showPopup();">21</div>
        <div class="seat" onclick="showPopup();">22</div>
        <div class="seat" onclick="showPopup();">23</div>
        <div class="seat" onclick="showPopup();">24</div>
        <div class="seat" onclick="showPopup();">29</div>
        <div class="seat" onclick="showPopup();">30</div>
        <div class="seat" onclick="showPopup();">31</div>
        <div class="seat" onclick="showPopup();">32</div>
    </div>
</div>

<div class="popup_layer" id="popup_layer" style="display: none;">
    <div class="popup_box">
        <div style="height: 10px; width: 375px; float: top;">
            <a href="javascript:closePop();"><img src="/static/img/ic_close.svg" class="m_header-banner-close" width="30px" height="30px"></a>
        </div>
        <!--팝업 컨텐츠 영역-->
        <div class="popup_cont">
            <h5> POPUP TILTE</h5>

        </div>
        <!--팝업 버튼 영역-->
        <div class="popup_btn" style="float: bottom; margin-top: 200px;">
            <a href="javascript:closePop();">닫기</a>
        </div>
    </div>
</div>
</body>
</html>
<script>
    // 팝업
    function showPopup() {
        window.open("reservation.jsp", "a", "width=500%, height=500%, left=100, top=50");
    }
</script>
