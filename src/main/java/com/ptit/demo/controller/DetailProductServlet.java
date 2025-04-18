package com.ptit.demo.controller;

import com.ptit.demo.dal.ProductDAO;
import com.ptit.demo.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DetailProductServlet", urlPatterns = {"/product-detail"})
public class DetailProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Get product ID from request parameter
            String idParam = req.getParameter("id");
            if (idParam == null || idParam.isEmpty()) {
                resp.sendRedirect("product");
                return;
            }

            // Get product details from database
            ProductDAO dao = new ProductDAO();
            Product product = dao.getById(idParam);

            if (product == null) {
                // Product not found, redirect to products page
                resp.sendRedirect("product");
                return;
            }

            // Set product as request attribute
            req.setAttribute("product", product);

            // Forward to product detail JSP
            req.getRequestDispatcher("product-detail.jsp").forward(req, resp);

        } catch (NumberFormatException e) {
            // Invalid ID format, redirect to products page
            resp.sendRedirect("product");
        }
    }
}