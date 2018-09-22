<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
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
response.setDateHeader("Expires",-1);
HttpSession sou=request.getSession();
String   username1=(String)sou.getAttribute("username");
if(username1!=null){
try{
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sayantan01","123");
	  Statement st=c.createStatement();
      System.out.println(c);
    //  HttpSession //sou=request.getSession();
  // String   username1=(String)sou.getAttribute("username");
   		System.out.println("username"+username1);
      //System.out.println(s2);
      String balance;
	String username=request.getParameter("id");
	System.out.println(username);
   ResultSet rs=st.executeQuery("select * from register_customer where username='"+username+"'");
   if(rs.next()){
	    balance=rs.getString(7);
   %>

<form action="Update.jsp">
	<p><font color="red" size="6">WITHDRAW AMOUNT</font></p>
	<input type="text" name="txt_withdral"><br>
	<input type="submit" value="ok">
	<input type="hidden" name="txt_balance" value=<%=rs.getString(7)%>>
	<input type="hidden" name="txt_username" value=<%=request.getParameter("id") %>>
	</form>
<%	}}catch(Exception e){
	System.out.println(e);
	
}
}else{
	%>
	<p><font color="red" size="10">404 not found</font></p>
	<% 
	
}
 %>
</body>
</html>