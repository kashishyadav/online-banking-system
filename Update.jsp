<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,java.util.*,java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-control", "no-store");
response.setHeader("Expires", "0");
response.setDateHeader("Expires",-1);//delete the browser memory//


String username=request.getParameter("txt_username");
String upval=request.getParameter("txt_withdral");
String mainv=request.getParameter("txt_balance");
System.out.println(username+upval+mainv);
String check=request.getParameter("txt_d");
System.out.println(check);
HttpSession session1=request.getSession();
String s12=(String)session.getAttribute("username");
	if(s12!=null){
try{
	int m=Integer.parseInt(mainv);
	int w=Integer.parseInt(upval);
	int n=0;
	//if(check.equals("depo"))
//	{
	//	n=m+w;
		//System.out.println(n);
	//}
	//else{
		//System.out.println(n);
	// n=m-w;}
	n=m-w;
	upval=String.valueOf(n);
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin://@localhost:1521:XE","sayantan01","123");
	PreparedStatement pst=conn.prepareStatement("update register_customer set balance='"+upval+"' where username='"+username+"'");
	if(n<0){
		RequestDispatcher d=request.getRequestDispatcher("CustDeposi.jsp");
		d.include(request, response);
	}
	else{
	pst.executeUpdate();}
	conn.close();	
}catch(Exception e){
	
}

%>
<form action="Logout">
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sayantan01","123");
	  Statement st=c.createStatement();
      System.out.println(c);
      //System.out.println(s2);

   ResultSet rs=st.executeQuery("select * from register_customer where username='"+username+"'");
	if(rs.next())
	{
%>

<input type="text" name="txt_username1" value="<%=rs.getString(1) %>">
<input type="text" name="txt_accountno" value="<%=rs.getString(6) %>">
<input type="text" name="txt_balance" value="<%=rs.getString(7) %>">
<input type="submit" name="button1" value="ok">
<%c.close(); 	}
}catch(Exception e){
	
}
	}else{%>
	404 not found
		<% 
	}

%>
</form>

</body>
</html>