import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class profile extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        String fname=request.getParameter("firstName");
        String lname=request.getParameter("lastName");
        String email=request.getParameter("email");
        String phone=request.getParameter("phoneNumber");
        String address=request.getParameter("address");

        out.println("<html>");
        out.println("<head><title>Add Post</title></head>");
        out.println("<body bgcolor=\"#ffffff\">");


        HttpSession sess = request.getSession(false);

        if (sess == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        String user = (String) sess.getAttribute("username");

        try{

            Class.forName("com.mysql.jdbc.Driver");

            String url = "jdbc:mysql://127.0.0.1/user_info";

            Connection con=DriverManager.getConnection(url, "root", "root");

            Statement st=con.createStatement();

            String query = "INSERT INTO profile(uname,fname,lname,email,phone,address)VALUES('"+user+"','"+fname+"','"+lname+"','"+email+"','"+phone+"','"+address+"')";
            int rs = st.executeUpdate( query );
            
            if(rs==1)
            {
                response.sendRedirect("view.jsp");
            }

            else
            {
                out.println("<h1>Record could not be inserted.</h1>");
            }

            out.println("</body></html>");
            st.close();
            con.close();

        }
        catch(Exception e)
        {
            out.println(e);
        }
        out.println("</body>");
        out.println("</html>");
    }

}