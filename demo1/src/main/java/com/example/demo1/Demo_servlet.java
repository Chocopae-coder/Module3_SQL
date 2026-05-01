package com.example.demo1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet (name = "Demo", value ="/demo" )
public class Demo_servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doGet(req, resp);
//        System.out.println("Hello Servelet is called");
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("<form method=\"post\" action=\"/demo\">\n" +
                "    <input placeholder=\"enter your name\" name=\"nameInput\">\n" +
                "    <button>submit</button>\n" +
                "</form>");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp);
        String name = req.getParameter("nameInput");
        System.out.println("Name = "+name);
        PrintWriter out = resp.getWriter();
        out.println("<h1> Hello "+name+"</h1>");
    }
}
