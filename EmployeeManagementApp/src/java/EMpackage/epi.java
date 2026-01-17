package EMpackage;

import java.sql.*;

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
import java.util.ArrayList;
public class epi {
    public String employeeID;
    public String firstName;
    public String lastName;
    public String birthday;
    public String gender;
    
    public ArrayList<String> getSingleEmployee(){
        ArrayList<String> results = new ArrayList<String>();
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/businessmanagement?user=root&password=12345678");
            System.out.println("Connection Successful");

            PreparedStatement pstmt = conn.prepareStatement("SELECT *"
                                                          + " FROM EmployeePersonalInformation"
                                                          + " WHERE EmployeeMainID = ?");
            
            pstmt.setInt(1, Integer.parseInt(employeeID));
            ResultSet rst = pstmt.executeQuery();
            while(rst.next()){
                for(int i=2; i<=5; i++)
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
    
    public boolean updateEmployee(){
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/businessmanagement?user=root&password=12345678");
            System.out.println("Connection Successful");

            PreparedStatement pstmt = conn.prepareStatement("UPDATE EmployeePersonalInformation"
                                                          + " SET FirstName = ?, LastName = ?, DateOfBirth = ?, Gender = ?"
                                                          + " WHERE EmployeeMainID = ?");
            
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, birthday);
            pstmt.setString(4, gender);
            pstmt.setInt(5, Integer.parseInt(employeeID));
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
    
    public boolean hireEmployee(){
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/businessmanagement?user=root&password=12345678");
            System.out.println("Connection Successful");

            PreparedStatement temp = conn.prepareStatement("SELECT IFNULL(MAX(EmployeeMainID),0) + 1 FROM EmployeePersonalInformation");
            ResultSet rst = temp.executeQuery();
            if(rst.next())
                employeeID = rst.getString(1);
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO EmployeePersonalInformation(EmployeeMainID, FirstName, LastName, DateOfBirth, Gender)"
                                                          + " VALUES(?, ?, ?, ?, ?)");
            
            pstmt.setInt(1, Integer.parseInt(employeeID));
            pstmt.setString(2, firstName);
            pstmt.setString(3, lastName);
            pstmt.setString(4, birthday);
            pstmt.setString(5, gender);
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
        epi a = new epi();
        a.employeeID = "4";
        a.firstName = "awdwd";
        a.lastName = "Bob";
        a.birthday = "2023-11-30";
        a.gender = "M";
        a.updateEmployee();
    }
}
