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
    <link rel="stylesheet" href="smallerDiv.css">
    <title>Document</title>
</head>
    <body>
        <jsp:useBean id="paq" class= "EMpackage.paq" scope="session" />
        <%
           String choice = request.getParameter("submit");
           if(choice.equals("Add Qualification")){
        %>
        <div id="hire">
        <h1>Input New Qualification</h1>
        <form action="paqConfirmation.jsp">
            Employee ID: <select class="select" name="employeeID" id="employeeID">
            <% 
                ArrayList<String> result = paq.getEmployeeIDFromMain();
                    for(String i : result){
                        %><option value="<%=i%>"><%=i%></option><%
                    }
            %>
            </select><br>
            Years Of Experience: <input class="stretch" id="experience" name="experience" type="text" placeholder="" required><br>
            Employee Performance Rating:
            <div id="div_gender">
                <input type="radio" class="gender" name="rating" value="1" required>
                <label for="rating">1</label>
                <input type="radio" class="gender" name="rating" value="2" required>
                <label for="rating">2</label>
                <input type="radio" class="gender" name="rating" value="3" required>
                <label for="rating">3</label>
                <input type="radio" class="gender" name="rating" value="4" required>
                <label for="rating">4</label>
                <input type="radio" class="gender" name="rating" value="5" required>
                <label for="rating">5</label><br>
            </div>
                
            Training Status: 
            <div id="div_gender">
                <input type="radio" class="gender" name="trained" value="True" required>
                <label for="trained">True</label>
                <input type="radio" class="gender" name="trained" value="False" required>
                <label for="trained">False</label><br>
            </div>
            <input id="submit" type="submit" name ="submit" value="Insert">
        </form>
    </div>
        
        <%}else if(choice.equals("Update Qualification")){
        if(paq.getEmployeeID() != null){
            if(paq.getEmployeeID().isEmpty()){
        %>
        <h1>You fired Everyone :(</h1>
        <%}else{%>
        <div id="update">
        <h1>Update Employee Qualification</h1>
        <form action="paqConfirmation.jsp">
            Employee ID: <select class="select" name="employeeID" id="employeeID">
        <% 
            ArrayList<String> result = paq.getEmployeeID();
                for(String i : result){
                    %><option value="<%=i%>"><%=i%></option><%
                }
        %>
              </select><br>
            Years Of Experience: <input class="stretch" id="experience" name="experience" type="text" placeholder="" required><br>
            Employee Performance Rating:
            <div id="div_gender">
                <input type="radio" class="gender" name="rating" value="1" required>
                <label for="rating">1</label>
                <input type="radio" class="gender" name="rating" value="2" required>
                <label for="rating">2</label>
                <input type="radio" class="gender" name="rating" value="3" required>
                <label for="rating">3</label>
                <input type="radio" class="gender" name="rating" value="4" required>
                <label for="rating">4</label>
                <input type="radio" class="gender" name="rating" value="5" required>
                <label for="rating">5</label><br>
            </div>
                
            Training Status: 
            <div id="div_gender">
            <br>
                <input type="radio" class="gender" name="trained" value="True" required>
                <label for="trained">True</label>
                <input type="radio" class="gender" name="trained" value="False" required>
                <label for="trained">False</label><br>
            </div>
            <input id="submit" type="submit" name ="submit" value="Update">
        </form>
    </div>
        <%}
        }else{
        %><h1>getEmployeeID() null</h1><%
        }
        }else if(choice.equals("View Qualification") || choice.equals("View")){
        %>
        <div id="view">
        <h1>View Employee Qualification</h1>
        <form action="paq.jsp">
            Employee ID: <select class="select" name="employeeID" id="employeeID">
                <option value="None">--</option>
                <%
                    ArrayList<String> result = paq.getEmployeeID();
                    for(String i : result){
                        %><option value="<%=i%>"><%=i%></option><%
                    }
                %>
                </select><br><br>
                <div id="details">
                <%
                    if(!request.getParameter("submit").equals("View Qualification"))
                        if(!request.getParameter("employeeID").equals("None")){
                        paq.employeeID = request.getParameter("employeeID");
                        ArrayList<String> details = paq.getSingleEmployee();
                        %>Years Of Experience: <%=details.get(0)%><br><%
                        %>Employee Performance Rating: <%=details.get(1)%><br><%
                        %>Training Status: <%=details.get(2)%><br><%
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
