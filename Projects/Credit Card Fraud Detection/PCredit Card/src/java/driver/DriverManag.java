/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 *  JDBC URL FORMAT:
 jdbc:oracle:thin:@//<host>:<port>/ServiceName 
or
 jdbc:oracle:thin:@<host>:<port>:<SID> 

NOTE: The Oracle thin driver requires the SID or ServiceName of the database in the JDBC URL as opposed to the database alias.
Consult your Oracle documentation for more details. 

JDBC URL Examples:

 jdbc:oracle:thin:@//localhost:1521/XE 
jdbc:oracle:thin:@neptune.acme.com:1521:T10A 

jdbc:oracle:thin:@127.0.0.1:1521:T10A 
* 
* Class Path=C:\app\sony\product\11.2.0\dbhome_1\oui\jlib
 */
package driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sony
 */
public class DriverManag {
    public static Connection getConnection()
    {
        Connection con=null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:Oracle11g","scott","lingeSH25");
        } catch (SQLException ex) {
            Logger.getLogger(DriverManag.class.getName()).log(Level.SEVERE, null, ex);
        } catch(ClassNotFoundException ex)
        {
            Logger.getLogger(DriverManag.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }
}
