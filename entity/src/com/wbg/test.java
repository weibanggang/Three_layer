package com.wbg;

public class test {
    int tid;
    String tname;

    public test() {
    }

    public int getTid() {
        return tid;
    }

    @Override
    public String toString() {
        return "test{" +
                "tid=" + tid +
                ", tname='" + tname + '\'' +
                '}';
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public test(int tid, String tname) {
        this.tid = tid;
        this.tname = tname;
    }
}
