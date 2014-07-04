<%-- 
    Document   : prodinfo
    Created on : Apr 13, 2013, 11:17:26 PM
    Author     : Lei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        if ((String) request.getAttribute("productCreated") != null) {
            out.print("<h2 color='red'>One product created!</h2>");
        } else if ((String) request.getAttribute("productUpdated") != null) {
            out.print("<h2 color='red'>One product updated!</h2>");
        } else if ((String) request.getAttribute("productDeleted") != null) {
            out.print("<h2 color='red'>One product deleted!</h2>");
        }
    %>
    <hr/>
    <a href="ProductServlet">Go back!</a>
    </body>
</html>
