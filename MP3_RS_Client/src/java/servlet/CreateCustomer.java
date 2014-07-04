/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import client.CustomerClient;
import entity.Customer;
import java.io.IOException;
import java.util.HashMap;
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
public class CreateCustomer extends HttpServlet {

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
        String customerCreated = "customerCreated";
        Map<String, String> sampleData = new HashMap<String, String>();
        sampleData.put("customer_id", "Sample: 501");
        sampleData.put("name", "Sample: L");
        sampleData.put("addressline1", "Sample: 400E 33Rd St.");
        sampleData.put("addressline2", "Sample: Chicago, IL");
        sampleData.put("city", "Sample: Chicago");
        sampleData.put("state", "Sample: IL");
        sampleData.put("phone", "Sample: 311-823-0000");
        sampleData.put("fax", "Sample: 123-456-789");
        sampleData.put("email", "Sample: abc@yahoo.com");
        sampleData.put("credit_limit", "123");
        try{
        int customer_id = Integer.parseInt(request.getParameter("customer_id"));
        String name = request.getParameter("name");
        String addressline1 = request.getParameter("addressline1");
        String addressline2 = request.getParameter("addressline2");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String phone = request.getParameter("phone");
        String fax = request.getParameter("fax");
        String email = request.getParameter("email");
        int credit_limit = Integer.parseInt(request.getParameter("credit_limit"));
        Customer customer = new Customer();
        customer.setCustomerId(customer_id);
        customer.setName(name);
        customer.setAddressline1(addressline1);
        customer.setAddressline2(addressline2);
        customer.setCity(city);
        customer.setState(state);
        customer.setPhone(phone);
        customer.setFax(fax);
        customer.setEmail(email);
        customer.setCreditLimit(credit_limit);
        CustomerClient.createCustomer(customer);
        }catch(Exception e){
            request.setAttribute("sampleData", sampleData);
            RequestDispatcher rd = request.getRequestDispatcher("/create.jsp");
            rd.forward(request, response);
        }
        request.setAttribute("customerCreated", customerCreated);
        RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
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
