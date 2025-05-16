package com.ptit.demo.util;

import com.ptit.demo.dal.CategoryDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;

@WebFilter(filterName = "CategoryFilter", urlPatterns = {"/*"})
public class CategoryFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;

        // Only load categories if they're not already in the request
        if (httpRequest.getAttribute("categories") == null) {
            CategoryDAO categoryDAO = new CategoryDAO();
            httpRequest.setAttribute("categories", categoryDAO.getAll());
        }

        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void destroy() {
    }
}
