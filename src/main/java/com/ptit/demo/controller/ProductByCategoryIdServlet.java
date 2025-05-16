package com.ptit.demo.controller;

import com.ptit.demo.dal.CategoryDAO;
import com.ptit.demo.dal.ProductDAO;
import com.ptit.demo.model.Category;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ProductByCategoryIdServlet", urlPatterns = {"/category"})
public class ProductByCategoryIdServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Get category ID from request parameter
            String categoryIdParam = req.getParameter("cid");
            if (categoryIdParam == null || categoryIdParam.isEmpty()) {
                // If no category ID provided, redirect to all products
                resp.sendRedirect("product");
                return;
            }

            int categoryId = Integer.parseInt(categoryIdParam);

            // Get the category details
            CategoryDAO categoryDAO = new CategoryDAO();
            Category category = categoryDAO.getById(categoryId);

            if (category == null) {
                // If category doesn't exist, redirect to all products
                resp.sendRedirect("product");
                return;
            }

            // Get products by category ID
            ProductDAO productDAO = new ProductDAO();
            req.setAttribute("productsByCategory", productDAO.getByCategoryId(categoryId));
            req.setAttribute("category", category);

            // Forward to the category products JSP
            req.getRequestDispatcher("product-category.jsp").forward(req, resp);

        } catch (NumberFormatException e) {
            // Invalid category ID format
            resp.sendRedirect("product");
        }
    }
}