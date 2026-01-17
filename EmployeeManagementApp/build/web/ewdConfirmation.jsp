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
        <jsp:useBean id="ewd" class= "EMpackage.ewd" scope="session" />
        <%
           String choice = request.getParameter("submit");
           if(choice.equals("Insert")){
            ewd.employeeID = request.getParameter("employeeID");
            ewd.shiftschedule = request.getParameter("shiftschedule");
            ewd.HireDate = request.getParameter("hiredate");
            ewd.CustomersAccomodated = request.getParameter("customAccom");
            boolean res = ewd.insertWorkDetail();
            if(res){
        %>
        <h1>Insert Successful!</h1>
        <%} else{
        %>  
        <h1>Insert Failed!</h1>
        <%}
        }else if(choice.equals("Update")){
            ewd.employeeID = request.getParameter("employeeID");
            ewd.shiftschedule = request.getParameter("shiftschedule");
            ewd.HireDate = request.getParameter("hiredate");
            ewd.CustomersAccomodated = request.getParameter("customAccom");
            boolean res = ewd.updateEmployee();
            if(res){
        %>
        <h1>Update Successful!</h1>
        <%} else{
        %>  
        <h1>Update Failed!</h1>
        <%}
    }
        %>
        <a href="index.html"><button type="button">Return To Home Page</button></a>
    </body>
</html>
