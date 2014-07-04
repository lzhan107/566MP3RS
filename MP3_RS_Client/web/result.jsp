<%-- 
    Document   : result
    Created on : Apr 13, 2013, 12:55:10 AM
    Author     : Lei
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function createCustomer(){
                var custList = document.getElementsByName("customer");
                for (var i = 0; i < custList.length; i++){
                    if(custList[i].checked){
                        alert("Please do not check any customer for CREATE!");
                        return false;
                    }
                }
                window.location.href = "create.jsp";
            }
            function updateCustomer(){
                var num = 0;
                var custList = document.getElementsByName("customer");
                var rowNum = 0;
                for (var i = 0; i < custList.length; i++){
                    if(custList[i].checked){
                        num = num + 1;
                        rowNum = i + 1;
                    }
                    if (num == 2){
                        alert("Only one customer can be checked for UPDATE!");
                        return false;
                    }
                }
                if (num == 0){
                    alert("Please at least check one customer!");
                    return false;
                }
                alert(rowNum + " row selected");
                window.location.href = "RetrieveCustomer?rowNum="+rowNum;
            }
            function deleteCustomer(){
                var num = 0;
                var custList = document.getElementsByName("customer");
                var rowNum = 0;
                for (var i = 0; i < custList.length; i++){
                    if(custList[i].checked){
                        num = num + 1;
                        rowNum = i + 1;
                    }
                    if (num == 2){
                        alert("Only one customer can be deleted at one time!");
                        return false;
                    }
                }
                if (num == 0){
                    alert("Please at least check one customer!");
                    return false;
                }
                alert(rowNum + " row selected");
                window.location.href = "DeleteCustomer?rowNum="+rowNum;
            }
        </script>
    </head>
    <body align="left">
        <h2>Note: Due to page size, only some columns are listed</h2>
        <hr/>
        <table border="1" align="center">
            <%
                List<Customer> customers = (List) request.getAttribute("customerList");
                out.print("<tr>");
                out.print("<th>#</th>");
                out.print("<th>CustomId</th>");
                out.print("<th>DiscountDode</th>");
                out.print("<th>Zip</th>");
                out.print("<th>Name</th>");
                out.print("<th>City</th>");
                out.print("<th>State</th>");
                out.print("<th>Phone</th>");
                out.print("<th>Checkbox</th>");
                out.print("</tr>");
                for (int i = 0; i < customers.size(); i++) {
                    out.print("<tr>");
                    out.print("<td>");
                    out.print(i + 1);
                    out.print("</td>");
                    out.print("<td>");
                    out.print(customers.get(i).getCustomerId());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(customers.get(i).getDiscountCode());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(customers.get(i).getZip());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(customers.get(i).getName());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(customers.get(i).getCity());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(customers.get(i).getState());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(customers.get(i).getPhone());
                    out.print("</td>");
                    out.print("<td>");
                    out.print("<input type='checkbox' name='customer' value='' >");
                    out.print("</td>");
                    out.print("</tr>");
                }
                //out.close();
%>
        </table>
        <table align="center" border="1">
            <tr>
                <td><input type="button" value="Create Customer" onclick="createCustomer()"/></td>
                <td><input type="button" value="Update Customer" onclick="updateCustomer()"/></td>
                <td><input type="button" value="Delete Customer" onclick="deleteCustomer()"/></td>
            </tr>
        </table>
        <p><a href="ProductServlet">Click here to manipulate product table!</a></p>
    </body>
</html>
<%
    out.close();
%>