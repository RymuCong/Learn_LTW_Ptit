package com.ptit.demo.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "BaloServlet", urlPatterns = {"/balo"})
public class BaloServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public BaloServlet() {
        super();
    }

     @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        // Handle GET request
        try {
            request.getRequestDispatcher("balo.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
     }
}
