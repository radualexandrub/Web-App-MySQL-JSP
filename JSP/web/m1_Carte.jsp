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
    
    <!--m1_Carte.jsp ne permite sa punem intr-un formular noile valori-->
    <body>
        
        <h1 align="center">Modificare intrare in Tabela Carti:</h1>
        <br/>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey")); //facem conversia
            ResultSet rs = jb.intoarceLinieDupaId("carti", "idcarte", aux); //imi returneaza linia pe care o modific
            rs.first();                                                     //se duce pe prima linie
            String NumeCarte = rs.getString("NumeCarte");                   //preiau atributele pe care vreau sa le modific
            String EdituraCarte = rs.getString("EdituraCarte");
            String ISBN = rs.getString("ISBN");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Carte.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdCarte:</td>
                    <td> <input type="text" name="idcarte" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">NumeCarte:</td>
                    <td> <input type="text" name="NumeCarte" size="30" value="<%= NumeCarte%>"/></td>
                </tr>
                <tr>
                    <td align="right">EdituraCarte:</td>
                    <td> <input type="text" name="EdituraCarte" size="30" value="<%= EdituraCarte%>"/></td>
                </tr>
                <tr>
                    <td align="right">ISBN:</td>
                    <td> <input type="text" name="ISBN" size="30" value="<%= ISBN%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center"">
            <a href="modifica_Carte.jsp"><b>Renunta la aceasta modificare</b></a>
            <br/>

    </body>
</html>