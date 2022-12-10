<%-- 
    Document   : Agregar
    Created on : 9/12/2022, 01:15:03 PM
    Author     : carlo
--%>

<%@page import="java.awt.TrayIcon.MessageType"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    <center>
    <img src="img//images.png" class="img img-responsive" class="text-center">
    </center>
   </head>
      <div class="container">
          <center>
            <h1>Agregar Registro</h1>                  
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                Jugador:
                <input type="text" name="txtJug" class="form-control"/>
                Club:
                <input type="text" name="txtClub" class="form-control"/>
                <br>
                Sexo:
                <input type="text" name="txtSexo" class="form-control"/>
                Edad:
                <input type="text" name="txtEdad" class="form-control"/>                
                Categoria:
                <input type="text" name="txtCat" class="form-control"/>
                <br>
                
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                <a href="index.jsp">Regresar</a>
        </form>
                            </center>

        </div>         
    </body>            
        
</div>
</form>
 </div>
 </div>

</body>
</html>
<%
      Connection con;
            String url = "jdbc:mysql://localhost:3306/bd_practica";
            String Driver = "com.mysql.jdbc.Driver";
            String user = "root";
            String clave = "";
            Class.forName(Driver);
            con = DriverManager.getConnection(url, user, clave);
            PreparedStatement ps;
            String jug, clu, sx, ed, cat;
             jug=request.getParameter("txtJug");
             clu=request.getParameter("txtClub"); 
             sx=request.getParameter("txtSexo");
             ed=request.getParameter("txtEdad"); 
             cat=request.getParameter("txtCat");  
            if(jug!=null && clu!=null && sx!=null && ed!=null && cat!=null ){
           ps=con.prepareStatement("insert into participantes(Jugador, Club, Sexo, Edad, Categoria)values('"+jug+"','"+clu+"','"+sx+"','"+ed+"','"+cat+"')");
           ps.executeUpdate();        
           response.sendRedirect("index.jsp");

          } 
%>