import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;


public class deletePost extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession ss = request.getSession(false);
        String uname = (String) ss.getAttribute("username");

        if (!uname.equals(username)) {
            out.println("<h1>Access Denied!</h1>");
        } else {

            try {

                Class.forName("com.mysql.jdbc.Driver");

                String url = "jdbc:mysql://127.0.0.1/user_info";

                Connection con = DriverManager.getConnection(url, "root", "root");

                Statement st = con.createStatement();

                String query = "Select * from posts where id='" + id + "' and username='" + username + "'";

                ResultSet rs = st.executeQuery(query);
                String title=null;
                if (rs.next()) {
                    title=rs.getString("title");
                    String delete = "DELETE from posts where id='" + id + "' and username='" + username + "'";
                    int a = st.executeUpdate(delete);

                    if (a == 1) {
                        response.sendRedirect("home.jsp");
                    } else {
                        out.println("<h1>No Ownership Found!</h1>");
                    }
                    st.close();
                } else {
                    out.println("<h1>Your are Not allowed to Delete Record "+id+"</h1>");
                    return;
                }

                con.close();
            } catch (Exception e) {

                out.println(e);
            }
        }
    }
}