<%@page import="java.sql.*"%>
<html>
<head>
  <link href='/banking-app/CSS/style.css' rel='stylesheet'>
  <link href='/banking-app/CSS/bootstrap.min.css' rel='stylesheet'>
</head>
<body class='bgi'>
 <%
 String uid=request.getParameter("userid");
 PreparedStatement psSelectUser=(PreparedStatement)application.getAttribute("selectUser");
 psSelectUser.setString(1,uid);
 ResultSet rst=psSelectUser.executeQuery();
 if(rst.next())
 {
	 String fpassword=request.getParameter("password");
	 String dpassword=rst.getString(1);
	 if(fpassword.equals(dpassword))
	 {
		 String name=rst.getString("username");
		 String an=rst.getString(3);
		 session.setAttribute("username",name);
		 session.setAttribute("accountno",an);
		 response.sendRedirect("/banking-app");
	 }
	 else
	 {
		 %>
		 <jsp:include page="login-form.jsp">
		   <jsp:param name="msg" value="Password is wrong" />
   		   <jsp:param name="userid" value="<%=uid%>" />
		 </jsp:include>
		 <% 
	 }
 }
 else
 {
	 %>
	 <jsp:include page="login-form.jsp">
	   <jsp:param name="msg" value="User id does not exist" />
	   <jsp:param name="userid" value="<%=uid%>" />
	 </jsp:include>
	 <%
 }
 %>
</body>
</html>
