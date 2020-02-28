<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="style/style.css" />
  <title>Proiect PAI</title>
</head>

<!--Preiau functiile din JavaBean si le folosesc in acest fisier.jsp
jsp:useBean este un tag care va da un id "jb", adica o instanta la clasa JavaBean
class="db.JavaBean" este path-ul catre JavaBean,java

Pentru a importa tot din acea clasa, voi pune property=steluta-->
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
 
<body>
        <%
            String NumeCarte = request.getParameter("NumeCarte");
            String EdituraCarte = request.getParameter("EdituraCarte");
            String ISBN = request.getParameter("ISBN");
            if (NumeCarte != null) {
                jb.connect();
                jb.adugaCarte(NumeCarte, EdituraCarte, ISBN);
                jb.disconnect();
        %>
        
        
        <br></br>
        <br></br>
        <br></br>
        <font size="7" color="black"><p align="center">Baza de date a fost actualizata!</p></font>
        <li><a href="tabela_Carte.jsp"><b><p align="center"><strong>Inapoi la lista Carti</strong></p></b></a></li>
        <li><a href="nou_Carte.jsp"><b><p align="center"><strong>Adauga o noua carte</strong></p></b></a></li>
        <br></br>
        <br></br>
        <br></br>
        
        <%
           
        } else {
        %>
        
        <h1 align="center">Adaugare carte noua</h1>    
        <form action="nou_Carte.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">Nume Carte:</td>
                    <td> <input type="text" name="NumeCarte" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Editura Carte:</td>
                    <td> <input type="text" name="EdituraCarte" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">ISBN:</td>
                    <td> <input type="text" name="ISBN" size="30" /></td>
                </tr>
                <p align="center"><input type="submit" value="Adauga Cartea" /></p>
            </table>
        </form>
        
        <br><br><br>
        <p align="center">
        <a href="tabela_Carte.jsp"><b>Inapoi la lista Carti</b></a>
        </p>

        <%
            }
        %>

</body>
</html>