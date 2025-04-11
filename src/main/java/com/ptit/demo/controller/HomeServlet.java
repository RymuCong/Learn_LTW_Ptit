package com.ptit.demo.controller;

import com.ptit.demo.dal.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "homeServlet", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       CategoryDAO dao = new CategoryDAO();
       request.setAttribute("categories", dao.getAll());
        System.out.println("Categories: " + dao.getAll());
       request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}
