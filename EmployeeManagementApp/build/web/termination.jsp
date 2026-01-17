<%-- 
    Document   : termination
    Created on : 11 14, 23, 3:15:52 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.util.*, java.sql.*, EMpackage.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="termination.css">
    <title>Document</title>
</head>
<body>
    <a href="index.html"><button type="button">Return To Home Page</button></a>
    <jsp:useBean id="A" class= "EMpackage.termination" scope="session" />
    <%
    if(!request.getParameter("submit").equals("Remove Employee") && !request.getParameter("submit").equals("view")){
        %><h1>Working Employees:</h1><br><%
        if(A.getEmployees() != null){
            ArrayList<String> result = A.getEmployees();
            if(result.size()>0){
                for(String i : result){
                    %><h2><%=i%></h2><br><%
                }
            }else{
    %>
    <h2>You fired them all :(</h2>
    <%}
    }
    %>
    
    <div id="pop-up">
        <form action="termination_employee.jsp">
            <h3>Enter Employee ID:</h3>
            <input class="stretch" id="employeeID" name="employeeID" type="text" placeholder="" required>
            <h3>Enter Position/Department: </h3>
            <input class="stretch" id="position" name="position" type="text" placeholder="" required>
            <h3>Update Employee End Date: </h3>
            <input type="date" id="birthday" name="birthday" required><br>
            <br>
            <br>
            <input id="submit" type="submit" value="Submit">
        </form>
    </div>
    <%}else{%>
        <div id="delete">
        <h1>Delete Employee</h1>
        <form action="termination_employee.jsp">
            Employee ID: <select class="select" name="employeeID" id="employeeID">
                <option value="None">--</option>
                <%
                    ArrayList<String> result = A.getEmployeeID();
                    for(String i : result){
                        %><option value="<%=i%>"><%=i%></option><%
                    }
                %>
                </select><br><br>
                <div id="details">
                <%
                    if(!request.getParameter("submit").equals("Remove Employee") && request.getParameter("submit").equals("view"))
                        if(!request.getParameter("employeeID").equals("None")){
                        A.employeeID = request.getParameter("employeeID");
                        String[][] details = A.getAllEmployeeDetails();
                        for(int i=0; i<14; i++){
                            %><%=details[i][0]%>: <%=details[i][1]%><br><%
                        }
                   }
                %>
                </div>
                <input id="submit" type="submit" name ="submit" value="delete">
                <input id="submit" type="submit" name ="submit" value="view" formaction="termination.jsp">
        </form>
    </div>
    <%}%>
</body>
</html>
