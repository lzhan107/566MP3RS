<%-- 
    Document   : index
    Created on : Apr 13, 2013, 12:48:33 AM
    Author     : Lei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        String customerCreated = (String) request.getAttribute("customerCreated");
        String customerUpdated = (String) request.getAttribute("customerUpdated");
        String customerDeleted = (String) request.getAttribute("customerDeleted");
        if (customerCreated != null){
            out.print("<h2 color='red'>One customer created!</h2>");
        }
               else if (customerUpdated != null){
            out.print("<h2 color='red'>One customer updated!</h2>");
        }
               else if (customerDeleted != null){
            out.print("<h2 color='red'>One customer deleted!</h2>");
        }
    %>
    <body>
        <form action="./CustomerServlet" name="indexForm" method="post">
        <h1>Welcome to Customer DB, click the button to get customers and products!</h1>
        <input type="submit" value="Fetch records"/>
        </form>
    </body>
</html>
