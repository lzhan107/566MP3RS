<%-- 
    Document   : create2
    Created on : Apr 13, 2013, 9:54:56 PM
    Author     : Lei
--%>

<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        if (request.getAttribute("sampleData") != null) {
            Map<String, String> sampleData = (Map) request.getAttribute("sampleData");
            out.print("<h1>Database Integrity Violation or NumberFormat Not Correct! Please follow below sample data and insert again!</h1>");
        }
    %>

    <body>

        <h1>Creating one record</h1>
        <hr/>
        <form name="createProduct" method="post" action="./CreateProduct">
            <table>
                <tr>
                    <td>PRODUCT_ID:</td>
                    <td><input type="text" name="product_id"></td>
                    <td style="color:red">${sampleData.get("product_id")}</td>
                </tr>
                <tr>
                    <td>MANUFACTURER_ID:</td>
                    <td><input type="text" name="manufacturer_id"></td>
                    <td style="color:red">${sampleData.get("manufacturer_id")}</td>
                </tr>
                <tr>
                    <td>PRODUCT_CODE:</td>
                    <td><input type="text" name="product_code" maxlength="2"></td>
                    <td style="color:red">${sampleData.get("product_code")}</td>
                </tr>
                <tr>
                    <td>PURCHASE_COST:</td>
                    <td><input type="text" name="purchase_cost"></td>
                    <td style="color:red">${sampleData.get("purchase_cost")}</td>
                </tr>
                <tr>
                    <td>QUANTITY_ON_HAND:</td>
                    <td><input type="text" name="quantity_on_hand"></td>
                    <td style="color:red">${sampleData.get("quantity_on_hand")}</td>
                </tr>
                <tr>
                    <td>MARKUP:</td>
                    <td><input type="text" name="markup"></td>
                    <td style="color:red">${sampleData.get("markup")}</td>
                </tr>
                <tr>
                    <td>AVAILABLE:</td>
                    <td><input type="text" name="available"></td>
                    <td style="color:red">${sampleData.get("available")}</td>
                </tr>
                <tr>
                    <td>DESCRIPTION:</td>
                    <td><input type="text" name="description"></td>
                    <td style="color:red">${sampleData.get("description")}</td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Create"></td>
                </tr>
        </form>
    </body>
</html>
