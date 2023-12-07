import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;


public class update extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession ss = request.getSession(false);
        String uname = (String)ss.getAttribute("username");


        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        if (!uname.equals(username)) {
            out.println("<h1>Access Denied! for "+username+ "you are logged in as "+uname+"</h1>");
        }
        else {
            try {

                Class.forName("com.mysql.jdbc.Driver");

                String url = "jdbc:mysql://127.0.0.1/user_info";

                Connection con = DriverManager.getConnection(url, "root", "root");

                Statement st = con.createStatement();

                String query = "Select * from posts where id='"+id+"'";

                ResultSet rs = st.executeQuery(query);

                if (rs.next()) {

                    int ID=rs.getInt("id");
                    String heading = rs.getString("title");
                    String descrip = rs.getString("description");

                    String sql = "UPDATE posts SET description ='"+description+"', title = '"+title+"' WHERE ID='"+id+"'";

                    int a = st.executeUpdate(sql);

                    if(a==1)
                    {
                        response.sendRedirect("home.jsp");
                    }
                }
                else{
                    out.println("<h1>No Record Found!</h1>");
                    return;
                }
                st.close();
                con.close();
            } catch (Exception e) {

                out.println(e);
            }

        }

    }
}
