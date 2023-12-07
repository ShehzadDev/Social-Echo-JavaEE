<!DOCTYPE html>
<html lang="en">
   <%@ page session="false"%>
   <% HttpSession session = request.getSession(false);
      String uname=null;
      if(session==null)
      {
        response.sendRedirect("login.jsp");
      }
      else if(session!=null)
      {
            String type = (String)session.getAttribute("type");
            uname = (String)session.getAttribute("username");
            if(type.equals("admin"))
            {
                response.sendRedirect("dashboard.jsp");
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
         <%= uname %>
      </h1>

      <%@ page import="java.sql.*,java.io.*" %>

      <%
        try {
          Class.forName("com.mysql.jdbc.Driver");
          String url = "jdbc:mysql://127.0.0.1/user_info";
          Connection connection = DriverManager.getConnection(url, "root", "root");
          Statement statement= connection.createStatement();
          ResultSet rs= statement.executeQuery("SELECT * FROM posts where username='"+session.getAttribute("username")+"'");
      
          while (rs.next()) {
            String id = rs.getString("id");
            String title = rs.getString("title");
            String description = rs.getString("description");
      
            out.println("<h3><hr>Title : " + title + "</h3><br>");
            out.println("<p>Description : " + description + "</p><br>");
            out.println("<b>ID : " + id + "</b><hr>");
            out.println("<br>");
          }
        } 
        catch (Exception e) {
          out.println("Error: " + e.getMessage());
        }
      %>
      
      <div id="login">
        <h1 style="padding-bottom: 15px;">Edit Post</h1>
         <form  action="edit.jsp" method="post">
            <label for="id">ID : </label>

            <input type="text" name="id" required>
            <br>
            <input type = "submit" id="delete" value="Edit" required>
          </form>
      </div>
      
   </body>
</html>