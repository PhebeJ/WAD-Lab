<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = (String)session.getAttribute("id");
    
 try{
            Class.forName("org.postgresql.Driver");
        }catch(ClassNotFoundException e){
            out.println(e.getMessage());
        }
        
    String url = "jdbc:postgresql://localhost:5432/bank";
    String db_user = "postgres";
    String db_pass = "root";
        
    Connection conn = DriverManager.getConnection(url,db_user,db_pass);
    Statement smt = conn.createStatement();
    
    ResultSet rs;
    rs = smt.executeQuery("select * from data where id='"+id+"';");
    if(rs.next()){
        out.println("Balance: Rs."+rs.getString("balance"));
        out.println("<br /><a href='console.html'>Go back to console</a>");
    }
%>
