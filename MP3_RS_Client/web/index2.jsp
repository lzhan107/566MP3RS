<%-- 
    Document   : index2
    Created on : Apr 13, 2013, 9:30:46 PM
    Author     : Lei
--%>

<%@page import="entity.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script type="text/javascript">
        function createProduct(){
            var prodList = document.getElementsByName("product");
            for (var i = 0; i < prodList.length; i++){
                if(prodList[i].checked){
                    alert("Please do not check any product for CREATE!");
                    return false;
                }
            }
            window.location.href = "create2.jsp";
        }
        function updateProduct(){
            var num = 0;
            var prodList = document.getElementsByName("product");
            var rowNum = 0;
            for (var i = 0; i < prodList.length; i++){
                if(prodList[i].checked){
                    num = num + 1;
                    rowNum = i + 1;
                }
                if (num == 2){
                    alert("Only one product can be checked for UPDATE!");
                    return false;
                }
            }
            if (num == 0){
                alert("Please at least check one product!");
                return false;
            }
            alert(rowNum + " row selected");
            window.location.href = "RetrieveProduct?rowNum="+rowNum;
        }
        function deleteProduct(){
            var num = 0;
            var prodList = document.getElementsByName("product");
            var rowNum = 0;
            for (var i = 0; i < prodList.length; i++){
                if(prodList[i].checked){
                    num = num + 1;
                    rowNum = i + 1;
                }
                if (num == 2){
                    alert("Only one product can be deleted at one time!");
                    return false;
                }
            }
            if (num == 0){
                alert("Please at least check one product!");
                return false;
            }
            alert(rowNum + " row selected");
            window.location.href = "DeleteProduct?rowNum="+rowNum;
        }
    </script>
    <body>
        <h2>Note: Due to page size, only some columns are listed</h2>
        <hr/>
        <table border="1" align="center">
            <%
                List<Product> products = (List) request.getAttribute("productList");
                out.print("<tr>");
                out.print("<th>#</th>");
                out.print("<th>Product_id</th>");
                out.print("<th>Manufacturer_id</th>");
                out.print("<th>Product_code</th>");
                out.print("<th>Purchase_cost</th>");
                out.print("<th>Quantity_on_hand</th>");
                out.print("<th>Markup</th>");
                out.print("<th>Available</th>");
                out.print("<th>Description</th>");
                out.print("<th>Checkbox</th>");
                out.print("</tr>");
                for (int i = 0; i < products.size(); i++) {
                    out.print("<tr>");
                    out.print("<td>");
                    out.print(i + 1);
                    out.print("</td>");
                    out.print("<td>");
                    out.print(products.get(i).getProductId());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(products.get(i).getManufacturerId());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(products.get(i).getProductCode());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(products.get(i).getPurchaseCost());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(products.get(i).getQuantityOnHand());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(products.get(i).getMarkup());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(products.get(i).getAvailable());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(products.get(i).getDescription());
                    out.print("</td>");
                    out.print("<td>");
                    out.print("<input type='checkbox' name='product' value='' >");
                    out.print("</td>");
                    out.print("</tr>");
                }
            %>
        </table>
        <table align="center" border="1">
            <tr>
                <td><input type="button" value="Create Product" onclick="createProduct()"/></td>
                <td><input type="button" value="Update Product" onclick="updateProduct()"/></td>
                <td><input type="button" value="Delete Product" onclick="deleteProduct()"/></td>
            </tr>
        </table>
    </body>
</html>
