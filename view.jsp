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
      .main{
        display: flex;
        align-items: center;
        justify-content: center;
      }
    </style>
</head>

  <body>
    <div class="main">
      <h1 style="text-align: center;">
        <%= uname %>
        
     </h1>  
     <a href="profile.jsp">Add Profile Info</a> 
    </div> 

        <%@ page import="java.sql.*" %>

        <%
          try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/user_info";
            Connection connection = DriverManager.getConnection(url, "root", "root");
            Statement statement= connection.createStatement();
            ResultSet rs= statement.executeQuery("SELECT * FROM profile where uname='"+session.getAttribute("username")+"'");
        
            if(rs.next()) {
              String username = rs.getString("uname");
              String fname = rs.getString("fname");
              String lname = rs.getString("lname");
              String address = rs.getString("address");
        
              out.println("<h3><hr>First Name  : " + fname + "</h3><br>");
              out.println("<p>Last Name : " + lname + "</p><br>");
              out.println("<b>User Name : " + username + "</b><hr>");
              out.println("<b>Address : " + address + "</b><hr>");
              out.println("<br>");
            }
          } 
          catch (Exception e) {
            out.println("Error: " + e.getMessage());
          }
        %>
        

        
  </body>
</html>