

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterAdmin
 */
@WebServlet("/RegisterAdmin")
public class RegisterAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("txt_username");
		String password=request.getParameter("txt_password");
		String name=request.getParameter("txt_name");
		String adharno=request.getParameter("txt_adhar");
		String panno=request.getParameter("txt_pan");
		String accountno=request.getParameter("txt_accountno");
		//System.out.println(s1+s2);
		String balance="1000";
		 HttpSession s=request.getSession();
	     s.setAttribute("username", username);
	     s.setAttribute("password", password);
	     PrintWriter out=response.getWriter();
	     try {
	    	 Class.forName("oracle.jdbc.driver.OracleDriver");
	    	Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sayantan01","123");
	        PreparedStatement pst=con.prepareStatement("insert into register_admin(username,password,name,adharno,panno,accountno,balance) values('"+username+"','"+password+"','"+name+"','"+adharno+"','"+panno+"','"+accountno+"','"+balance+"')");
	       int i=pst.executeUpdate();
	       if(i>0)
	       {
	    	   response.setContentType("text/html");
	    	   out.println("Successfully !!");
	    	  out.println("<body background='c.png'>");
	    	  out.println("<p>successfully registered</p><br><br>");
	    	   out.println("<div>");
	    	   out.println("<form action='on.html'>");
	    	   out.println("<input type='submit' value='NEXT'>");
	    	   out.println("</div>");
	    	   out.println("</body>");
	    	 //  RequestDispatcher d=request.getRequestDispatcher("ka");
	    	  // d.forward(request, response);
	    	   
	       }
	       else
	       {
	    	   out.println("invalid register");
	    	   RequestDispatcher d=request.getRequestDispatcher("Admin_register.html");
	    	   d.forward(request, response);
	       }
	       con.close();
	     }catch(Exception e) {
	    	 out.println("invalid register");
	    	   RequestDispatcher d=request.getRequestDispatcher("Admin_register.html");
	    	   d.forward(request, response);
	    	 System.out.println(e);}		
			}

}
