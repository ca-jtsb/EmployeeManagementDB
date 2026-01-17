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
public class paq {
    
    public String employeeID;
    public String YearsOfExperience;
    public String EmployeePerformanceRating;
    public String TrainingStatus;
    
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

            PreparedStatement pstmt = conn.prepareStatement("SELECT EmployeeMainID FROM EmployeePersonalInformation WHERE EmployeeMainID NOT IN(SELECT EmployeeID FROM PerformanceAndQualifications)");
            
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
    
    public boolean updateQuali(){
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/businessmanagement?user=root&password=12345678");
            System.out.println("Connection Successful");

            PreparedStatement pstmt = conn.prepareStatement("UPDATE PerformanceAndQualifications"
                                                          + " SET YearsOfExperience = ?, EmployeePerformanceRating = ?, TrainingStatus = ?"
                                                          + " WHERE EmployeeID = ?");
            
            pstmt.setInt(1, Integer.parseInt(YearsOfExperience));
            pstmt.setString(2, EmployeePerformanceRating);
            pstmt.setBoolean(3, TrainingStatus.equals("True"));
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
    
    public boolean insertQuali(){
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/businessmanagement?user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO PerformanceAndQualifications(EmployeeID, YearsOfExperience, EmployeePerformanceRating, TrainingStatus)"
                                                          + " VALUES(?, ?, ?, ?)");
            
            pstmt.setInt(1, Integer.parseInt(employeeID));
            pstmt.setInt(2, Integer.parseInt(YearsOfExperience));
            pstmt.setString(3, EmployeePerformanceRating);
            pstmt.setBoolean(4, TrainingStatus.equals("True"));
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
                                                          + " FROM PerformanceAndQualifications"
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
                                                          + " FROM PerformanceAndQualifications");
            
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
        paq a = new paq();
        a.employeeID = "1";
        a.YearsOfExperience = "12";
        a.EmployeePerformanceRating = "1";
        a.TrainingStatus = "True";
        a.insertQuali();
    }
}
