<!DOCTYPE html>
<%
   String user =(String) session.getAttribute("username");
   if(user != null){
      response.sendRedirect("home.jsp");
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
    <title>Log In</title>
    
</head>
<body>
    <nav>
        <h1>Social <span class="logo">Echo</span></h1>
        <ul>
            <li><a href="./index.html">Home</a></li>
            <li><a href="./signup.jsp">Sign Up</a></li>
            <li><a href="./login.jsp"><u><b>Log In</b></u></a></li>
        </ul>
    </nav>

    <div id="login">

        <h1 style="padding-bottom: 15px;">Log In</h1>

        <form id="loginForm" action="login" method="post" onsubmit="return VALIDATE()">
            <label for="username">Username:</label>
            <br>
            <input type="text" id="username" name="username" required pattern="[a-z]{4,16}">
            <br>
            <label for="password">Password:</label>
            <br>
            <input type="password" id="password" name="password" >
            <br>
            <input type="radio" id="admin" name="usertype" value="admin" required>
            <label for="Admin">Admin</label><br>
            <input type="radio" id="user" name="usertype" value="user" required>
            <label for="user">User</label>

            <div id="error">

            </div>

            <input type="submit" value="Login">
          </form>
          
    </div>

    <script>
        function VALIDATE()
        {	
            if ( document.getElementById("username").value == "" )
                {
                    document.getElementById("error").innerHTML = "<p>Username is empty!!</p>";	
                    return false;
                }

            else if(document.getElementById("password").value == "")	
            {
                    document.getElementById("error").innerHTML = "<p>Password is empty!!</p>";	
                    document.getElementById("password").focus();
                    return false;
            } 
	        return true;

        }
    </script>
</body>
</html>