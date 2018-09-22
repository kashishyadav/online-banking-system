

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Logout
 */
@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Logout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-control", "no-store");
		response.setHeader("Expires", "0");
		response.setDateHeader("Expires",-1);//delete the browser memory//
		PrintWriter out=response.getWriter();	
		HttpSession s=request.getSession();
		String username=(String)s.getAttribute("username");
		if(username!=null){
		//PrintWriter out=response.getWriter();
		s.invalidate();
		
		 RequestDispatcher rd = request.getRequestDispatcher("on.html");
	     rd.include(request, response);
	     out.println("logged out succesfully!!");
				}
		else{
			response.setContentType("text/html");
			out.println("<body>");
			out.println("<p>404 not found</p>");
			out.println("</body>");
		}
			}

	

}
