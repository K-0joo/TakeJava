<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css?after">
    <title>예약</title>
</head>
<html>
<body>
<h3>좌석 사용 시간을 설정해주세요</h3>

<h3>예약자정보 입력</h3>

<form action="ReservationAction.jsp" method=POST">

    <table border ="0">
        <thead>
        <tr>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>학번</td>
            <td><input type="int" name="rsvp_stu_id" size="20"/></td>
        </tr>
        <tr>
            <td>강의실 번호</td>
            <td><input type="int" name="rsvp_class_num" size="20"/></td>
        </tr>
        <tr>
            <td>좌석 번호</td>
            <td><input type="int" name="rsvp_seat_num" size="20"/></td>
        </tr>
        <tr>
            <td>예약 날짜</td>
            <td><input type="int" name="rsvp_reservation_date" size="20"/>
                <script>
                    let today = new Date();
                    document.write(today)
                </script></td>
        </tr>
        <tr>
            <td>시작 시간</td>
            <td><p><input type="time" name="rsvp_start_time" min="09:00:00"></p></td>
        </tr>
        <tr>
            <td>종료 시간</td>
            <td>
                <p><input type="time" name="rsvp_end_time" max="24:00:00"></p>
        </tr>
        <tr>
            <td>연장 시간</td>
            <td>
                <p><input type="time" name="rsvp_extend_time" max="24:00:00"></p>
        </tr>
        <tr>
            <div style="text-align: center;">
                <td><input type="submit" class="btn btn-primary form-control" value="저 장" ;/></td>
                <td><input type="button" class="btn btn-primary form-control" value="닫 기" onclick="self.close();"/></td>
            </div>
        </tr>
        </tbody>
    </table>
</form>
</body>
</html>
