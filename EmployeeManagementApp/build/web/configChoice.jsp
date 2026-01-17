<%-- 
    Document   : configChoice
    Created on : 11 14, 23, 9:26:25 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.util.*, EMpackage.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="configChoice.css">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           String choice = request.getParameter("submit");
           if(choice.equals("Employee Personal Information")){
        %>
        <div>
        <form action="epi.jsp">
            <input id="submit" type="submit" value="Hire Employee" name="submit">
            <input id="submit" type="submit" value="View Employee" name="submit">
            <input id="submit" type="submit" value="Update Employee Details" name="submit">
            <input id="submit" type="submit" value="Filter Employee" name="submit">
        </form>
        </div>
        <%}else if(choice.equals("Employee Work Details")){
        %>
        <div>
        <form action="ewd.jsp">
            <input id="submit" type="submit" value="Add Work Detail" name="submit">
            <input id="submit" type="submit" value="View Work Detail" name="submit">
            <input id="submit" type="submit" value="Update Work Details" name="submit">
            <input id="submit" type="submit" value="Filter Employee" name="submit">
        </form>
        </div>
        <%}else if(choice.equals("Performance And Qualifications")){
        %>
        <div>
        <form action="paq.jsp">
            <input id="submit" type="submit" value="Add Qualification" name="submit">
            <input id="submit" type="submit" value="View Qualification" name="submit">
            <input id="submit" type="submit" value="Update Qualification" name="submit">
            <input id="submit" type="submit" value="Filter Employee" name="submit">
        </form>
        </div>
        <%}else if(choice.equals("Department Details")){
        %>
        <div>
        <form action="depdet.jsp">
            <input id="submit" type="submit" value="Add Department" name="submit">
            <input id="submit" type="submit" value="View Department" name="submit">
            <input id="submit" type="submit" value="Update Department" name="submit">
            <input id="submit" type="submit" value="Filter Employee" name="submit">
        </form>
        </div>
        <%}
        %>
        <a href="index.html"><button type="button">Return To Home Page</button></a>
    </body>
</html>
