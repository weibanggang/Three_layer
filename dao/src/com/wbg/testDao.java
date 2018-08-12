package com.wbg;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class testDao {
    public static void main(String[] args) {
        testDao d=new testDao();
        List<test> list=d.select();
        for(test t:list){
            System.out.println(t);
        }
    }

    public static List<test> select() {
        Connection con=null;
        List<test> list=new ArrayList<test>();
        test te=null;
        //加载驱动
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con= DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databasename=therr_layer","sa","123456");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String sql="select * from test";
        Statement stat=null;
        ResultSet rs=null;
        try {
           stat=  con.createStatement();
           rs=stat.executeQuery(sql);
            while (rs.next()){
                te=new test(rs.getInt("tid"),rs.getString("tname"));
                list.add(te);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            try {
                if(!rs.isClosed())
                rs.close();
                if(!con.isClosed())
                con.close();
                if(!stat.isClosed())
                stat.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }
}
