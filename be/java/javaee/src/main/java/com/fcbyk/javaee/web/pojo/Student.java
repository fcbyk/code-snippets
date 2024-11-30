package com.fcbyk.javaee.web.pojo;

public class Student {
    private int sno ;
    private String sname ;
    private String sex ;

    public Student(int sno, String sname, String sex) {
        this.sno = sno;
        this.sname = sname;
        this.sex = sex;
    }

    @Override
    public String toString() {
        return "Student{" +
                "sno:'" + sno + '\'' +
                ", sname:" + sname +
                ", sex:'" + sex + '\'' +
                '}';
    }
}
