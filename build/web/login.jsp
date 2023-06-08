<%-- 
    Document   : login
    Created on : May 29, 2023, 4:40:58 PM
    Author     : Nguyen Thi Thuy Dung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <form action="MainController" method="POST">
            <h1>Login form</h1>
            Input your userID <input type="text" name="userID" required/></br>
            Input your password <input type="text" name="password" required/></br>
            <input type="submit" name="action" value="Login"/>
            <input type="reset" value="reset"/>
        </form>
        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <%= error %>
    </body>
</html>
