<%-- 
    Document   : user
    Created on : May 29, 2023, 4:44:12 PM
    Author     : Nguyen Thi Thuy Dung
--%>

<%@page import="model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <h1>User's information</h1>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if(loginUser == null||"AD".equals(loginUser.getRoleID())) {
//                loginUser = new UserDTO();
                response.sendRedirect("login.html");
                return;
            }
            %>
            UserID: <%= loginUser.getUserId() %></br>
            Full name<%= loginUser.getFullName()%></br>
            Role ID<%= loginUser.getRoleID()%></br>
            Password<%= loginUser.getPassword()%></br>
    </body>
</html>
