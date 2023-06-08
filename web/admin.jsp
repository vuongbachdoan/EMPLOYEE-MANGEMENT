<%-- 
    Document   : user
    Created on : May 29, 2023, 4:44:12 PM
    Author     : Nguyen Thi Thuy Dung
--%>

<%@page import="java.util.List"%>
<%@page import="model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <style>
            html {
                font-family: sans-serif;
            }
            .btn-dark {
                background: #303030;
                /*                background: rgb(63,94,251);
                                background: linear-gradient(90deg, rgba(63,94,251,1) 0%, rgba(252,70,107,1) 100%);*/
                padding: 7px 15px;
                color: white;
                border-radius: 3.5px;
                border: 0px;
                outline: none;
                font-weight: 500;
                font-size: 14px;
                cursor: pointer;
            }
            .input-field {
                padding: 7px 15px;
                border: 0px;
                background: #ccc;
                border-radius: 3.5px;
                color: #303030;
                margin-top: 15px;
                margin-bottom: 15px;
            }

            .heading {
                margin-bottom: 0px;
                /*                background: linear-gradient(to right, #f32170,
                                    #ff6b08, #cf23cf, #eedd44);
                                -webkit-text-fill-color: transparent;
                                -webkit-background-clip: text;*/
            }
            th {
                background: #303030;
                color: #fff;
                text-align: left;
            }
            td {
                background: #ccc;
            }
            .td-center {
                text-align: center;
            }
            th, td {
                padding: 5px 15px;
                border-radius: 3.5px;
            }
            .text-warning {
                color: red;
                font-size: 12px;
                margin-top: 15px;
            } 
            .td-delete {
                text-align: center;
            }
            .link-delete:active {
                color: #ccc;
            }
            .link-delete {
                color: #303030;
            }
            td input {
                width: 100%;
                height: 100%;
                background: transparent;
                outline: none;
                border: 0px;
                font-weight: bold;
            }
        </style>
    </head>

    <body>
        <h1 class="heading">Admin's world</h1>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || "US".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.html");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        Welcome <%= loginUser.getFullName()%></br>
        <form action="MainController">
            <input class="input-field" type="text" name="search" value="<%= search%>"/>          
            <input class="btn-dark" type="submit" name="action" value="Search"/>
        </form>
        <%
            List<UserDTO> listUser = (List<UserDTO>) request.getAttribute("LIST_USER");
            if (listUser != null) {
                if (listUser.size() > 0) {
        %>
        <table border="0">
            <thead>
                <tr>
                    <th>No</th>
                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>Role ID</th>
                    <th>Password</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (UserDTO user : listUser) {
                %>
            <form action="MainController">
                <tr>
                    <td class="td-center"><%= count++%></td>
                    <td><%= user.getUserId()%></td>
                    <td>
                        <input type="text" name="fullName" value="<%= user.getFullName()%>" required=""/>
                    </td>
                    <td>
                        <input type="text" name="roleID" value="<%= user.getRoleID()%>" required=""/>
                    </td>
                    <td class="td-center"><%= user.getPassword()%></td>
                    <td class="td-center">
                        <label>
                            <input style="display: none" type="submit" name="action" value="Update">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                            </svg> 
                        </label>
                        <input type="hidden" name="userID" value="<%= user.getUserId()%>"/>
                        <input type="hidden" name="search" value="<%= search%>"/>
                    </td>
                    <td class="td-delete td-center">
                        <a class="link-delete" href="MainController?search=<%=search%>&action=Delete&userID=<%=user.getUserId()%>">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                            <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                            </svg>
                        </a>
                    </td>
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>
    <%
        String error = (String) request.getAttribute("ERROR");
        if (error == null) {
            error = "";
        }
    %>
    <p class="text-warning"><%= error%></p>
    <%
            }
        }
    %>
</body>
</html>
