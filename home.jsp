<!DOCTYPE html>
<html lang="en">

<%@ page session="false"%>

<% 
HttpSession session = request.getSession(false);
String usertype = "";
String uname=null;
if (session == null) {
    response.sendRedirect("login.jsp");
}

else if(session!=null)
{
    usertype=(String)session.getAttribute("type");
    uname = (String)session.getAttribute("username");
    if(usertype.equals("admin"))
    {
        response.sendRedirect("dashboard.jsp");
    }
}
else 
{
    response.sendRedirect("login.jsp");
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

    <style>
      #main{
        display: flex;
        align-items: center;
        justify-content: space-around;
      }
    </style>
</head>

  <body>
    <div id="main">
      <div class="m1">
        <h1 style="text-align: center;">
          <%= uname %>
          
       </h1>  
      </div> 
      <div class="m2">
        <a href="profile.jsp">Add Profile Info</a> <b>|</b>
       <a href="view.jsp">View Profile Info</a> 
      </div>
    </div>

        <%@ page import="java.sql.*" %>

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
              out.println("<b>id : " + id + "</b><hr>");
              out.println("<br>");
            }
          } 
          catch (Exception e) {
            out.println("Error: " + e.getMessage());
          }
        %>
        
        <form action="posts">
          <input type="submit" value="View Posts">
      </form>

      <form action="addPost.jsp">
        <input type="submit" value="Add Post">
    </form>

    <form action="updatePost.jsp">
      <input type="submit" value="Update Post">
  </form>

  <form action="deletePost.jsp">
    <input type="submit" value="Delete Post">
</form>

<form  action="logout" method="post">
  <input type = "submit" id="logout" value="Log Out" >
</form>
        
  </body>
</html>