<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        String name = request.getParameter("name");
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
        
        int i = smt.executeUpdate("insert into data(name,uname,pass,balance) values('"+name+"','"+username+"','"+password+"','0');");
        response.sendRedirect("login.html");
%>
