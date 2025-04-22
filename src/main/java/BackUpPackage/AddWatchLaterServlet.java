package BackUpPackage;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/AddToWatchLaterServlet")
public class AddWatchLaterServlet extends HttpServlet {
 
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String movieId = request.getParameter("movieId");
        

        boolean isTrue ;
        
        isTrue= WatchLaterController.insertdata(userId, movieId);

        if (isTrue==true) {
        	String alertMessage = "Data Insert Successfull";
            response.getWriter().println("<script>alert('"+alertMessage+"'); window.location.href='watchLater.jsp'; </script>");
        } else {
           RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
           dis2.forward(request, response);
        }
    }
}
