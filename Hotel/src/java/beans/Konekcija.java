/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package beans;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author user
 */
public class Konekcija {
    public static Connection Konekcija(){
            Connection conn = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoteli","root","");
        }
        catch(Exception e){
        }
        return conn;
    }
}
