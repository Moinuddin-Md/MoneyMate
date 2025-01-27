<%@page import="java.sql.*"%>
<%@ include file="../csslink.html" %>
<html>
 <body>
 <%
 String msg=request.getParameter("msg");
 String amount=request.getParameter("amount");
 if(msg==null)
	 msg=amount="";
 %> 
 <div class='dvv'>
   <label class='lah' style="color:green;text-decoration:underline;">Transfer Money continue</label>
   <a href="/banking-app" style="font-size:2vw;text-decoration: underline;margin-left:1vw;margin-right:1vw">HOME</a>
   <input type='button' class='bt' style='background-color:orange' value='Back' onclick='history.back()'>
  </div> 
  <table style='width:30%;border:3px solid silver;margin:auto;font-size:25px' cellpadding="10px">
    <tr>
      <td><label style='color:orange'>Receiver account</label></td>
      <td align="right"><%=session.getAttribute("ran")%></td>
    </tr>
    <tr>  
      <td><label style='color:orange'>Receiver name</label></td>
      <td align="right"><%=session.getAttribute("name")%></td>
    </tr>  
  </table>
 <form action="transfer.jsp"> 
  <table class='ta' style="background-color:cyan;color:black">
    <tr>
     <td class='td'>Enter the amount:</td>
     <td class='td'><input type='number' value='<%=amount%>' name="amount" class='tb' required></td>
     <td class='td'><button class='bt'>Submit</button></td>
    </tr>
   </table>
  </form> 
  <div class="dvv">
	  <label id="msg" style="font-size:1.8vw;color:red"><%=msg%></label>
  </div>
 </body>
</html>