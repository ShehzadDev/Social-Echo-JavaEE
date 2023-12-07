<!DOCTYPE html>
<html lang="en">

<%@ page session="false"%>

<% 
HttpSession session = request.getSession(false);
String usertype = " ";
String uname="";
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
    <h1 style="text-align: center;">
      <%= uname %>
      
   </h1>   
    <div id="login">
      <%=
        usertype
      %>
        <h1 style="padding-bottom: 15px;">Add Post</h1>

        <form id="loginForm" action="add" method="post">
            <label for="title">Title:</label>
            <br>
            <input type="text" id="title" name="title" required>
            <br>
            <label for="description">Description:</label>
            <br>
            <textarea name="description" id="desc" cols="50" rows="10" required></textarea>
            <input type="submit" value="Add Post">
            </div>
          </form>
          
    </div>

        
  </body>
</html>