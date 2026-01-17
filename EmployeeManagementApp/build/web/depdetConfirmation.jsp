<%-- 
    Document   : epi
    Created on : 11 14, 23, 8:57:04 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.util.*, EMpackage.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="depdet" class= "EMpackage.depdet" scope="session" />
        <%
           String choice = request.getParameter("submit");
           if(choice.equals("Insert")){
            depdet.employeeID = request.getParameter("employeeID");
            depdet.DepartmentPosition = request.getParameter("position");
            depdet.WorkLocation = request.getParameter("work");
            depdet.EmployeeWorkSatisfactionRating = request.getParameter("satisfaction");
            boolean res = depdet.insertDep();
            if(res){
        %>
        <h1>Insert Successful!</h1>
        <%} else{
        %>  
        <h1>Insert Failed!</h1>
        <%}
        }else if(choice.equals("Update")){
            depdet.employeeID = request.getParameter("employeeID");
            depdet.DepartmentPosition = request.getParameter("position");
            depdet.WorkLocation = request.getParameter("work");
            depdet.EmployeeWorkSatisfactionRating = request.getParameter("satisfaction");
            boolean res = depdet.updateDep();
            if(res){
        %>
        <h1>Update Successful!</h1>
        <%} else{
        %>  
        <h1>Update Failed!%></h1>
        <%}
    }
        %>
        <a href="index.html"><button type="button">Return To Home Page</button></a>
    </body>
</html>
