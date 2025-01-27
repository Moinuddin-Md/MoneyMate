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
   <label class='lah' style="color:green;text-decoration:underline;">Withdraw Money</label>
   <a href="/banking-app" style="font-size:2vw;text-decoration: underline;margin-left:1vw">HOME</a>
  </div> 
 <form action="withdraw.jsp"> 
  <table class='ta' style="background-color:cyan;color:black">
    <tr>
     <td class='td'>Enter amount:</td>
     <td class='td'><input type='number' value='<%=amount%>' name='amount' class='tb' required></td>
     <td class='td'><button class='bt'>Submit</button></td>
    </tr>
   </table>
  </form> 
  <div class="dvv">
	  <label style="font-size:1.8vw;color:red"><%=msg%></label>
  </div>
 </body>
</html>