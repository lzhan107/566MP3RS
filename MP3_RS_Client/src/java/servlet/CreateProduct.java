/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import client.ProductClient;
import entity.Product;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lei
 */
public class CreateProduct extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productCreated = "productCreated";
        Map<String, String> sampleData = new HashMap<String, String>();
        sampleData.put("product_id", "Sample: 98221");
        sampleData.put("manufacturer_id", "Sample: 19992345");
        sampleData.put("product_code", "Sample: HW");
        sampleData.put("purchase_cost", "Sample: 120.00");
        sampleData.put("quantity_on_hand", "Sample: 10");
        sampleData.put("markup", "Sample: 7.35");
        sampleData.put("available", "Sample: TRUE");
        sampleData.put("description", "Sample: Flash Drive");

        try {
            int product_id = Integer.valueOf(request.getParameter("product_id"));
            int manufacturer_id = Integer.valueOf(request.getParameter("manufacturer_id"));
            String product_code = request.getParameter("product_code");
            BigDecimal purchase_cost = BigDecimal.valueOf(Double.valueOf(request.getParameter("purchase_cost")));
            int quantity_on_hand = Integer.valueOf(request.getParameter("quantity_on_hand"));
            BigDecimal markup = BigDecimal.valueOf(Double.valueOf(request.getParameter("markup")));
            String available = request.getParameter("available");
            String description = request.getParameter("description");

            Product product = new Product();
            product.setProductId(product_id);
            product.setManufacturerId(manufacturer_id);
            product.setProductCode(product_code);
            product.setPurchaseCost(purchase_cost);
            product.setQuantityOnHand(quantity_on_hand);
            product.setMarkup(markup);
            product.setAvailable(available);
            product.setDescription(description);

            ProductClient.createProduct(product);
        } catch (Exception e) {
            request.setAttribute("sampleData", sampleData);
            RequestDispatcher rd = request.getRequestDispatcher("/create2.jsp");
            rd.forward(request, response);
        }

        request.setAttribute("productCreated", productCreated);
        RequestDispatcher rd = request.getRequestDispatcher("/prodinfo.jsp");
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
