<%-- 
    Document   : termination_employee
    Created on : 11 12, 23, 5:14:53 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.util.*, EMpackage.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Termination Processing</title>
    </head>
    <body>
        <jsp:useBean id="fire" class= "EMpackage.termination" scope="session" />
        <%
            if(request.getParameter("submit").equals("delete")){
                String v_employeeID = request.getParameter("employeeID");
                fire.employeeID = v_employeeID;
                boolean res = fire.deleteEmployee();
                if(res){
        %>
        <h1>Deletion Successful!</h1>
        <%} else{
        %>  
        <h1>Deletion Failed!</h1>
        <%}
            }
            else{
            String v_employeeID = request.getParameter("employeeID");
            String v_endDate = request.getParameter("birthday");
            fire.employeeID = v_employeeID;
            fire.endDate = v_endDate;
            boolean res = fire.terminateEmployee();
            if(res){
        %>
        <h1>Termination Successful!</h1>
        <%} else{
        %>  
        <h1>Termination Failed!</h1>
        <%}
        }
        %>
        <br>
        <a href="index.html"><button type="button">Return To Home Page</button></a>
    </body>
</html>
