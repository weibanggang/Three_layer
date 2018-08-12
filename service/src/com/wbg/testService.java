package com.wbg;

import java.util.List;

public class testService {
    public static String select(){
        String data="{\"data\":[";
        String fh="";
        testDao d=new testDao();
        List<test> list=d.select();
        for(test t:list){
            data+=fh+"{\"tid\":"+t.getTid()+",\"tname\":\""+t.getTname()+"\"}";
            fh=",";
        }
        data+="]}";
        return data;
    }

    public static void main(String[] args) {
        testService t=new testService();
        System.out.println(t.select());
    }
}
