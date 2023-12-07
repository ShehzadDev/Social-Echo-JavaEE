import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class login extends HttpServlet {

    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
 
        PrintWriter out = response.getWriter();

        String username=request.getParameter("username");
        String pass=request.getParameter("password");
        String usertype=request.getParameter("usertype");

        out.println("<html>");
        out.println("<head><title>Log In</title></head>");
        out.println("<body bgcolor=\"#ffffff\">");


        boolean flag=false;

        if (username.equals(""))
        {
            out.println("<p>username is empty</p>");
            return;
        }
        else
        {
            flag=true;
        }

        if (pass.equals(""))
        {
            out.println("<p>Password is empty</p>");
            return;
        }
        else
        {
            flag=true;
        }

        if (usertype.equals("") )
        {
            out.println("<p>Please Choose your usertype</p>");
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


                String selectQuery="Select * from users where username='"+username+"' and pass='"+pass+"'";

                ResultSet srs = st.executeQuery( selectQuery );


                if(srs.next())
                {
                    String type = srs.getString("type");
                    String uname = srs.getString("username");

                    HttpSession session = request.getSession();

                    session.setAttribute("type", type);
                    session.setAttribute("username", uname);

                    if (usertype.equals(type)){
                        
                        if(type.equals("admin"))
                        {
                            response.sendRedirect("dashboard.jsp");
                        }
                        else if(type.equals("user"))
                        {
                            response.sendRedirect("home.jsp");
                        }
                    } 
                    else if (!usertype.equals(type)) 
                    {
                        out.println("Invalid User Type Selected!");
                    }
                }
                else{
                    out.println("Record Not Found!");
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