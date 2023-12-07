<!DOCTYPE html>
<html lang="en">
<%
    String user = (String)session.getAttribute("username");
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
    <title>Sign Up</title>
    

</head>
<body>
    <nav>
        <h1>Social <span class="logo">Echo</span></h1>
        <ul>
            <li><a href="./index.html">Home</a></li>
            <li><a href="./signup.jsp"><u><b>Sign Up</b></u></a></li>
            <li><a href="./login.jsp">Log In</a></li>
        </ul>
    </nav>

    <div id="signup">
        <h1 style="padding-bottom: 15px;">Sign Up</h1>
        <form id="signup-form" action="signup" method="post" onsubmit="return VALIDATE()">

            <label for="username">Username:</label>
            <br>
            <input type="text" id="username" name="username">
            <br>
            <label for="email">Email:</label>
            <br>
            <input type="email" id="email" name="email">
            <br>
            <label for="password">Password:</label>
            <br>
            <input type="password" id="password" name="password">
            <br>
            <label for="password-confirm">Confirm Password:</label>
            <br>
            <input type="password" id="password-confirm" name="password-confirm">
            <br>
            <p id="error" style="color: red;"></p>
            <input type="submit" value="Sign Up">
            
        </form>
          
    </div>

    <script>
        

    function VALIDATE() 
    {
    
        var username = document.getElementById("username").value;
        var email = document.getElementById("email").value;
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("password-confirm").value;
        
        var at=email.indexOf("@");  
        var dot=email.lastIndexOf(".");

        if(username=="")
        {
            document.getElementById("error").innerHTML="Username field is Empty!"
            return false;
        }  

        if (at<1 || dot<at+2 || dot+2>=email.length)
        {
            document.getElementById("error").innerHTML="Email format not correct !";
            return false;
        }

        if(password=="")
        {
            document.getElementById("error").innerHTML="Password field is Empty!"
            return false;
        }

        if(passwordConfirm="")
        {
            document.getElementById("error").innerHTML="Confirm Password field is Empty!"
            return false;
        }
        // Password validation
        if (password.length < 8) {
            document.getElementById("error").innerHTML="Password must be at least 8 characters long";
            return false;
        }
        if (password !== confirmPassword) {
            document.getElementById("error").innerHTML="Passwords does not match";
            return false;
        }

        if(email=="")
        {
            document.getElementById("error").innerHTML="Email field is Empty!"
            return false;
        }
        
        
        return true;
        

        


    }


    

    </script>
</body>
</html>