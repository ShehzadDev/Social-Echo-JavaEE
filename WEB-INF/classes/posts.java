import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;


public class posts extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NullPointerException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();


        HttpSession sess = request.getSession(false);

        if (sess == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        String usertype = (String) sess.getAttribute("type");
        String uname = (String) sess.getAttribute("username");

        try {

            Class.forName("com.mysql.jdbc.Driver");

            String url = "jdbc:mysql://127.0.0.1/user_info";

            Connection con = DriverManager.getConnection(url, "root", "root");

            Statement st = con.createStatement();

            String query = "Select * from posts";

            ResultSet rs = st.executeQuery(query);


            out.println("<h1>Posts</h1>");

            out.println("<h1>Welcome "+uname+"</h1>");

            String username, title, desc;
            while (rs.next()) {
                int id = rs.getInt(1);
                username = rs.getString(2);
                title = rs.getString(3);
                desc = rs.getString(4);

                out.println("<h3> Title : " + title + "</h3>");
                out.println("<p> Description: " + desc + "</p>");
                out.println("<b> ID : " + id + "</b>");
                out.println("<b> User: " + username + "</b>");

                Statement st2 = con.createStatement();
                String commentQuery = "Select * from comments where postid='"+ id+"'";
                ResultSet rs2 = st2.executeQuery(commentQuery);
                
                
                while (rs2.next()) {
                    out.println("<h4>Comments:</h4>");
                    int commentId = rs2.getInt(1);
                    String commentUsername = rs2.getString(2);
                    String commentText = rs2.getString(3);
                    
                    out.println("<p>Comment: " + commentText + "</p>");
                    out.println("<b>Comment User: " + commentUsername + "</b>");
                    out.println("<hr>");
                }

            }
            out.println("<hr>");
            if (usertype.equals("admin")) {
                response.sendRedirect("/login.jsp");
            }

        } catch (Exception e) {

            out.println(e);
        }


    }


    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}