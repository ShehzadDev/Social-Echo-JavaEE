<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="./IMG/transparent.png" type="image/x-icon">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./main.css">
<title>Add User Profile</title>
</head>
<body>
	<div id="login">
        <h1>Add User Profile</h1>
	<form action="profile" method="post">
		<table>
			<tr>
				<td>First Name:</td>
				<td><input type="text" name="firstName"></td>
			</tr>
			<tr>
				<td>Last Name:</td>
				<td><input type="text" name="lastName"></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td>Phone Number:</td>
				<td><input type="text" name="phoneNumber"></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Submit"></td>
			</tr>
		</table>
	</form>
    </div>
</body>
</html>
