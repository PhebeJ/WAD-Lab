<%@page import="java.lang.Integer.*,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
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
    rs = smt.executeQuery("select * from data where uname='"+username+"' and pass='"+password+"';");
    if(rs.next()){
        session.setAttribute("id", rs.getString("id"));
        out.println("Welcome "+rs.getString("name"));
        out.println("<br /><a href='console.html'>Go to console</a>");
    }
    else{
        out.println("Invalid username or password. <a href='login.html'>try again</a>");
    }
%>  
