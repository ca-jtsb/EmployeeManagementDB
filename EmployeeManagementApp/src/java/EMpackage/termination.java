package EMpackage;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ccslearner
 */
import java.sql.*;
import java.util.*;

public class termination{

    public String employeeID;
    public String position;
    public String endDate;
    
    public boolean deleteEmployee(){
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/businessmanagement?user=root&password=12345678");
            System.out.println("Connection Successful");

            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM DepartmentDetails WHERE EmployeeID = ?");
            pstmt.setInt(1, Integer.parseInt(employeeID));
            ResultSet rst = pstmt.executeQuery();
            if(rst.next()){
                pstmt = conn.prepareStatement("DELETE FROM DepartmentDetails WHERE EmployeeID = ?");
                pstmt.setInt(1, Integer.parseInt(employeeID));
                pstmt.executeUpdate();
            }
            
            pstmt = conn.prepareStatement("SELECT * FROM PerformanceAndQualifications WHERE EmployeeID = ?");
            pstmt.setInt(1, Integer.parseInt(employeeID));
            rst = pstmt.executeQuery();
            if(rst.next()){
                pstmt = conn.prepareStatement("DELETE FROM PerformanceAndQualifications WHERE EmployeeID = ?");
                pstmt.setInt(1, Integer.parseInt(employeeID));
                pstmt.executeUpdate();
            }
            
            pstmt = conn.prepareStatement("SELECT * FROM EmployeeWorkDetails WHERE EmployeeID = ?");
            pstmt.setInt(1, Integer.parseInt(employeeID));
            rst = pstmt.executeQuery();
            if(rst.next()){
                pstmt = conn.prepareStatement("DELETE FROM EmployeeWorkDetails WHERE EmployeeID = ?");
                pstmt.setInt(1, Integer.parseInt(employeeID));
                pstmt.executeUpdate();
            }
            
            pstmt = conn.prepareStatement("DELETE FROM EmployeePersonalInformation WHERE EmployeeMainID = ?");
            pstmt.setInt(1, Integer.parseInt(employeeID));
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            System.out.println("Success!");
            return true;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
    
    public String[][] getAllEmployeeDetails(){
        try {
            String[][] results = new String[14][2];
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/businessmanagement?user=root&password=12345678");
            System.out.println("Connection Successful");
//
//            PreparedStatement pstmt = conn.prepareStatement("SELECT epi.EmployeeMainID"
//                                                          + " FROM EmployeePersonalInformation epi"
//                                                          + " LEFT JOIN EmployeeWorkDetails ewd"
//                                                          + " ON ewd.EmployeeID = epi.EmployeeMainID"
//                                                          + " WHERE ewd.EndDate IS NULL");
//
            PreparedStatement pstmt = conn.prepareStatement("SELECT FirstName, LastName, DateOfBirth, Gender, ShiftSchedule, HireDate, EndDate, CustomersAccomodated, YearsOfExperience, EmployeePerformanceRating, TrainingStatus, DepartmentPosition, WorkLocation, EmployeeWorkSatisfactionRating FROM EmployeePersonalInformation epi LEFT JOIN EmployeeWorkDetails ewd on ewd.EmployeeID = epi.EmployeeMainID LEFT JOIN PerformanceAndQualifications paq ON ewd.EmployeeID = paq.EmployeeID LEFT JOIN DepartmentDetails dd ON paq.EmployeeID = dd.EmployeeID WHERE epi.EmployeeMainID = ?");
            pstmt.setInt(1, Integer.parseInt(employeeID));
            ResultSet rst = pstmt.executeQuery();
            ResultSetMetaData rsmd = rst.getMetaData();
            while(rst.next()){
                for(int i=1; i<=14; i++){
                    results[i-1][0] = rsmd.getColumnName(i);
                    results[i-1][1] = rst.getString(i);
                }
            }
            pstmt.close();
            conn.close();
            System.out.println("Success!");
            return results;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    public ArrayList<String> getEmployeeID(){
        ArrayList<String> results = new ArrayList<String>();
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/businessmanagement?user=root&password=12345678");
            System.out.println("Connection Successful");

//            PreparedStatement pstmt = conn.prepareStatement("SELECT epi.EmployeeMainID"
//                                                          + " FROM EmployeePersonalInformation epi"
//                                                          + " LEFT JOIN EmployeeWorkDetails ewd"
//                                                          + " ON ewd.EmployeeID = epi.EmployeeMainID"
//                                                          + " WHERE ewd.EndDate IS NULL");

            PreparedStatement pstmt = conn.prepareStatement("SELECT EmployeeMainID"
                                                          + " FROM EmployeePersonalInformation");
            
            ResultSet rst = pstmt.executeQuery();
            while(rst.next()){
                results.add(rst.getString(1));
            }
            pstmt.close();
            conn.close();
            System.out.println("Success!");
            return results;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    
    public ArrayList<String> getEmployees(){
        ArrayList<String> results = new ArrayList<String>();
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/businessmanagement?user=root&password=12345678");
            System.out.println("Connection Successful");

            PreparedStatement pstmt = conn.prepareStatement("SELECT epi.EmployeeMainID, epi.FirstName, epi.LastName"
                                                         + " FROM EmployeeWorkDetails ewd"
                                                         + " JOIN EmployeePersonalInformation epi"
                                                         + " ON ewd.EmployeeID = epi.EmployeeMainID"
                                                         + " WHERE ewd.EndDate IS NULL");
            ResultSet rst = pstmt.executeQuery();
            String str;
            while(rst.next()){
                str = String.format("Employee ID: %s First Name: %s Last Name: %s", rst.getString(1), rst.getString(2), rst.getString(3));
                results.add(str);
            }
            pstmt.close();
            conn.close();
            System.out.println("Success!");
            return results;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public boolean terminateEmployee(){

        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/businessmanagement?user=root&password=12345678");
            System.out.println("Connection Successful");

            PreparedStatement pstmt = conn.prepareStatement("UPDATE EmployeeWorkDetails SET EndDate = ? WHERE EmployeeID = ?");
            pstmt.setString(1, endDate);
            pstmt.setInt(2, Integer.parseInt(employeeID));
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            System.out.println("Success!");
            return true;

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public static void main(String args[]){
        termination a = new termination();
        a.employeeID = "1";
        a.deleteEmployee();
//        ArrayList<ArrayList<String>> details = a.getAllEmployeeDetails();
//        for(int i=0; i<14; i++)
//            System.out.println(details.get(i).get(0) + ": " + details.get(i).get(1));
    }
}
