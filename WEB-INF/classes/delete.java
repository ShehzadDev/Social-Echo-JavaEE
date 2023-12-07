import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;


public class delete extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession ss = request.getSession(false);
        String usertype = (String) ss.getAttribute("type");

        if (!usertype.equals("admin")) {
            RequestDispatcher r = request.getRequestDispatcher("/login.jsp");
            r.include(request, response);
            out.println("<h1>Access Denied!</h1>");
        } 
        else 
        {
            String username = request.getParameter("username");

            try {

                Class.forName("com.mysql.jdbc.Driver");

                String url = "jdbc:mysql://127.0.0.1/user_info";

                Connection con = DriverManager.getConnection(url, "root", "root");

                Statement st = con.createStatement();

                String query = "Select * from users where username='" + username + "'";

                ResultSet rs = st.executeQuery(query);

                if (rs.next()) {
                    
                    int a=0;
                    if(rs.getString("type").equals("admin")){
                        out.println("<h1>Admin cannot be deleted!</h1>");
                        return;
                    }
                    else{
                        String delete = "DELETE from users where username='"+username+"'";
                        a = st.executeUpdate(delete);
                    }

                    if (a == 1) {
                        response.sendRedirect("dashboard.jsp");
                    }
                    st.close();
                }
                else{
                    out.println("<h1>No Record Found!</h1>");
                    return;
                }

                con.close();
            } catch (Exception e) {

                out.println(e);
            }
        }
    }
}