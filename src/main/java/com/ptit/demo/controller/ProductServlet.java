package com.ptit.demo.controller;

import com.ptit.demo.dal.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ProductServlet", urlPatterns = {"/product"})
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // get list of products
        ProductDAO dao = new ProductDAO();
        req.setAttribute("products", dao.getAll());
        req.getRequestDispatcher("products.jsp").forward(req, resp);
    }
}
