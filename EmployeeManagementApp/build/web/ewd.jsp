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
        <jsp:useBean id="ewd" class= "EMpackage.ewd" scope="session" />
        <%
           String choice = request.getParameter("submit");
           if(choice.equals("Add Work Detail")){
        %>
        <div id="hire">
        <h1>Input New Work Details</h1>
        <form action="ewdConfirmation.jsp">
            Employee ID: <input class="stretch" id="employeeID" name="employeeID" type="text" placeholder="" required><br>
            Shift Schedule: <input class="stretch" id="shiftschedule" name="shiftschedule" type="text" placeholder="" required><br>
            <label for="hiredate">Hire Date:</label>
            <input type="date" id="hiredate" name="hiredate" required>
            Customers Accomodated: <input class="stretch" id="customAccom" name="customAccom" type="text" placeholder="" required><br>
            <br>
            <input id="submit" type="submit" name ="submit" value="Insert">
        </form>
    </div>
        
        <%}else if(choice.equals("Update Work Details")){
        if(ewd.getEmployeeID() != null){
            if(ewd.getEmployeeID().isEmpty()){
        %>
        <h1>You fired Everyone :(</h1>
        <%}else{%>
        <div id="update">
        <h1>Update Employee Work Details</h1>
        <form action="ewdConfirmation.jsp">
            Employee ID: <select class="select" name="employeeID" id="employeeID">
        <% 
            ArrayList<String> result = ewd.getEmployeeID();
                for(String i : result){
                    %><option value="<%=i%>"><%=i%></option><%
                }
        %>
              </select><br>
            Shift Schedule: <input class="stretch" id="shiftschedule" name="shiftschedule" type="text" placeholder="" required><br>
            <label for="hiredate">Hire Date:</label>
            <input type="date" id="hiredate" name="hiredate" required>
            Customers Accomodated: <input class="stretch" id="customAccom" name="customAccom" type="text" placeholder="" required><br>
            <br>
            <input id="submit" type="submit" name ="submit" value="Update">
        </form>
    </div>
        <%}
        }else{
        %><h1>getEmployeeID() null</h1><%
        }
        }else if(choice.equals("View Work Detail") || choice.equals("View")){
        %>
        <div id="view">
        <h1>View Employee Work Details</h1>
        <form action="ewd.jsp">
            Employee ID: <select class="select" name="employeeID" id="employeeID">
                <option value="None">--</option>
                <%
                    ArrayList<String> result = ewd.getEmployeeID();
                    for(String i : result){
                        %><option value="<%=i%>"><%=i%></option><%
                    }
                %>
                </select><br><br>
                <div id="details">
                <%
                    if(!request.getParameter("submit").equals("View Work Detail"))
                        if(!request.getParameter("employeeID").equals("None")){
                        ewd.employeeID = request.getParameter("employeeID");
                        ArrayList<String> details = ewd.getSingleEmployee();
                        %>Shift Schedule: <%=details.get(0)%><br><%
                        %>Hire Date: <%=details.get(1)%><br><%
                        %>End Date: <%=details.get(2)%><br><%
                        %>Customers Accomodated: <%=details.get(3)%><%
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
