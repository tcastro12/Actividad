<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>    
          <center>
    <img src="img//images.png" class="img img-responsive" class="text-center">
    </center>
        <title>JSP Page</title>
    </head>
    <body style="margin-top: 30px">      
        <%
            //CONECTANOD A LA BASE DE DATOS:
            Connection con;
            String url = "jdbc:mysql://localhost:3306/bd_practica";
            String Driver = "com.mysql.jdbc.Driver";
            String user = "root";
            String clave = "";
            Class.forName(Driver);
            con = DriverManager.getConnection(url, user, clave);
            PreparedStatement ps;
            //Emnpezamos Listando los Datos de la Tabla Usuario
            Statement smt;
            ResultSet rs;
            smt = con.createStatement();
            rs = smt.executeQuery("select * from participantes");
            //Creamo la Tabla:     
        %>
        <div class="container">   
                        <h1>Lista de Registros</h1>
            <hr>
            <a class="btn btn-success btn-lg" href="Agregar.jsp">Nuevo Registro</a>
            <div style="padding-left: 800px">                  
                <input type="text" class="form-control" value="Buscar"/>                            
            </div>
        </div>  
              
        <br>
        <div class="container">               
            <!--<a  class="btn btn-success" href="Agregar.jsp">Nuevo Registro</a> Esto es Cuando se Crea un nuevo Archivo Agregar.jsp -->         
             <table class="table table-bordered"  id="tablaDatos">
                    <thead>
                        <tr>
                            <th class="text-center">Id</th>
                            <th class="text-center">Jugador</th>
                            <th class="text-center">Club</th>
                            <th class="text-center">Sexo</th>
                            <th class="text-center">Edad</th>
                            <th class="text-center">Categoria</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody id="tbodys">
                        <%
                            while (rs.next()) {
                        %>
                        <tr>
                            <td class="text-center"><%= rs.getInt("Id")%></td>
                            <td class="text-center"><%= rs.getString("Jugador")%></td>
                            <td class="text-center"><%= rs.getString("Club")%></td>
                             <td class="text-center"><%= rs.getString("Sexo")%></td>                           
                            <td class="text-center"><%= rs.getString("Edad")%></td>
                            <td class="text-center"><%= rs.getString("Categoria")%></td>
                            <td class="text-center">
                                
                                <!-- <input type="hidden" value="<//%= rs.getInt("Id_Usuario")%>" id="Editar"/>
                                <input type="submit" class="btn btn-warning" data-toggle="modal" data-target="#myModal1" value="Editar"/>  -->

                                <a href="Delete.jsp?id=<%= rs.getInt("Id")%>" class="btn btn-danger">Delete</a>
                            </td>
                        </tr>
                        <%}%>
                </table>
            </div>        
        <div class="container">          
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                    <div class="modal-content">
                        <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Agregar Registro</h4>
                        </div>
                        <div class="modal-body">
                            <form action="" method="post">
                                <label>Id</label> 
                                <input type="text" name="txtId" class="form-control"/><br>
                                <label>Jugador</label> 
                                <input type="text" name="txtJug" class="form-control"/>                                      
                                <div class="modal-footer">
                                <label>Club</label> 
                                <input type="text" name="txtClub" class="form-control"/><br>                                    
                                <label>Sexo</label> 
                                <input type="text" name="txtNom" class="form-control"/><br>                                    
                                <label>	Edad</label> 
                                <input type="text" name="txtNom" class="form-control"/><br>                                    
                                <label>	Categoria</label> 
                                <input type="text" name="txtNom" class="form-control"/><br>                                        
                                    
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>                            
                                    <input type="submit" value="Guardar" class="btn btn-primary"/>
                                </div>
                            </form>
                        </div>
                    </div>                    
                </div>
            </div>
            <%
 String jug, clu, sx, ed, cat;
             jug=request.getParameter("txtJug");
             clu=request.getParameter("txtClub"); 
             sx=request.getParameter("txtSexo");
             ed=request.getParameter("txtEdad"); 
             cat=request.getParameter("txtCat");  
            if(jug!=null && clu!=null && sx!=null && ed!=null && cat!=null ){
           ps=con.prepareStatement("insert into participantes(Jugador, Club, Sexo, Edad, Categoria)values('"+jug+"','"+clu+"','"+sx+"','"+ed+"','"+cat+"')");

          } 
            %>
        </div>        
        <script src="js/jquery.js" type="text/javascript"></script>             
        <script src="js/bootstrap.min.js" type="text/javascript"></script>        
    </body>
</html>
