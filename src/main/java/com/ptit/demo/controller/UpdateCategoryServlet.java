package com.ptit.demo.controller;

import com.ptit.demo.dal.CategoryDAO;
import com.ptit.demo.model.Category;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "updateCategoryServlet", urlPatterns = {"/update-category"})
public class UpdateCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        CategoryDAO dao = new CategoryDAO();
        Category category = dao.getById(categoryId);
        if (category == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Category not found");
            return;
        }

        request.setAttribute("category", category);
        request.getRequestDispatcher("update-category.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from request
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String describe = request.getParameter("describe");

        // Validate required parameters
        if (id == null || id.isEmpty() || name == null || name.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID and Name are required");
            return;
        }

        int categoryId;
        try {
            categoryId = Integer.parseInt(id);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format");
            return;
        }

        CategoryDAO dao = new CategoryDAO();
        Category category = dao.getById(categoryId);
        if (category == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Category not found");
            return;
        }

        // Update the category
        category.setName(name);
        category.setDescribe(describe);
        boolean isUpdated = dao.update(category);

        if (!isUpdated) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update category");
            return;
        }

        response.sendRedirect("home");
    }
}