package kushwant.model;
import java.sql.*;
import oracle.jdbc.driver.*;


public class Myfees 
{
    public Connection createConnection()
    {
        Connection cn=null;
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
       
            cn=DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE","scott","tiger");
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return cn;
    }
}
    
    