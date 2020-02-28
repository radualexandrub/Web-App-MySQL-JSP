package db;
import java.sql.*;

public class JavaBean {

    //date membre
    String error; 
    Connection con; //un obiect con prin care voi face conexiunea la baza de date

    public JavaBean() {
    } //voi avea colectii de functii java: conectare baza de date, deconectare, inserare, update, stergeri, join, etc

    public void connect() throws ClassNotFoundException, SQLException, Exception {
        //daca nu se reuseste conexiunea, vom arunca exceptii pentru a vedea erorile
        try {
            Class.forName("com.mysql.jdbc.Driver"); /*se incarca driver-ul (API-ul) intre codul nostru si serverul MySQL !!!
            prin intermediul librariei MySQL JDBC Driver... apoi prin acel obiect con ne conectam la server:
            localhost = server-ul de mysql lucreaza pe masina locala, portul default 3306*/
            //con = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca?useSSL=false", "RaduAlexandro#intaiul", "tobleronepeviata123");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca?useSSL=false", "root", "microsoft");
        } catch (ClassNotFoundException cnfe) {
            error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
            throw new ClassNotFoundException(error);
        } catch (SQLException cnfe) {
            error = "SQLException: Nu se poate conecta la baza de date.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
            throw new Exception(error);
        }
    } // connect()

