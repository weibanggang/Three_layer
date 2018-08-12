package com.wbg;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.rmi.server.ExportException;

@WebServlet("/testservlet.do")
public class testservlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        testService t=new testService();
        try {
            response.getWriter().print(t.select());;
        }catch (ExportException e){
            e.printStackTrace();
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
       doPost(request, response);
    }
}
