<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,java.sql.*;" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<form action="">
<font>username</font>
<input type="text" name="txt_1"><br>
<font>password</font>
<input type="text" name="txt_2">
<input type="submit" name="button1" value="submit">
<table border="1">


<%
String uname="ff";
String pass="fff";
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sayantan01","123");
	  Statement st=c.createStatement();
      System.out.println(c);

   ResultSet rs=st.executeQuery("select username,password from register01 where username='"+"sayantan"+"'");
    	while(rs.next()){%>
    
    	<tr>
    	<td>
    	<%=rs.getString(1) %>
    	</td>
    	<td><%=rs.getString(2) %></td>
    	</tr>
    <%	}
}catch(Exception e){
	System.out.println(e);
}
%>
</table>
</form>
</html>