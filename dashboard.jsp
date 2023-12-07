<!DOCTYPE html>
<html lang="en">
   <%@ page session="false"%>
   <% HttpSession session = request.getSession(false);
      String username=null;
      String type=null;
      if(session==null)
      {
        response.sendRedirect("login.jsp");
      }
      else if(session!=null)
      {
            type = (String)session.getAttribute("type");
            username = (String)session.getAttribute("username");
            if(type.equals("user"))
            {
                response.sendRedirect("home.jsp");
            }
      }
      %>
   <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="shortcut icon" href="./IMG/transparent.png" type="image/x-icon">
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="./main.css">
      <title>Dashboard</title>
   </head>
   <body>
      <h1 style="text-align: center;">
         <%= username %>
         <%= type %>
         
      </h1>
      <br>
      <form  action="admin" method="post">
         <input type = "submit" id="approve" value="Approve" >
      </form>
      <br>
      <form  action="delete.jsp" method="post">
         <input type = "submit" id="delete" value="Deactivate" >
      </form>
      <br>
      <form  action="logout" method="post">
         <input type = "submit" id="logout" value="Log Out" >
      </form>
   </body>
</html>