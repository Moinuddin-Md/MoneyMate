<%@page import="java.sql.*"%>
<%@ include file="/../../../menu.jsp" %>
<html>
 <body onload="makeActive('balance')">
 <%
 PreparedStatement ps=(PreparedStatement)application.getAttribute("selectAmount");
 ps.setObject(1,session.getAttribute("accountno"));
 ResultSet rst=ps.executeQuery();
 rst.next();
 int amount=rst.getInt(1);
 %> 
 <div class='dv'>
  <h2 style='color:green;font-family:cursive'>
  	Hello, <span><%=session.getAttribute("username")%></span> your current balance amount is 
    <span>&#8377;<%=amount%></span>
  </h2>
 </div>
 </body>
</html>