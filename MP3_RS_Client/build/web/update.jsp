<%-- 
    Document   : update
    Created on : Apr 13, 2013, 2:52:51 AM
    Author     : Lei
--%>

<%@page import="entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          Customer customer = (Customer)request.getAttribute("customer");
          if (request.getParameter("updataFailed") != null){
              out.print("<h1>Invalid input, please input again!</h1>");
          }
        %>
        <form name="updateCustomer" method="post" action="UpdateCustomer">
        <h1>Updating one record</h1>
        <hr/>
        <table>
            <tr>
                <td>CUSTOMER_ID:</td>
                <td><input type="text" name="customer_id" readonly="" placeholder="${customer.getCustomerId()}" value="${customer.getCustomerId()}"></td>
            </tr>
            <tr>
                <td>NAME:</td>
                <td><input type="text" name="name" value="${customer.getName()}"></td>
            </tr>
            <tr>
                <td>ADDRESSLINE1:</td>
                <td><input type="text" name="addressline1" value="${customer.getAddressline1()}"></td>
            </tr>
            <tr>
                <td>ADDRESSLINE2:</td>
                <td><input type="text" name="addressline2" value="${customer.getAddressline2()}"></td>
            </tr>
            <tr>
                <td>CITY:</td>
                <td><input type="text" name="city" value="${customer.getCity()}"></td>
            </tr>
            <tr>
                <td>STATE:</td>
                <td><input type="text" name="state" value="${customer.getState()}" maxlength="2"></td>
            </tr>
            <tr>
                <td>PHONE:</td>
                <td><input type="text" name="phone" value="${customer.getPhone()}"></td>
            </tr>
            <tr>
                <td>FAX:</td>
                <td><input type="text" name="fax" value="${customer.getFax()}"></td>
            </tr>
            <tr>
                <td>EMAIL:</td>
                <td><input type="text" name="email" value="${customer.getEmail()}"></td>
            </tr>
            <tr>
                <td>CREDIT_LIMIT:</td>
                <td><input type="text" name="credit_limit" value="${customer.getCreditLimit()}"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Update"></td>
            </tr>
        </table>
        </form>
    </body>
</html>
