<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

    <head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="style/style.css" />
  <title>Proiect PAI</title>
    </head>

    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    
    
    <!--m1_Poet.jsp ne permite sa punem intr-un formular noile valori-->
    <body>
        
        
        <h1 align="center">Modificare intrare in tabela Poeti:</h1>
        <br/>

        
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));//face conversia
            ResultSet rs = jb.intoarceLinieDupaId("poeti", "idpoet", aux);//imi returneaza linia pe care o modific
            rs.first();                                         //se duce pe prima linie
            String Nume = rs.getString("Nume");                 //preiau atributele pe care vreau sa le modific
            String Prenume = rs.getString("Prenume");
            String Nationalitatea = rs.getString("Nationalitate");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Poet.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdPoet:</td>
                    <td> <input type="text" name="idpoet" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Nume:</td>
                    <td> <input type="text" name="Nume" size="30" value="<%= Nume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Prenume:</td>
                    <td> <input type="text" name="Prenume" size="30" value="<%= Prenume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Nationalitate:</td>
                    <td> <input type="text" name="Nationalitate" size="30" value="<%= Nationalitatea%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center"">
            <a href="index.html"><b>Renunta la aceasta modificare</b></a>
            <br/>

    </body>
</html>