<%@page import="com.cetpa.DateTimeFinder"%>
<%@page import="java.sql.*"%>
<%@ include file="../csslink.html" %>
<html>
<%
 int tamount=Integer.parseInt(request.getParameter("amount"));
 String accountno=(String)session.getAttribute("accountno");
 //Statements to get balance amount from accountinfo
 PreparedStatement ps=(PreparedStatement)application.getAttribute("selectAmount");
 ps.setString(1,accountno);
 ResultSet rst=ps.executeQuery();
 rst.next();
 int bamount=rst.getInt(1);
 if(tamount>bamount)
 {
	 %>
	 <jsp:include page="transfer-money-continue2.jsp">
	  <jsp:param value="<%=tamount%>" name="amount"/>
	  <jsp:param value="Soryy!!! you do not have sufficient amount" name="msg"/>
	 </jsp:include>
	 <%
	 return;
 }
 //Commands to update amount in accountinfo
 PreparedStatement withdraw=(PreparedStatement)application.getAttribute("updateAmount");
 withdraw.setInt(1,-tamount);
 withdraw.setString(2,accountno);
 withdraw.executeUpdate();
 
 String ran=(String)session.getAttribute("ran");
 withdraw.setInt(1,tamount);
 withdraw.setString(2,ran);
 withdraw.executeUpdate();
 
//Commands to insert record in tsummary table
 PreparedStatement saveStatement=(PreparedStatement)application.getAttribute("insertStatement");
 saveStatement.setString(1,accountno);
 saveStatement.setInt(2,tamount);
 String date=DateTimeFinder.getCurrentDate();
 saveStatement.setString(3,date);
 String time=DateTimeFinder.getCurrentTime();
 saveStatement.setString(4,time);
 saveStatement.setString(5,"Transfer");
 saveStatement.setString(6,ran);
 saveStatement.executeUpdate();
 
 //Command to get current tid from tsummary
 Statement st=(Statement)application.getAttribute("st");
 ResultSet rst1=st.executeQuery("select max(tid) from tsummary");
 rst1.next();
 int tid=rst.getInt(1);
 %>
 <body>
 <div class='dvv'>
   <label class='lah' style="color:green;text-decoration:underline;">Transfer Money Success</label>
   <a href="/banking-app" style="font-size:2vw;text-decoration: underline;margin-left:1vw">HOME</a>
  </div>  
 <table style="margin:auto;margin-top:2vw;border-collapse: collapse;font-size:1.8vw;width:45%" border="1" cellpadding="5px">
	 <tr style="background-color:coral;color:white">
		<th colspan="2" style="text-align: center;">Transaction Details</th>
	 </tr>
	 <tr>
		 <th align="left">Transaction id</th>
		 <td><%=tid%></td>
	 </tr>
	 <tr>
		 <th align="left">Sender Name</th>
		 <td><%=session.getAttribute("username")%></td>
	 </tr>
	 <tr>
		 <th align="left">Sender Account no</th>
		 <td><%=accountno%></td>
	 </tr>
	 <tr>
		 <th align="left">Receiver Name</th>
		 <td><%=session.getAttribute("name")%></td>
	 </tr>
	 <tr>
		 <th align="left">Receiver Account no</th>
		 <td><%=ran%></td>
	 </tr>
	 <tr>
		 <th align="left">Amount</th>
		 <td style="color:red">&#8377;<%=tamount%></td>
	 </tr>
	 <tr>
		 <th align="left">Type</th>
		 <td style="color:red">Transfer</td>
	 </tr>
	 <tr>
		 <th align="left">Date</th>
		 <td><%=date%></td>
	 </tr>
	 <tr>
		 <th align="left">Time</th>
		 <td><%=time%></td>
	 </tr>
 </table>
 </body>
