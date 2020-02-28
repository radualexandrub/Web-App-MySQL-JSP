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
    
    
<!--m1_VolumPoezii.jsp ne permite sa punem intr-un formular noile valori-->
    <body>
        
    <h1 align="center">Tabela VolumPoezii:</h1>
        <br/>
        <p align="center"><a href="nou_VolumPoezii.jsp"><b>Adauga un nou volum de poezii.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            String NumePoet, PrenumePoet, Nationalitate, NumeCarte, EdituraCarte, ISBN, NumeVolum, DataLansare, Tema;

            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey")); ////face conversia primarykey/checkbox
            ResultSet rs = jb.intoarceVolumId(aux);             //imi returneaza linia pe care o modific
            rs.first();                                         //se duce pe prima linie
            int id1 = rs.getInt("idpoet_volum");                //preiau atributele pe care vreau sa le modific
            int id2 = rs.getInt("idcarte_volum");

            NumePoet = rs.getString("Nume");
            PrenumePoet = rs.getString("Prenume");
            
            Nationalitate = rs.getString("Nationalitate");
            NumeCarte = rs.getString("NumeCarte");
            EdituraCarte = rs.getString("EdituraCarte");
            ISBN = rs.getString("ISBN");
            NumeVolum = rs.getString("NumeVolum");
            DataLansare = rs.getString("DataLansare");
            Tema = rs.getString("Tema");

            ResultSet rs1 = jb.vedeTabela("poeti");
            ResultSet rs2 = jb.vedeTabela("carti");
            int idpoet, idcarte;


        %>
        <form action="m2_VolumPoezii.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdVolumPoezii:</td>
                    <td> <input type="text" name="idvolumpoezii" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">idpoet:</td>
                    <td> 
                        <SELECT NAME="idpoet">
                            <%
                                while (rs1.next()) {
                                    idpoet = rs1.getInt("idpoet");
                                    NumePoet = rs1.getString("Nume");
                                    PrenumePoet = rs1.getString("Prenume");
                                    Nationalitate = rs1.getString("Nationalitate");
                                    if (idpoet != id1) {
                            %>
                            <OPTION VALUE="<%= idpoet%>"><%= idpoet%>, <%= NumePoet%>, <%= PrenumePoet%>, <%= Nationalitate%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idpoet%>"><%= idpoet%>, <%= NumePoet%>, <%= PrenumePoet%>, <%= Nationalitate%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">idcarte:</td>
                    <td> 
                        <SELECT NAME="idcarte">
                            <%
                                while (rs2.next()) {
                                    idcarte = rs2.getInt("idcarte");
                                    NumeCarte = rs2.getString("NumeCarte");
                                    EdituraCarte = rs2.getString("EdituraCarte");
                                    ISBN = rs2.getString("ISBN");
                            if (idcarte != id2) {
                            %>
                            <OPTION VALUE="<%= idcarte%>"><%= idcarte%>, <%= NumeCarte%>, <%= EdituraCarte%>, <%= ISBN%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idcarte%>"><%= idcarte%>, <%= NumeCarte%>, <%= EdituraCarte%>, <%= ISBN%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">NumeVolum:</td>
                    <td> <input type="text" name="NumeVolum" size="30" value="<%= NumeVolum%>"/></td>
                </tr>
                <tr>
                    <td align="right">DataLansare</td>
                    <td> <input type="text" name="DataLansare" size="30" value="<%= DataLansare%>"/></td>
                </tr>
                <tr>
                    <td align="right">Tema:</td>
                    <td> <input type="text" name="Tema" size="30" value="<%= Tema%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>

            <br/>
    </body>
    <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
        <p align="center"">
            <a href="modifica_VolumPoezii.jsp"><b>Renunta la aceasta modificare</b></a>
            <br/>

    </body>
</html>