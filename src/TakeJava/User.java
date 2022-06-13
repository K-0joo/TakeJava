package TakeJava;

// Database에서 회원 정보들을 자바 안에 담아 주는 클래스
public class User {
    private String stu_id;
    private String stu_name;
    private String stu_pwd;
    private String stu_phone;
    private String stu_email;

    public String getStu_id() {
        return stu_id;
    }

    public void setStu_id(String stu_id){
        this.stu_id = stu_id;
    }

    public String getStu_name() {
        return stu_name;
    }

    public void setStu_name(String stu_name)
    {
        this.stu_name = stu_name;

    }

    public String getStu_pwd() {
        return stu_pwd;
    }

    public void setStu_pwd(String stu_pwd){
        this.stu_pwd = stu_pwd;
    }

    public String getStu_phone() {
        return stu_phone;
    }

    public void setStu_phone(String stu_phone){
        this.stu_phone = stu_phone;
    }

    public String getStu_email() {
        return stu_email;
    }

    public void setStu_email(String stu_email){
        this.stu_email = stu_email;
    }


}
