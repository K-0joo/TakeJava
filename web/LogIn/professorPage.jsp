
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
    %>
    <style>
        button {
            width: 100px;
        }

        .hei {
            height: 100px;
        }
    </style>

</head>
<body>
<header class="p-3 mb-3 border-bottom">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="#" class="nav-link px-2 link-secondary">홈</a></li>
                <li><a href="#" class="nav-link px-2 link-secondary">시간표관리</a></li>
                <li><a href="#" class="nav-link px-2 link-secondary">학생관리</a></li>
                <li><a href="915.jsp" class="nav-link px-2 link-dark">실습예약현황</a></li>
                <li><a href="seminar.jsp" class="nav-link px-2 link-dark">세미나예약</a></li>
                <li><a href="#" class="nav-link px-2 link-dark">공지사항</a></li>
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




</body>
</html>
