<!DOCTYPE html>
<html>

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
          <title>Home</title>
      </head>
<body>
     <%@ page import="java.sql.*,java.io.*,javax.servlet.http.*,javax.servlet.*" %>
        <%
        String id = request.getParameter("id");
          try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/user_info";
            Connection connection = DriverManager.getConnection(url, "root", "root");
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM posts WHERE id ='" + id + "'");

            if (rs.next()) {
                if(uname.equals(rs.getString("username")))
                {
                  int postId = rs.getInt("id");
                  String title = rs.getString("title");
                  String description = rs.getString("description");
                  
                  request.setAttribute("id", postId);
                  request.setAttribute("title", title);
                  request.setAttribute("description", description);
                }
                else{
                  response.sendRedirect("home.jsp");
                  out.println("Access Denied!");
                }
            }
            else{
                  out.println("Record Not Exist!");
            }
          } 
          catch (Exception e) {
            out.println("Error: " + e.getMessage());
          }
        %>

  <div id="login">
    <form action="update" method="post">
            <input type="hidden" name="id" value="<%= id %>">
            <input type="hidden" name="username" value="<%= uname %>">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" value="<%= request.getAttribute("title") %>">
            <br>
            <label for="description">Description:</label>
           
            <textarea id="description" name="description" cols="50" rows="10"><%= request.getAttribute("description") %></textarea>
        <input type="submit" value="Update">
    </form>
  </div>
</body>
</html>
