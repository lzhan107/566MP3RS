<%-- 
    Document   : create
    Created on : Apr 13, 2013, 2:52:42 AM
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
        <form name="createCustomer" action="./CreateCustomer" method="post">
        <table>
            <tr>
                <td>CUSTOMER_ID:</td>
                <td><input type="text" name="customer_id"></td>
                <td style="color:red">${sampleData.get("customer_id")}</td>
            </tr>
            <tr>
                <td>NAME:</td>
                <td><input type="text" name="name"></td>
                <td style="color:red">${sampleData.get("name")}</td>
            </tr>
            <tr>
                <td>ADDRESSLINE1:</td>
                <td><input type="text" name="addressline1"></td>
                <td style="color:red">${sampleData.get("addressline1")}</td>
            </tr>
            <tr>
                <td>ADDRESSLINE2:</td>
                <td><input type="text" name="addressline2"></td>
                <td style="color:red">${sampleData.get("addressline2")}</td>
            </tr>
            <tr>
                <td>CITY:</td>
                <td><input type="text" name="city"></td>
                <td style="color:red">${sampleData.get("city")}</td>
            </tr>
            <tr>
                <td>STATE:</td>
                <td><input type="text" name="state" maxlength="2"></td>
                <td style="color:red">${sampleData.get("state")}</td>
            </tr>
            <tr>
                <td>PHONE:</td>
                <td><input type="text" name="phone"></td>
                <td style="color:red">${sampleData.get("phone")}</td>
            </tr>
            <tr>
                <td>FAX:</td>
                <td><input type="text" name="fax"></td>
                <td style="color:red">${sampleData.get("fax")}</td>
            </tr>
            <tr>
                <td>EMAIL:</td>
                <td><input type="text" name="email"></td>
                <td style="color:red">${sampleData.get("email")}</td>
            </tr>
            <tr>
                <td>CREDIT_LIMIT:</td>
                <td><input type="text" name="credit_limit"></td>
                <td style="color:red">${sampleData.get("credit_limit")}</td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Create"></td>
            </tr>
        </table>
        </form>
    </body>
</html>
