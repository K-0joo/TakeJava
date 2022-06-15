<%@ page import="TakeJava.ManageUserDAO" %>
<%@ page import="TakeJava.Seat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Optional" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.Duration" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
            crossorigin="anonymous"></script>
    <%
        String admin_id = null;
        if (session.getAttribute("admin_id") != null) {
            admin_id = (String) session.getAttribute("admin_id");
        } else {
           /* PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인하세요')");
            script.println("location.href = 'Login.jsp'");
            script.println("</script>");*/
        }

        ManageUserDAO Dao = new ManageUserDAO();
        boolean seminar = Dao.isSeminar(916);
        List<Seat> seatList =new ArrayList<>();
        if (!seminar) {
            seatList = Dao.seatStatus(916);
        }
        int count = 1;
    %>
    <style>
        button {
            width: 200px;
        }
        .hei{
            height: 200px;
        }
    </style>

</head>
<body>
<header class="p-3 mb-3 border-bottom">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="professorPage.jsp" class="nav-link px-2 link-secondary">홈으로</a></li>
                <li><a href="915.jsp" class="nav-link px-2 link-secondary">915</a></li>
                <li><a href="916.jsp" class="nav-link px-2 link-blue">916</a></li>
                <li><a href="918.jsp" class="nav-link px-2 link-secondary">918</a></li>
                <li><a href="911.jsp" class="nav-link px-2 link-secondary active">911</a></li>
            </ul>


            <div class="dropdown text-end">
                <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1"
                   data-bs-toggle="dropdown" aria-expanded="false">
                    <p><%= admin_id %>님 안녕하세요</p>
                </a>
                <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
                    <li><a class="dropdown-item" href="logout.jsp">로그아웃</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>
<div>
    <div class="d-flex justify-content-evenly">
        <%if(!seminar){%>
        <%for (int i = 1; i < 5; i++) {%>
        <div class="d-flex" style="align-items : end">
            <%for (int j = 1; j < 5; j++) {
                int finalCount = count;
                Optional<Seat> seat1 = seatList.stream().filter(k -> k.getSetNumber() == finalCount).findFirst();
                Seat seat = seat1.orElse(null);
                if (seat != null && seat.isSeatStatus()) {
            %>
            <div class ="hei">
                <%
                    LocalTime currentTime = LocalTime.now();
                    if (seat.getExtendTime() != null) {
                        LocalTime parse = LocalTime.parse(seat.getExtendTime(), DateTimeFormatter.ofPattern("HH:mm:ss"));
                        long seconds = Math.abs(Duration.between(currentTime, parse).getSeconds());
                        LocalTime localTime = LocalTime.ofSecondOfDay(seconds);
                %>
                <button class="btn btn-warning hei" disabled id="<%=count%>"> 사용중
                    <br /> 남은시간 : <%=localTime%>
                    <br /> 사용자 :<%=seat.getUsername()%>
                    <br /> 사용자 번호 :<%=seat.getSetNumber()%>
                    <br /> 사용자 이메일 :<%=seat.getEmail()%>
                </button>
                <%
                } else {
                    LocalTime parse = LocalTime.parse(seat.getEndTime(), DateTimeFormatter.ofPattern("HH:mm:ss"));
                    long seconds =  Math.abs(Duration.between(currentTime, parse).getSeconds());
                    LocalTime localTime = LocalTime.ofSecondOfDay(seconds);
                %>
                <button class="btn btn-warning hei" disabled id="<%=count%>"> 사용중
                    <br /> 남은시간 : <%=localTime%>
                    <br /> 사용자 :<%=seat.getUsername()%>
                    <br /> 사용자 번호 :<%=seat.getSetNumber()%>
                    <br /> 사용자 이메일 :<%=seat.getEmail()%>
                </button>
                <%
                    }
                %>

            </div>
            <%
            } else if (seat == null) {
            %>
            <div class ="hei">
                <button class="btn btn-primary hei" id="<%=count%>"><%=count%>번</button>
            </div>
            <% } else {%>
            <div class ="hei">

                <button class="btn btn-danger hei" disabled id="<%=count%>"><%=count%>번   <br /> 사용불가</button>
            </div>
            <% } %>
            <% count++;
            }%>
        </div>
        <% }%>
        <%}else{%>
        <%for (int i = 1; i < 5; i++) {%>
        <div class="d-flex" style="align-items : end">
            <%for (int j = 1; j < 5; j++) {%>
            <div class ="hei">
                <button class="btn btn-danger hei" disabled id="<%=count%>"><%=count%>번   <br /> 세미나로인한사용불가</button>
            </div>
            <% count++;
            }%>
        </div>
        <% }%>
        <%}%>
    </div>

    <div class="d-flex justify-content-evenly">
        <%if(!seminar){%>
        <%for (int i = 1; i < 5; i++) {%>
        <div class="d-flex" style="align-items : end">
            <%for (int j = 1; j < 5; j++) {
                int finalCount = count;
                Optional<Seat> seat1 = seatList.stream().filter(k -> k.getSetNumber() == finalCount).findFirst();
                Seat seat = seat1.orElse(null);
                if (seat != null && seat.isSeatStatus()) {
            %>
            <div class ="hei">
                <%
                    LocalTime currentTime = LocalTime.now();
                    if (seat.getExtendTime() != null) {
                        LocalTime parse = LocalTime.parse(seat.getExtendTime(), DateTimeFormatter.ofPattern("HH:mm:ss"));
                        long seconds = Math.abs(Duration.between(currentTime, parse).getSeconds());
                        LocalTime localTime = LocalTime.ofSecondOfDay(seconds);
                %>
                <button class="btn btn-warning hei" disabled id="<%=count%>"> 사용중
                    <br /> 남은시간 : <%=localTime%>
                    <br /> 사용자 :<%=seat.getUsername()%>
                    <br /> 사용자 번호 :<%=seat.getSetNumber()%>
                    <br /> 사용자 이메일 :<%=seat.getEmail()%>
                </button>
                <%
                } else {
                    LocalTime parse = LocalTime.parse(seat.getEndTime(), DateTimeFormatter.ofPattern("HH:mm:ss"));
                    long seconds =  Math.abs(Duration.between(currentTime, parse).getSeconds());
                    LocalTime localTime = LocalTime.ofSecondOfDay(seconds);

                %>
                <button class="btn btn-warning hei" disabled id="<%=count%>"> 사용중
                    <br /> 남은시간 : <%=localTime%>
                    <br /> 사용자 :<%=seat.getUsername()%>
                    <br /> 사용자 번호 :<%=seat.getSetNumber()%>
                    <br /> 사용자 이메일 :<%=seat.getEmail()%>
                </button>
                <%
                    }
                %>

            </div>
            <%
            } else if (seat == null) {
            %>
            <div class ="hei">
                <button class="btn btn-primary hei" id="<%=count%>"><%=count%>번</button>
            </div>
            <% } else {%>
            <div class ="hei">

                <button class="btn btn-danger hei" disabled id="<%=count%>"><%=count%>번   <br /> 사용불가</button>
            </div>
            <% } %>
            <% count++;
            }%>
        </div>
        <% }%>
        <%}else{%>
        <%for (int i = 1; i < 5; i++) {%>
        <div class="d-flex" style="align-items : end">
            <%for (int j = 1; j < 5; j++) {%>
            <div class ="hei">
                <button class="btn btn-danger hei" disabled id="<%=count%>"><%=count%>번   <br /> 세미나로인한사용불가</button>
            </div>
            <% count++;
            }%>
        </div>
        <% }%>
        <%}%>
    </div>

</div>

</body>
</html>
