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
public class ewd {
    
    public String employeeID;
    public String shiftschedule;
    public String HireDate;
    public String CustomersAccomodated;
    
    public boolean updateEmployee(){
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/businessmanagement?user=root&password=12345678");
            System.out.println("Connection Successful");

            PreparedStatement pstmt = conn.prepareStatement("UPDATE EmployeeWorkDetails"
                                                          + " SET ShiftSchedule = ?, HireDate = ?, CustomersAccomodated = ?"
                                                          + " WHERE EmployeeID = ?");
            
            pstmt.setString(1, shiftschedule);
            pstmt.setString(2, HireDate);
            pstmt.setString(3, CustomersAccomodated);
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
    
    public boolean insertWorkDetail(){
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/businessmanagement?user=root&password=12345678");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO EmployeeWorkDetails(EmployeeID, ShiftSchedule, HireDate, CustomersAccomodated)"
                                                          + " VALUES(?, ?, ?, ?)");
            
            pstmt.setInt(1, Integer.parseInt(employeeID));
            pstmt.setString(2, shiftschedule);
            pstmt.setString(3, HireDate);
            pstmt.setString(4, CustomersAccomodated);
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
                                                          + " FROM EmployeeWorkDetails"
                                                          + " WHERE EmployeeID = ?");
            
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
                                                          + " FROM EmployeeWorkDetails");
            
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
        
    }
}
