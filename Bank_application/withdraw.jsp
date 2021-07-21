<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = (String)session.getAttribute("id");
    String amount = request.getParameter("amount");
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
        float balance = rs.getFloat("balance");        
        if(balance-Float.parseFloat(amount) >=0){
            balance -= Float.parseFloat(amount);
            int i = smt.executeUpdate("update data set balance='"+balance+"' where id='"+id+"';");
            if(i == 1){
                out.println("Balance updated");
                out.println("<br />Your current balance is Rs."+balance);
                out.println("<br /><a href='console.html'>Go back to console</a>");
            }
        }
        else{
            out.println("Amount cannot be withdrawn due to insufficient balance");
            out.println("<br /><a href='console.html'>Go back to console</a>");
        }
    }        
%>
