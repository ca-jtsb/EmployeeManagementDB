/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EMpackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author ccslearner
 */
public class depdet {
    
    public String employeeID;
    public String DepartmentPosition;
    public String WorkLocation;
    public String EmployeeWorkSatisfactionRating;
    
    public ArrayList<String> getEmployeeIDFromMain(){
        ArrayList<String> results = new ArrayList<String>();
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/businessmanagement?user=root&password=12345678");
            System.out.println("Connection Successful");

//            PreparedStatement pstmt = conn.prepareStatement("SELECT epi.EmployeeMainID"
//                                                          + " FROM EmployeePersonalInformation epi"
//                                                          + " LEFT JOIN EmployeeWorkDetails ewd"
//                                                          + " ON ewd.EmployeeID = epi.EmployeeMainID"
//                                                          + " WHERE ewd.EndDate IS NULL");

            PreparedStatement pstmt = conn.prepareStatement("SELECT EmployeeMainID FROM EmployeePersonalInformation WHERE EmployeeMainID NOT IN(SELECT EmployeeID FROM DepartmentDetails)");
            
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
    
    public boolean updateDep(){
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/businessmanagement?user=root&password=12345678");
            System.out.println("Connection Successful");

            PreparedStatement pstmt = conn.prepareStatement("UPDATE DepartmentDetails"
                                                          + " SET DepartmentPosition = ?, WorkLocation = ?, EmployeeWorkSatisfactionRating = ?"
                                                          + " WHERE EmployeeID = ?");
            
            pstmt.setString(1, DepartmentPosition);
            pstmt.setString(2, WorkLocation);
            pstmt.setString(3, EmployeeWorkSatisfactionRating);
            pstmt.setInt(4, Integer.parseInt(employeeID));
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
    
    public boolean insertDep(){
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/businessmanagement?user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO DepartmentDetails(EmployeeID, DepartmentPosition, WorkLocation, EmployeeWorkSatisfactionRating)"
                                                          + " VALUES(?, ?, ?, ?)");
            
            pstmt.setInt(1, Integer.parseInt(employeeID));
            pstmt.setString(2, DepartmentPosition);
            pstmt.setString(3, WorkLocation);
            pstmt.setString(4, EmployeeWorkSatisfactionRating);
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
    
    public ArrayList<String> getSingleEmployee(){
        ArrayList<String> results = new ArrayList<String>();
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/businessmanagement?user=root&password=12345678");
            System.out.println("Connection Successful");

            PreparedStatement pstmt = conn.prepareStatement("SELECT *"
                                                          + " FROM DepartmentDetails"
                                                          + " WHERE EmployeeID = ?");
            
            pstmt.setInt(1, Integer.parseInt(employeeID));
            ResultSet rst = pstmt.executeQuery();
            while(rst.next()){
                for(int i=2; i<5; i++)
                    results.add(rst.getString(i));
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

            PreparedStatement pstmt = conn.prepareStatement("SELECT EmployeeID"
                                                          + " FROM DepartmentDetails");
            
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
    
    public static void main(String args[]){
        depdet a = new depdet();
        a.employeeID = "1";
        a.insertDep();
    }
}
