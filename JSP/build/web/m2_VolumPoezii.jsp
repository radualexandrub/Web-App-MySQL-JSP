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
        <br/>
        <p align="center"><a href="nou_VolumPoezii.jsp"><b>Adauga volum nou de poezii.</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idvolumpoezii"));
            String idpoet = request.getParameter("idpoet");
            String idcarte = request.getParameter("idcarte");
            String NumeVolum = request.getParameter("NumeVolum");
            String DataLansare = request.getParameter("DataLansare");
            String Tema = request.getParameter("Tema");

            String[] valori = {idpoet, idcarte, NumeVolum, DataLansare, Tema};
            String[] campuri = {"idpoet", "idcarte", "NumeVolum", "DataLansare", "Tema"};
            jb.modificaTabela("volumpoezii", "idvolumpoezii", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a href="modifica_VolumPoezii.jsp"><b>Modifica un alt volum de poezii</b></a> <br>
            <a href="tabela_VolumPoezii.jsp"><b>Inapoi la lista volume</b></a> <br>
            <br/>
    </body>
</html>
</html>