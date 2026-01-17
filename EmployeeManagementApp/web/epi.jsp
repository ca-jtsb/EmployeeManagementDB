<%-- 
    Document   : epi
    Created on : 11 14, 23, 10:01:42 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.util.*, EMpackage.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="epi.css">
    <title>Document</title>
</head>
    <body>
        <jsp:useBean id="eID" class= "EMpackage.epi" scope="session" />
        <%
           String choice = request.getParameter("submit");
           if(choice.equals("Hire Employee")){
        %>
        <div id="hire">
        <h1>Input New Employee Details</h1>
        <form action="epiConfirmation.jsp">
<!--            Employee ID: <input class="stretch" id="employeeID" name="employeeID" type="text" placeholder="" required><br>-->
            First Name: <input class="stretch" id="firstName" name="firstName" type="text" placeholder="" required><br>
            Last Name: <input class="stretch" id="lastName" name="lastName" type="text" placeholder="" required><br>
            <label for="birthday">Date of Birth:</label>
            <input type="date" id="birthday" name="birthday" required>
            <br>
            <div id="div_gender">
                <input type="radio" class="gender" name="gender" value="M" required>
                <label for="male">Male</label><br>
                <input type="radio" class="gender" name="gender" value="F" required>
                <label for="female">Female</label><br>
            </div>
            <br>
            <input id="submit" type="submit" name ="submit" value="Insert">
        </form>
    </div>
        
        <%}else if(choice.equals("Update Employee Details")){
        %>
        <%
        if(eID.getEmployeeID() != null){
            if(eID.getEmployeeID().isEmpty()){
        %>
        <h1>You fired Everyone :(</h1>
        <%}else{%>
        <div id="update">
        <h1>Update Employee Details</h1>
        <form action="epiConfirmation.jsp">
            Employee ID: <select class="select" name="employeeID" id="employeeID">
        <% 
            ArrayList<String> result = eID.getEmployeeID();
                for(String i : result){
                    %><option value="<%=i%>"><%=i%></option><%
                }
        %>
              </select><br>
            First Name: <input class="stretch" id="firstName" name="firstName" type="text" placeholder="" required><br>
            Last Name: <input class="stretch" id="lastName" name="lastName" type="text" placeholder="" required><br>
            <label for="birthday">Date of Birth:</label>
            <input type="date" id="birthday" name="birthday" required>
            <br>
            <div id="div_gender">
                <input type="radio" class="gender" name="gender" value="M" required>
                <label for="male">Male</label><br>
                <input type="radio" class="gender" name="gender" value="F" required>
                <label for="female">Female</label><br>
            </div>
            <br>
            <input id="submit" type="submit" name ="submit" value="Update">
        </form>
    </div>
        <%}
        }else{
        %><h1>getEmployeeID() null</h1><%
        }
        }else if(choice.equals("View Employee") || choice.equals("View")){
        %>
        <div id="view">
        <h1>View Employee Details</h1>
        <form action="epi.jsp">
            Employee ID: <select class="select" name="employeeID" id="employeeID">
                <option value="None">--</option>
                <%
                    ArrayList<String> result = eID.getEmployeeID();
                    for(String i : result){
                        %><option value="<%=i%>"><%=i%></option><%
                    }
                %>
                </select><br><br>
                <div id="details">
                <%
                    if(!request.getParameter("submit").equals("View Employee"))
                        if(!request.getParameter("employeeID").equals("None")){
                        eID.employeeID = request.getParameter("employeeID");
                        ArrayList<String> details = eID.getSingleEmployee();
                        %>First Name: <%=details.get(0)%><br><%
                        %>Last Name: <%=details.get(1)%><br><%
                        %>Birthday: <%=details.get(2)%><br><%
                        %>Gender: <%=details.get(3)%><%
                    }
                %>
                </div>
                <input id="submit" type="submit" name ="submit" value="View">
        </form>
    </div>
    <%}
    %>
    <a href="index.html"><button type="button">Return To Home Page</button></a>
    </body>
</html>
