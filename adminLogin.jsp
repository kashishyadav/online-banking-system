<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<body background="sa.jpg">
<form action="test_update.jsp">
<input type="hidden" name="txt" value=<%=request.getParameter("txt_1") %>>

<% //String s2=request.getParameter("txt_1");
	//String s2="sas";
	//String s3="asss";
	String username=request.getParameter("txt_username");
	String password=request.getParameter("txt_password");
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sayantan01","123");
	  Statement st=c.createStatement();
      System.out.println(c);
      //System.out.println(s2);

   ResultSet rs=st.executeQuery("select * from register_admin where username='"+username+"'and password='"+password+"'");
	if(rs.next())
	{
		
		%><p><font color="white" size="6">USERNAME</font></p>
		<input type="text" name="txt_2" value="<%=rs.getString(1) %>">
		<p><font color="white" size="6">password</font></p>
		<input type="text" name="txt_3" value="<%=rs.getString(2) %>">
		<p><font color="white" size="6">NAME</font></p>
		<input type="text" name="txt_4" value="<%=rs.getString(3) %>">
		<p><font color="white" size="6">PANNO</font></p>
		<input type="text" name="txt_5" value="<%=rs.getString(4) %>>">
		<p><font color="white" size="6">ADHARNO</font></p>
		<input type="text" name="txt_6" value="<%=rs.getString(5) %>>">
		<p><font color="white" size="6">ACCOUNTNO</font></p>
		<input type="text" name="txt_6" value="<%=rs.getString(6) %>">
		<p><font color="white" size="6">BALANCE</font></p>
		<input type="text" name="txt_7" value="<%=rs.getString(7) %>">
	
		
		<a href="test4.jsp?id=<%request.getParameter("txt_1");%>"><font color="red" size="5">CHECK USER BALANCE</font></a>
		<a href="AdminDeposi.jsp?id=<%=rs.getString(1) %>"><font color="blue" size="5">WITHDRAL</font></a>
		<a href="AdminDepo.jsp?id=<%=rs.getString(1) %>"><font color="yellow" size="5">DEPOSIT</font></a>
		<a href="Depo.jsp?id=<%=rs.getString(1) %>"><font color="red" size="5">LOGOUT</font></a>
			<%System.out.println(rs.getString(1)); }
	else
	{%>
		Invalid login
	<%
		RequestDispatcher rd=request.getRequestDispatcher("login.html");
		rd.forward(request, response);
		}
}catch(Exception e){System.out.println(e);
RequestDispatcher rd=request.getRequestDispatcher("login.html");
rd.forward(request, response);

}
%>
</form>

</body>
</html>