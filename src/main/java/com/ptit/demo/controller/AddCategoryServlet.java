package com.ptit.demo.controller;

import com.ptit.demo.dal.CategoryDAO;
import com.ptit.demo.model.Category;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "addCategoryServlet", urlPatterns = {"/add-category"})
public class AddCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle GET request to show the form for adding a new category
        request.getRequestDispatcher("add-category.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle POST request to add a new category
        String id = request.getParameter("id");
        if (id == null || id.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID is required");
            return;
        }
        int categoryId;
        try {
            categoryId = Integer.parseInt(id);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format");
            return;
        }
        String name = request.getParameter("name");
        String describe = request.getParameter("describe");
        Category category = new Category(categoryId, name, describe);
        CategoryDAO dao = new CategoryDAO();
        // Check if the category already exists
        Category existingCategory = dao.getById(categoryId);
        if (existingCategory != null) {
            response.sendError(HttpServletResponse.SC_CONFLICT, "Category with this ID already exists");
            return;
        }
        boolean isAdded = dao.insert(category);
        if (!isAdded) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to add category");
            return;
        }
        response.sendRedirect("home"); // Redirect to home after adding the category
    }
}
