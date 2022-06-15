package TakeJava;

public class Seat {
    private String endTime;
    private String startTime;
    private String extendTime;
    private String username;
    private int phoneNumber;
    private String email;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(int phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isSeminar() {
        return seminar;
    }

    public void setSeminar(boolean seminar) {
        this.seminar = seminar;
    }

    private boolean seminar;
    private int setNumber;
    private boolean seatStatus;

    public String getEndTime() {
        return endTime;
    }

    public String getStartTime() {
        return startTime;
    }

    public String getExtendTime() {
        return extendTime;
    }

    public int getSetNumber() {
        return setNumber;
    }

    public boolean isSeatStatus() {
        return seatStatus;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public void setExtendTime(String extendTime) {
        this.extendTime = extendTime;
    }

    public void setSetNumber(int setNumber) {
        this.setNumber = setNumber;
    }

    public void setSeatStatus(boolean seatStatus) {
        this.seatStatus = seatStatus;
    }
}
