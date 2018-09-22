

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CustomerLogin
 */
@WebServlet("/CustomerLogin")
public class CustomerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("txt_username");
		String password=request.getParameter("txt_password");
		username="sas";
		password="asss";
		try {
	    	 Class.forName("oracle.jdbc.driver.OracleDriver");
	    	Connection c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sayantan01","123");
	       Statement st=c.createStatement();
	       System.out.println(c);
	       ResultSet rs=st.executeQuery("select * from register_customer where username='"+username+"' and password='"+password+"'");
	     
	     
	     
	    System.out.print(rs.next());
	    if(rs.next()){
	    	System.out.print(rs.getString(1)+rs.getString(2));
	    	
	    }
	    c.close();
	    //System.out.println(rs.getString(1));
	  //  if (rs.next()) {
	//    	 response.sendRedirect("welcome");
	    // rd.forward(request, response);
	//}
	 //   else {
	    	// RequestDispatcher rd1 = request.getRequestDispatcher("NewFile123.html");
	    // rd1.include(request, response);
	     //out.println("invalid input!!");
	//}
	     }catch(Exception e) {System.out.println(e);}
		
	}

}
