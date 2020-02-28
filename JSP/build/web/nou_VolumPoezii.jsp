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
class="db.JavaBean" este path-ul catre JavaBean,java

Pentru a importa tot din acea clasa, voi pune property=steluta-->
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
    

      <%
            int idpoet, idcarte;
            String id1, id2, NumePoet, PrenumePoet, Nationalitate, NumeCarte, EdituraCarte, ISBN, NumeVolum, DataLansare, Tema;
            id1 = request.getParameter("idpoet");
            id2 = request.getParameter("idcarte");
            NumeVolum = request.getParameter("NumeVolum");
            DataLansare = request.getParameter("DataLansare");
            Tema = request.getParameter("Tema");
            if (id1 != null) {
                jb.connect();
                jb.adugaVolumPoezii(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), NumeVolum, DataLansare, Tema);
                jb.disconnect();
        %>
        <font size="6" color="black"><p align="center">Baza de date a fost actualizata!</p></font>
        <%
        } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("poeti");
        ResultSet rs2 = jb.vedeTabela("carti");
        %>
        <h1 align="center"> Adaugare Volum Poezii</h1>
        <form action="nou_VolumPoezii.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="center">IdPoet:</td>
                    <td> 
                        Selectati poetul:
			<SELECT NAME="idpoet">
                                <%
                                    while(rs1.next()){
                                        idpoet = rs1.getInt("idpoet");
                                        NumePoet = rs1.getString("Nume");
                                        PrenumePoet = rs1.getString("Prenume");
                                        Nationalitate = rs1.getString("Nationalitate");
                                %>
                                    <OPTION VALUE="<%= idpoet%>"><%= idpoet%>,<%= NumePoet%>,<%= PrenumePoet%>,<%= Nationalitate%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                    
                    </td>
                </tr>
                <tr>
                    <td align="center">IdCarte:</td>
                    <td> 
                        Selectati cartea:
			<SELECT NAME="idcarte">
				<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                                <%
                                    while(rs2.next()){
                                        idcarte = rs2.getInt("idcarte");
                                        NumeCarte = rs2.getString("NumeCarte");
                                        EdituraCarte = rs2.getString("EdituraCarte");
                                        ISBN = rs2.getString("ISBN");
                                %>
                                    <OPTION VALUE="<%= idcarte%>"><%= idcarte%>,<%= NumeCarte%>,<%= EdituraCarte%>,<%= ISBN%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                     </td>
                </tr>
                <tr>
                    <td align="center">Nume volum:</td>
                    <td> <input type="text" name="NumeVolum" size="30" /></td>
                </tr>
                <tr>
                    <td align="center">Data Lansarii:</td>
                    <td> <input type="text" name="DataLansare" size="30" /></td>
                </tr>
                <tr>
                    <td align="center">Tema volumului:</td>
                    <td> <input type="text" name="Tema" size="30" /></td>
                </tr>
            </table>
            <p align="center"><input type="submit" value="Adauga volumul" /></p>
        </form>
        <%
            }
        %>
        <br/>
        <a href="tabela_VolumPoezii.jsp"><b><p align="center"><strong>inapoi la tabela volume poezii</strong></p></b></a>
        <br/>
    

    </body>
</html>