<%@page import="java.sql.*"%>
<%@ include file="../csslink.html" %>
<html>
 <body>
 <%
 String ran=request.getParameter("raccountno");
 PreparedStatement ps=(PreparedStatement)application.getAttribute("checkAccountNo");
 ps.setString(1,ran);
 ResultSet rst=ps.executeQuery();
 if(rst.next())
 {
	 session.setAttribute("ran",ran);
	 session.setAttribute("name",rst.getString("username"));
	 response.sendRedirect("transfer-money-continue2.jsp");
 }
 else
 {
	 %>
	 <jsp:include page="transfer-money.jsp">
	  <jsp:param value="<%=ran%>" name="ran"/>
	  <jsp:param value="Soryy!!! Receiver account no does not exist" name="msg"/>
	 </jsp:include>
	 <%
	 return;
 }
 %>
 </body>
</html>