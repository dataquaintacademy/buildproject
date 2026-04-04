package com.ecommerce.web;

import com.ecommerce.service.ProductCatalog;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
    private final ProductCatalog productCatalog = new ProductCatalog();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("products", productCatalog.listProducts());
        request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
    }
}
