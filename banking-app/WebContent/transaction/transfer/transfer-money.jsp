<%@ include file="../csslink.html" %>
<html>
 <body>
 <%
 String msg=request.getParameter("msg");
 String ran=request.getParameter("ran");
 if(msg==null)
	 msg=ran="";
 %> 
 <div class='dvv'>
   <label class='lah' style="color:green;text-decoration:underline;">Transfer Money</label>
   <a href="/banking-app" style="font-size:2vw;text-decoration: underline;margin-left:1vw">HOME</a>
  </div> 
 <form action="transfer-money-continue.jsp"> 
  <table class='ta' style="background-color:cyan;color:black">
    <tr>
     <td class='td'>Enter receiver account no:</td>
     <td class='td'><input type='number' value='<%=ran%>' name='raccountno' id="ran" class='tb' required></td>
     <td class='td'><button class='bt' onclick="return checkAccountNo()">Submit</button></td>
    </tr>
   </table>
   <input type="hidden" id="san" value="<%=session.getAttribute("accountno")%>">
  </form> 
  <div class="dvv">
	  <label id="msg" style="font-size:1.8vw;color:red"><%=msg%></label>
  </div>
 </body>
</html>