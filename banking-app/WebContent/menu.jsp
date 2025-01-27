<%
if(session.getAttribute("username")==null)
{
	response.sendRedirect("login/login-form.jsp");
	return;
}
%>
<html>
 <head>
  <link href='/banking-app/CSS/style.css' rel='stylesheet'>
  <link href='/banking-app/CSS/style1.css' rel='stylesheet'>
  <link href='/banking-app/CSS/bootstrap.min.css' rel='stylesheet'>
  <script src='/banking-app/JS/script.js'></script>
 </head>
 <body>
 <%
 String name=(String)session.getAttribute("username");
 String an=(String)session.getAttribute("accountno");
 %>
<img src="/banking-app/images/bank.jpg" style='height:28%;width:100%'>
<hr style='border:1px solid red'>
<table style="width:90%;margin:auto">
  <tr>
   <td align='center'><span class='na'>Account holder name:</span>
    	<span style='font-size:1.7vw'><%=name%></span>
   </td>
   <td align='center'><span class='na'>Account number:</span>
      <span id="userAccountNo" style='font-size:1.7vw'><%=an%></span>
    </td>
  </tr>
</table>
<input type="hidden" id="san" value="<%=an%>">
<hr style='border:1px solid red'>
<hr style='border:2px solid blue'>
<table class='tamn' border='1'>
 <tr>
  <td align='center'><a id='home' class='mna' href='/banking-app'>Home</a></td>
  <td align='center'><a id='balance' class='mna' href='/banking-app/transaction/balance/show-balance.jsp'>Show Balance</a></td>
  <td align='center'><a id='deposit' class='mna' href='/banking-app/transaction/deposit/deposit-money.jsp'>Deposit Money</a></td>
  <td align='center'><a id='withdraw' class='mna' href='/banking-app/transaction/withdraw/withdraw-money.jsp'>Withdraw Money</a></td>
  <td align='center'><a id='transfer' class='mna' href='/banking-app/transaction/transfer/transfer-money.jsp'>Transfer Money</a></td>
  <td align='center'><a class='mna' href='/banking-app/transaction/statement/summary.jsp'>View Statements</a></td>
  <td align='center'><a class='mna' href='/banking-app/login/logout.jsp'>Logout</a></td>
 </tr>
</table>
<hr style='border:2px solid blue'>
</body>
</html>