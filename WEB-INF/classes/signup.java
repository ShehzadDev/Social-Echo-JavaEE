import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class signup extends HttpServlet {

    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        String username=request.getParameter("username");
        String email=request.getParameter("email");
        String pass=request.getParameter("password");
        String confirm=request.getParameter("password-confirm");

        out.println("<html>");
        out.println("<head><title>Sign Up</title></head>");
        out.println("<body bgcolor=\"#ffffff\">");


        boolean flag=false;

        if (username.equals(""))
        {
            out.println("<h4>username is empty</h4>");
            return;
        }
        else
        {
            flag=true;
        }

        if (email.equals("") )
        {
            out.println("<h4>email is empty</h4>");
            return;
        }
        else if(!email.equals(""))
        {
            String a =email;
            int b = a.indexOf("@");
            int dot = a.lastIndexOf(".");
            if( b<1 || dot < b + 2 || dot+1 >= a.length())
            {
                out.println("<h4>Enter valid email address</h4>");
                return;
            }
        }
        else
        {
            flag=true;
        }

        if (pass.equals("") )
        {
            out.println("<h4>Password is Empty</h4>");
            return;
        }
        else
        {
            flag=true;
        }

        if (confirm.equals("") )
        {
            out.println("<h4>Confirm Password is Empty</h4>");
            return;
        }
        else
        {
            flag=true;
        }

        if (!pass.equals(confirm))
        {
            out.println("<h4>Password and Confirm Password doesn't match</h4>");
            return;
        }
        else
        {
            flag=true;
        }

        if(flag==true)
        {
            try{

                Class.forName("com.mysql.jdbc.Driver");

                String url = "jdbc:mysql://127.0.0.1/user_info";

                Connection con=DriverManager.getConnection(url, "root", "root");

                Statement st=con.createStatement();


                String selectQuery="Select * from users where username='"+username+"' or email='"+email+"'";

                ResultSet srs = st.executeQuery( selectQuery );


                if(srs.next())
                {
                    out.println("<h1>User Alreay Exists!</h1>");
                }
                else{

                    String query = "INSERT INTO users(username,email,pass,type)VALUES('"+ username + "','" + email+ "','" + pass+ "','user')";
                    int rs = st.executeUpdate( query );
                    if(rs==1)
                    {
                        response.sendRedirect("login.jsp");
                    }

                    else
                    {
                        out.println("<h1>Record could not be inserted.</h1>");
                    }
                }

                out.println("</body></html>");
                st.close();
                con.close();

            }
            catch(Exception e)
            {
                out.println(e);
            }

        }

        else
        {
            out.println("<br>");
            RequestDispatcher t = request.getRequestDispatcher("/signup.html");
            t.include(request,response);
        }

        out.println("</body>");
        out.println("</html>");
    }
}