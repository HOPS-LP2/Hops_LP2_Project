package com.example.javawebapp;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ResourceServlet", urlPatterns = { "/resources/*" })
public class ResourceServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the requested resource path from the URL
        String resourcePath = request.getPathInfo();

        // Load the resource from the WEB-INF directory
        InputStream resourceStream = getServletContext().getResourceAsStream("/WEB-INF" + resourcePath);

        if (resourceStream != null) {
            // Set the appropriate content type for the resource
            String contentType = getServletContext().getMimeType(resourcePath);
            response.setContentType(contentType);

            // Stream the resource content to the response
            try (OutputStream out = response.getOutputStream()) {
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = resourceStream.read(buffer)) != -1) {
                    out.write(buffer, 0, bytesRead);
                }
            }
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}
