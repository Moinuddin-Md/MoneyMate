<%@ include file="../csslink.html" %>
<html>
 <body>
 <div class='dvv'>
   <label class='lah' style="color:orange;text-decoration:underline;">Deposit Money</label>
   <a href="/banking-app" style="font-size:2vw;text-decoration: underline;margin-left:1vw">HOME</a>
  </div> 
 <form action="deposit.jsp"> 
  <table class='ta' style="background-color:orange">
    <tr>
     <td class='td'>Enter amount:</td>
     <td class='td'><input type='number' name='amount' class='tb' required></td>
     <td class='td'><button class='bt'>Submit</button></td>
    </tr>
   </table>
  </form> 
  <div class="dvv">
	  <label style="font-size:1.8vw;color:red"></label>
  </div>
 </body>
</html>