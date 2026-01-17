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
        <jsp:useBean id="epiID" class= "EMpackage.epi" scope="session" />
        <%
           String choice = request.getParameter("submit");
           if(choice.equals("Insert")){
            String v_employeeID = request.getParameter("employeeID");
            String fName = request.getParameter("firstName");
            String lName = request.getParameter("lastName");
            String v_birthday = request.getParameter("birthday");
            String v_gender = request.getParameter("gender");
            epiID.employeeID = v_employeeID;
            epiID.firstName = fName;
            epiID.lastName = lName;
            epiID.birthday = v_birthday;
            epiID.gender = v_gender;
            boolean res = epiID.hireEmployee();
            if(res){
        %>
        <h1>Hire Successful!</h1>
        <%} else{
        %>  
        <h1>Hire Failed!</h1>
        <%}
        }else if(choice.equals("Update")){
            String v_employeeID = request.getParameter("employeeID");
            String fName = request.getParameter("firstName");
            String lName = request.getParameter("lastName");
            String v_birthday = request.getParameter("birthday");
            String v_gender = request.getParameter("gender");
            epiID.employeeID = v_employeeID;
            epiID.firstName = fName;
            epiID.lastName = lName;
            epiID.birthday = v_birthday;
            epiID.gender = v_gender;
            boolean res = epiID.updateEmployee();
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
