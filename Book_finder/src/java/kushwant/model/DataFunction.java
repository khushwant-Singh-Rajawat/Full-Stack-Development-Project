package kushwant.model;
import java.sql.*;


public class DataFunction 
{
    public Connection createConnection()
    {
        Connection cn=null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
        
            //create database connection
            String dbpath="jdbc:mysql://localhost:3306/book_finder";
            String dbuser="root";
            String dbpass="";
            cn=DriverManager.getConnection(dbpath,dbuser,dbpass);
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return cn;
    }
    public String getPhoto(int bookid)
    {
        String photo="";
        try
        {
            String s1="Select photo from books where bookid="+bookid;
            ResultSet r1=fetchData(s1);
            if(r1.next())
            {
                photo=r1.getString(1);
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return  photo;
    }
    
    public int generateId(String tablename,int startvalue)
    {
        int id=startvalue;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
        
            //create database connection
            String dbpath="jdbc:mysql://localhost:3306/book_finder";
            String dbuser="root";
            String dbpass="";
            Connection cn=DriverManager.getConnection(dbpath,dbuser,dbpass);
            String s1="select * from"+tablename;
            PreparedStatement pst=cn.prepareStatement(s1);
            
            ResultSet rs=pst.executeQuery();

                    if(rs.next())
                    {
                            while(rs.next())
                            {
                                    id=rs.getInt(1);
                            }
                            id=id+1;
                    }
            }
            catch(Exception e)
            {
                    System.out.println(e);
            }
            return id;
    }
    
    public ResultSet fetchData(String sql)
    {
            ResultSet rs=null;
            try
            {

                     Class.forName("com.mysql.jdbc.Driver");
        
            //create database connection
            String dbpath="jdbc:mysql://localhost:3306/book_finder";
            String dbuser="root";
            String dbpass="";
            Connection cn=DriverManager.getConnection(dbpath,dbuser,dbpass);
            PreparedStatement pst=cn.prepareStatement(sql);
                    rs=pst.executeQuery();
            }
            catch(Exception e)
            {
                    System.out.println(e);
            }
            return rs;
    }
    public void updateOrderInCart(String cartid)
    {
        try
            {
             Class.forName("com.mysql.jdbc.Driver");
        
            //create database connection
            String dbpath="jdbc:mysql://localhost:3306/book_finder";
            String dbuser="root";
            String dbpass="";
            Connection cn = DriverManager.getConnection(dbpath,dbuser,dbpass);
            PreparedStatement pst;
                pst = cn.prepareStatement("update cart set order_status=1 where cartid="+cartid);
                pst.executeUpdate();
                cn.close();
                    pst.close();
            }       

            catch(ClassNotFoundException | SQLException e)
            {
                System.out.println(e);
            }
    }
    
}
    