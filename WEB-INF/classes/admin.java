import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;


public class admin extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NullPointerException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();


        HttpSession sess = request.getSession(false);

        if (sess == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        String usertype = (String) sess.getAttribute("type");

        try {

            Class.forName("com.mysql.jdbc.Driver");

            String url = "jdbc:mysql://127.0.0.1/user_info";

            Connection con = DriverManager.getConnection(url, "root", "root");

            Statement st = con.createStatement();

            String query = "Select * from users";

            ResultSet rs = st.executeQuery(query);


            out.println("Users");
            out.println("<table>");

            String username, email, type;

            out.println("<tr>");
            out.println("<th>Username</th>");
            out.println("<th>Gmail</th>");
            out.println("<th>Type</th>");
            out.println("</tr>");

            while (rs.next()) {
                username = rs.getString(1);
                email = rs.getString(2);
                type = rs.getString(4);
                
                out.println("<tr>");
                out.println("<td>" + username + "</td>");
                out.println("<td>" + email + "</td>");
                out.println("<td>" + type + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
            if (!usertype.equals("admin")) {
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