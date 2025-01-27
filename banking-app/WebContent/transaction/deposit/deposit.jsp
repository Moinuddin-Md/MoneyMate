<%@page import="com.cetpa.DateTimeFinder"%>
<%@page import="java.sql.*"%>
<%@ include file="../csslink.html" %>
<html>
<%
 //Command to update amount in accountinfo
 int amount=Integer.parseInt(request.getParameter("amount"));
 String accountno=(String)session.getAttribute("accountno");
 PreparedStatement deposit=(PreparedStatement)application.getAttribute("updateAmount");
 deposit.setInt(1,amount);
 deposit.setString(2,accountno);
 deposit.executeUpdate();
 
//Commands to insert record in tsummary table
PreparedStatement depositStatement=(PreparedStatement)application.getAttribute("insertStatement");
depositStatement.setString(1,accountno);
depositStatement.setInt(2,amount);
String date=DateTimeFinder.getCurrentDate();
depositStatement.setString(3,date);
String time=DateTimeFinder.getCurrentTime();
depositStatement.setString(4,time);
depositStatement.setString(5,"Credit");
depositStatement.setString(6,accountno);
depositStatement.executeUpdate();

//Command to get current tid from tsummary table
Statement st=(Statement)application.getAttribute("st");
ResultSet rst=st.executeQuery("select max(tid) from tsummary");
rst.next();
int tid=rst.getInt(1);
 %> 
 <body>
 <div class='dvv'>
   <label class='lah' style="color:green;text-decoration:underline;">Deposit Money Success</label>
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
		 <th align="left">Name</th>
		 <td><%=session.getAttribute("username")%></td>
	 </tr>
	 <tr>
		 <th align="left">Account no</th>
		 <td><%=accountno%></td>
	 </tr>
	 <tr>
		 <th align="left">Amount</th>
		 <td style="color:darkgreen">&#8377;<%=amount%></td>
	 </tr>
	 <tr>
		 <th align="left">Type</th>
		 <td style="color:darkgreen">Credit</td>
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
</html>