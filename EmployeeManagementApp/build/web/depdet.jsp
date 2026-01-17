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
        <a href="index.html"><button type="button">Return To Home Page</button></a>
        <jsp:useBean id="depdet" class= "EMpackage.depdet" scope="session" />
        <%
           String choice = request.getParameter("submit");
           if(choice.equals("Add Department")){
        %>
        <div id="hire">
        <h1>Input New Department</h1>
        <form action="depdetConfirmation.jsp">
            Employee ID: <select class="select" name="employeeID" id="employeeID">
        <% 
            ArrayList<String> result = depdet.getEmployeeIDFromMain();
                for(String i : result){
                    %><option value="<%=i%>"><%=i%></option><%
                }
        %>
              </select><br>
            Work Location: <input class="stretch" id="work" name="work" type="text" placeholder="" required><br>
            Department Position:
            <div id="div_gender">
                <input type="radio" class="gender" name="position" value="IT" required>
                <label for="position">IT</label>
                <input type="radio" class="gender" name="position" value="Sales" required>
                <label for="position">Sales</label>
                <input type="radio" class="gender" name="position" value="Developer" required>
                <label for="position">Developer</label>
                <input type="radio" class="gender" name="position" value="Admin" required>
                <label for="position">Admin</label>
                <input type="radio" class="gender" name="position" value="Scientist" required>
                <label for="position">Scientist</label><br>
            </div>
                
            Employee Work Satisfaction Rating: 
            <div id="div_gender">
                <input type="radio" class="gender" name="satisfaction" value="1" required>
                <label for="satisfaction">1</label>
                <input type="radio" class="gender" name="satisfaction" value="2" required>
                <label for="satisfaction">2</label>
                <input type="radio" class="gender" name="satisfaction" value="3" required>
                <label for="satisfaction">3</label>
                <input type="radio" class="gender" name="satisfaction" value="4" required>
                <label for="satisfaction">4</label>
                <input type="radio" class="gender" name="satisfaction" value="5" required>
                <label for="satisfaction">5</label><br>
            </div>
            <input id="submit" type="submit" name ="submit" value="Insert">
        </form>
    </div>
        
        <%}else if(choice.equals("Update Department")){
        if(depdet.getEmployeeID() != null){
            if(depdet.getEmployeeID().isEmpty()){
        %>
        <h1>You fired Everyone :(</h1>
        <%}else{%>
        <div id="update">
        <h1>Update Employee Department</h1>
        <form action="depdetConfirmation.jsp">
            Employee ID: <select class="select" name="employeeID" id="employeeID">
        <% 
            ArrayList<String> result = depdet.getEmployeeID();
                for(String i : result){
                    %><option value="<%=i%>"><%=i%></option><%
                }
        %>
              </select><br>
            Work Location: <input class="stretch" id="work" name="work" type="text" placeholder="" required><br>
            Department Position:
            <div id="div_gender">
                <input type="radio" class="gender" name="position" value="IT" required>
                <label for="position">IT</label>
                <input type="radio" class="gender" name="position" value="Sales" required>
                <label for="position">Sales</label>
                <input type="radio" class="gender" name="position" value="Developer" required>
                <label for="position">Developer</label>
                <input type="radio" class="gender" name="position" value="Admin" required>
                <label for="position">Admin</label>
                <input type="radio" class="gender" name="position" value="Scientist" required>
                <label for="position">Scientist</label><br>
            </div>
                
            Employee Work Satisfaction Rating: 
            <div id="div_gender">
                <input type="radio" class="gender" name="satisfaction" value="1" required>
                <label for="satisfaction">1</label>
                <input type="radio" class="gender" name="satisfaction" value="2" required>
                <label for="satisfaction">2</label>
                <input type="radio" class="gender" name="satisfaction" value="3" required>
                <label for="satisfaction">3</label>
                <input type="radio" class="gender" name="satisfaction" value="4" required>
                <label for="satisfaction">4</label>
                <input type="radio" class="gender" name="satisfaction" value="5" required>
                <label for="satisfaction">5</label><br>
            </div>
            <input id="submit" type="submit" name ="submit" value="Update">
        </form>
    </div>
        <%}
        }else{
        %><h1>getEmployeeID() null</h1><%
        }
        }else if(choice.equals("View Department") || choice.equals("View")){
        %>
        <div id="view">
        <h1>View Employee Department</h1>
        <form action="depdet.jsp">
            Employee ID: <select class="select" name="employeeID" id="employeeID">
                <option value="None">--</option>
                <%
                    ArrayList<String> result = depdet.getEmployeeID();
                    for(String i : result){
                        %><option value="<%=i%>"><%=i%></option><%
                    }
                %>
                </select><br><br>
                <div id="details">
                <%
                    if(!request.getParameter("submit").equals("View Department"))
                        if(!request.getParameter("employeeID").equals("None")){
                        depdet.employeeID = request.getParameter("employeeID");
                        ArrayList<String> details = depdet.getSingleEmployee();
                        %>Department Position: <%=details.get(0)%><br><%
                        %>Work Location: <%=details.get(1)%><br><%
                        %>Employee Work Satisfaction Rating: <%=details.get(2)%><br><%
                    }
                %>
                </div>
                <input id="submit" type="submit" name ="submit" value="View">
        </form>
    </div>
    <%}
    %>
    </body>
</html>
