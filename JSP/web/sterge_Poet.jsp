<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <link rel="stylesheet" type="text/css" href="style/style.css" />

    <head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="style/style.css" />
  <title>Proiect PAI</title>
    </head>
    
    
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    
    
    
    <body>
        
       
        
        <%
            String[] s = request.getParameterValues("primarykey");
            jb.connect();
            jb.stergeDateTabela(s, "poeti", "idpoet");
            jb.disconnect();
        %>
        
        <br></br>
        <br></br>
        <br></br>
        <font size="7" color="black"><p align="center">S-a efectuat stergerea!!</p></font>
        <li><a href="tabela_Poet.jsp"><b><p align="center"><strong>inapoi la lista Poeti</strong></p></b></a></li>
    
        <br></br>
        <br></br>
        <br></br>
        

    </body>
</html>