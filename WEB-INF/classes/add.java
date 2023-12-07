import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class add extends HttpServlet {

    //Process the HTTP Get request
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");

        // get PrintWriter object
        PrintWriter out = response.getWriter();

        String username=request.getParameter("username");
        String title=request.getParameter("title");
        String description=request.getParameter("description");

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

            String query = "INSERT INTO posts(username,title,description)VALUES('"+user+"','"+title+"','"+description+"')";
            int rs = st.executeUpdate( query );
            
            if(rs==1)
            {
                response.sendRedirect("home.jsp");
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