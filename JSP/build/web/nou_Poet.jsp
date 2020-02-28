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
    
<!--Preiau functiile din JavaBean si le folosesc in acest fisier.jsp
jsp:useBean este un tag care va da un id "jb", adica o instanta la clasa JavaBean
class="db.JavaBean" este path-ul catre JavaBean.java

Pentru a importa tot din acea clasa, voi pune property=steluta-->
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
    
    
    
    <body>
        <%
            String Nume = request.getParameter("Nume");
            String Prenume = request.getParameter("Prenume");
            String Nationalitate = request.getParameter("Nationalitate");
            if (Nume != null) {
                jb.connect();
                jb.adugaPoet(Nume, Prenume, Nationalitate);
                jb.disconnect();
        %>
        
        
        <br></br>
        <br></br>
        <br></br>
        <font size="6" color="black"><p align="center">Baza de date a fost actulalizata.</p></font>
        <li><a href="tabela_Poet.jsp"><b><p align="center"><strong>inapoi la lista Poeti</strong></p></b></a></li>
        <br></br>
        <br></br>
        <br></br>
        
    
        
        <%
           
        } else {
        %>
        
        <h1 align="center">Adaugare poet nou</h1>
         
  
       
        <form action="nou_Poet.jsp" method="post">
            <table align="center">    
                <tr>
                    <td align="center"><b>Nume Poet:</b></td>
                    <td> <input type="text" name="Nume" size="30" /></td>
                </tr>
                
                <tr>
                    <td align="center"><b>Prenume Poet:</b></td>
                    <td> <input type="text" name="Prenume" size="30" /></td>
                </tr>
                
                <tr>
                    <td align="center"><b>Nationalitate:</b></td>
                    <td> <input type="text" name="Nationalitate" size="30" /></td>
                </tr>
                
                <p align="center"><input type="submit" value="Adauga poetul" /></p>
            </table>
        </form>

        <br><br><br>
        <p align="center">
        <a href="tabela_Poet.jsp"><b>Inapoi la lista Poeti</b></a>
        </p>
        <%
            }
        %>

    </body>
</html>