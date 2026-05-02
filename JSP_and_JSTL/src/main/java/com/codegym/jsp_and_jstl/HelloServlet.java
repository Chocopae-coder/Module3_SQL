package com.codegym.jsp_and_jstl;

import java.io.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello")
public class HelloServlet extends HttpServlet {
    private String message;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = "Do Xuan Truong";
        RequestDispatcher dispatcher = request.getRequestDispatcher("/product");
        request.setAttribute("name",name);
        dispatcher.forward(request,response);

    }
}