    public void connect(String bd) throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            //con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + bd, "RaduAlexandro#intaiul", "tobleronepeviata123");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + bd, "root", "microsoft");
        } catch (ClassNotFoundException cnfe) {
            error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
            throw new ClassNotFoundException(error);
        } catch (SQLException cnfe) {
            error = "SQLException: Nu se poate conecta la baza de date.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
            throw new Exception(error);
        }
    } // connect(String bd)

    public void connect(String bd, String ip) throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            //con = DriverManager.getConnection("jdbc:mysql://" + ip + ":3306/" + bd, "RaduAlexandro#intaiul", "tobleronepeviata123");
            con = DriverManager.getConnection("jdbc:mysql://" + ip + ":3306/" + bd, "root", "microsoft");
        } catch (ClassNotFoundException cnfe) {
            error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
            throw new ClassNotFoundException(error);
        } catch (SQLException cnfe) {
            error = "SQLException: Nu se poate conecta la baza de date.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
            throw new Exception(error);
        }
    } // connect(String bd, String ip)

    
    //functia de deconectare de la baza de date
    public void disconnect() throws SQLException {
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException sqle) {
            error = ("SQLException: Nu se poate inchide conexiunea la baza de date.");
            throw new SQLException(error);
        }
    } // disconnect()

    public void adugaPoet(String Nume, String Prenume, String Nationalitate)
            throws SQLException, Exception {
        if (con != null) {
            try {
// create a prepared SQL statement
                Statement stmt;
                stmt = con.createStatement(); 
                stmt.executeUpdate("insert into poeti(Nume, Prenume, Nationalitate) values('" + Nume + "'  , '" + Prenume + "', '" + Nationalitate + "');");
                //functia de adaugare este un insert clasic SQL
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of adugaPoet()

    public void adugaCarte(String NumeCarte, String EdituraCarte, String ISBN)
            throws SQLException, Exception {
        if (con != null) {
            try {
// create a prepared SQL statement
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate("insert into carti(NumeCarte, EdituraCarte, ISBN) values('" + NumeCarte + "'  , '" + EdituraCarte + "', '" + ISBN + "');");

            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of adugaCarte()

        public void adugaVolumPoezii(int idpoet, int idcarte, String NumeVolum, String DataLansare, String Tema)
            throws SQLException, Exception {
        if (con != null) {
            try {
// create a prepared SQL statement
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate("insert into volumpoezii(idpoet, idcarte, NumeVolum, DataLansare, Tema) values('" + idpoet + "'  , '" + idcarte + "', '" + NumeVolum + "', '" + DataLansare + "', '" + Tema + "');");
                // se poate modifica valoarea datei astfel incat sa se ia data curenta a sistemului:
                // stmt.executeUpdate("insert into consultatie(idpacient, idmedic, DataConsultatie, Diagnostic, Medicament) values('" + idpacient + "'  , '" + idmedic + "', CURDATE(), '" + Diagnostic + "', '" + Medicament + "');");

            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } 

    //ResultSet == liniile dintr-un select, un fel de cursor cu care ne plimbam intre linii
    //deci imi returneaza toate liniile din tabela tabel
    public ResultSet vedeTabela(String tabel) throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String queryString = ("select * from `biblioteca`.`" + tabel + "`;"); //JOIN: ne va da toate liniile in rs, se creeaza statement de conexiune apoi se executa:
            Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila."+sqle.getMessage();
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // vedeTabela()

    //ResultSet == liniile dintr-un select, un fel de cursor cu care ne plimbam intre linii
    public ResultSet vedeVolumPoezii() throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String queryString = ("select a.Nume, a.Prenume, a.Nationalitate, b.NumeCarte, b.EdituraCarte, b.ISBN, c.idvolumpoezii, c.idcarte idcarte_volum, c.idpoet idpoet_volum, c.NumeVolum, c.DataLansare, c.Tema from poeti a, carti b, volumpoezii c where a.idpoet = c.idpoet and b.idcarte = c.idcarte;");
            Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila."+sqle.getMessage();
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // vedeVolumPoezii()

    public void stergeDateTabela(String[] primaryKeys, String tabela, String dupaID) throws SQLException, Exception 
    {
        if (con != null) {
            try {
// create a prepared SQL statement
                long aux;
                PreparedStatement delete;
                delete = con.prepareStatement("DELETE FROM " + tabela + " WHERE " + dupaID + "=?;");
                //Daca scriam "DELETE FROM medici; cu punct si virgula => stergea tot!!!
                
                for (int i = 0; i < primaryKeys.length; i++) {
                    aux = java.lang.Long.parseLong(primaryKeys[i]); //aici se face conversie de la string, id-urile primary key-urilor la long int
                    delete.setLong(1, aux);                     //primul semn de intrebare este inlocuit cu aux, adica id-ul care trebuie sters
                    delete.execute();
                }
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            } catch (Exception e) {
                error = "A aparut o exceptie in timp ce erau sterse inregistrarile.";
                throw new Exception(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of stergeDateTabela()

    public void stergeTabela(String tabela) throws SQLException, Exception {
        if (con != null) {
            try {
// create a prepared SQL statement
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate("delete from " + tabela + ";");
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Stergere nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of stergeTabela()

    public void modificaTabela(String tabela, String IDTabela, int ID, String[] campuri, String[] valori) throws SQLException, Exception {
        String update = "update " + tabela + " set ";
        String temp = "";
        if (con != null) {
            try {
                for (int i = 0; i < campuri.length; i++) {
                    if (i != (campuri.length - 1)) {
                        temp = temp + campuri[i] + "='" + valori[i] + "', ";
                    } else {
                        temp = temp + campuri[i] + "='" + valori[i] + "' where " + IDTabela + " = '" + ID + "';";
                    }
                }
                update = update + temp;
// create a prepared SQL statement
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate(update);
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of modificaTabela()

    public ResultSet intoarceLinie(String tabela, int ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
// Execute query
            String queryString = ("SELECT * FROM " + tabela + " where idpoet=" + ID + ";");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString); //sql exception
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila."+sqle.getMessage();
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // end of intoarceLinie()

    public ResultSet intoarceLinieDupaId(String tabela, String denumireId, int ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
// Execute query
            String queryString = ("SELECT * FROM " + tabela + " where " + denumireId + "=" + ID + ";");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString); //sql exception
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila."+sqle.getMessage();
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // end of intoarceLinieDupaId()

  /*  public ResultSet intoarceVolumPoeziiId(int ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
// Execute query
            String queryString = ("SELECT a.Nume, a.Prenume, a.Nationalitatea, b.NumeCarte, b.EdituraCarte, b.ISBN, c.idvolumpoezii, c.idpoet ipoet_volum, c.idcarte idcarte_volum, c.NumeVolum, c.DataLansare, c.Tema from poeti a, carti b, volumpoezii c where a.idpoet = c.idpoet AND b.idcarte = c.idcarte and idvolumpoezii = '" + ID + "';");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString); //sql exception
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila. ERROR";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
   
    
   }*/
    
    public ResultSet intoarceVolumId(int ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
// Execute query
            String queryString = ("SELECT a.NumeCarte, a.EdituraCarte, a.ISBN, b.Nume, b.Prenume, b.Nationalitate, c.idvolumpoezii, c.idpoet idpoet_volum, c.idcarte idcarte_volum, c.NumeVolum, c.DataLansare, c.Tema from carti a, poeti b, volumpoezii c where a.idcarte = c.idcarte and b.idpoet = c.idpoet and idvolumpoezii = '" + ID + "';");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString); //sql exception
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila. rg";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // end of intoarceLinieDupaId()
}
