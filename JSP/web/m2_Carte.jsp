<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd
<html>


<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="style/style.css" />
  <title>ProiectPAI</title>
</head>

    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    
    <body>
        
        <h1 align="center"> Tabela Carti:</h1>
        <br/>
        <p align="center"><a href="nou_Carte.jsp"><b>Adauga o carte noua.</b></a> </p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idcarte"));
            String NumeCarte = request.getParameter("NumeCarte"); //preiau atributele pe care le-am modificat in m1
            String EdituraCarte = request.getParameter("EdituraCarte");
            String ISBN = request.getParameter("ISBN");

            String[] valori = {NumeCarte, EdituraCarte, ISBN};
            String[] campuri = {"NumeCarte", "EdituraCarte", "ISBN"};
            jb.modificaTabela("carti", "idcarte", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        
        
        <p align="center">
            <a href="modifica_Carte.jsp"><b>Modifica o alta carte</b></a> <br>
            <a href="tabela_Carte.jsp"><b>Inapoi la lista carti</b></a> <br>
            <br/>
        </p>
    </body>
</html>
</html>