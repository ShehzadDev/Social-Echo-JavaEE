import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
import java.io.*;

public class logout extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession(false);
        if(session!=null){
            session.invalidate();
            response.sendRedirect("login.jsp");
        }
        out.close();
    }
}