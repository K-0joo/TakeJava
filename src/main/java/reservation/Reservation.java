package reservation;

public class Reservation {

    private static String rsvp_stu_id;
    private static String rsvp_class_num;
    private static String rsvp_seat_num;
    private static String rsvp_start_time;
    private static String rsvp_end_time;
    private static String rsvp_extend_time;
    private static String rsvp_reservation_date;

    public static String getRsvp_stu_id() {
        return rsvp_stu_id;
    }

    public void setRsvp_stu_id(String rsvp_stu_id) {
        this.rsvp_stu_id = rsvp_stu_id;
    }

    public static String getRsvp_class_num() {
        return rsvp_class_num;
    }

    public void setRsvp_class_num(String rsvp_class_num) {
        this.rsvp_class_num = rsvp_class_num;
    }

    public static String getRsvp_seat_num() {
        return rsvp_seat_num;
    }

    public void setRsvp_seat_num(String rsvp_seat_num) {
        this.rsvp_seat_num = rsvp_seat_num;
    }

    public static String getRsvp_start_time() {
        return rsvp_start_time;
    }

    public void setRsvp_start_time(String rsvp_start_time) {
        this.rsvp_start_time = rsvp_start_time;
    }

    public static String getRsvp_end_time() {
        return rsvp_end_time;
    }

    public void setRsvp_end_time(String rsvp_end_time) {
        this.rsvp_end_time = rsvp_end_time;
    }

    public static String getRsvp_extend_time() {
        return rsvp_extend_time;
    }

    public void setRsvp_extend_time(String rsvp_extend_time) {
        this.rsvp_extend_time = rsvp_extend_time;
    }

    public static String getRsvp_reservation_date() {
        return rsvp_reservation_date;
    }

    public void setRsvp_reservation_date(String rsvp_reservation_date) {
        this.rsvp_reservation_date = rsvp_reservation_date;
    }
}
