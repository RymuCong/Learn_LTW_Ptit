package com.ptit.demo.controller;

import com.ptit.demo.dal.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "deleteCategoryServlet", urlPatterns = {"/delete-category"})
public class DeleteCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoryDAO categoryDAO = new CategoryDAO();
        String id = req.getParameter("id");
        if (id == null || id.isEmpty()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID is required");
            return;
        }
        int categoryId;
        try {
            categoryId = Integer.parseInt(id);
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format");
            return;
        }
        // Check if the category exists
        if (categoryDAO.getById(categoryId) == null) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Category not found");
            return;
        }
        // Delete the category
        boolean isDeleted = categoryDAO.delete(categoryId);
        if (!isDeleted) {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to delete category");
            return;
        }
        // Redirect to home after deleting the category
        resp.sendRedirect("home");
    }
}
