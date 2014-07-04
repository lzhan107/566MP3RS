<%-- 
    Document   : update2
    Created on : Apr 13, 2013, 10:27:17 PM
    Author     : Lei
--%>

<%@page import="entity.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          Product product = (Product)request.getAttribute("product");
          if (request.getParameter("updataFailed") != null){
              out.print("<h1>Invalid input, please input again!</h1>");
          }
        %>
        <form name="updateProduct" method="post" action="UpdateProduct">
            <h1>Updating one record</h1>
        <hr/>
        <table>
            <tr>
                <td>PRODUCT_ID:</td>
                <td><input type="text" name="product_id" readonly="" placeholder="${product.getProductId()}" value="${product.getProductId()}"></td>
            </tr>
            <tr>
                <td>MANUFACTURER_ID:</td>
                <td><input type="text" name="manufacturer_id" value="${product.getManufacturerId()}"></td>
            </tr>
            <tr>
                <td>PRODUCT_CODE:</td>
                <td><input type="text" name="product_code" value="${product.getProductCode()}"></td>
            </tr>
            <tr>
                <td>PURCHASE_COST:</td>
                <td><input type="text" name="purchase_cost" value="${product.getPurchaseCost()}"></td>
            </tr>
            <tr>
                <td>QUANTITY_ON_HAND:</td>
                <td><input type="text" name="quantity_on_hand" value="${product.getQuantityOnHand()}"></td>
            </tr>
            <tr>
                <td>MARKUP:</td>
                <td><input type="text" name="markup" value="${product.getMarkup()}" maxlength="2"></td>
            </tr>
            <tr>
                <td>AVAILABLE:</td>
                <td><input type="text" name="available" value="${product.getAvailable()}"></td>
            </tr>
            <tr>
                <td>DESCRIPTION:</td>
                <td><input type="text" name="description" value="${product.getDescription()}"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Update"></td>
            </tr>
        </table>
        </form>
    </body>
</html>
