<%@page import="com.cetpa.Column"%>
<%@page import="java.sql.*"%>
<%@ include file="../csslink.html" %>
<html>
   <head>
    <style>
     a{
     	text-decoration:underline !important;
     	font-size:1.6vw;
     }
    </style> 
   </head>
   <body>
     <%
     PreparedStatement ps=(PreparedStatement)application.getAttribute("viewStatement");
     ps.setObject(1,session.getAttribute("accountno"));
     ps.setObject(2,session.getAttribute("accountno"));
     ResultSet rst=ps.executeQuery();
     %>
     <div class='dvv'>
   		<label class='lah' style="color:blue">Transaction Summary of <span><%=session.getAttribute("username")%></span></label>
        <br><br>
        <%
        if(!rst.next()){
        %>
   	      <label style="color:red" class="lah">No transaction made yet!!!</label>
   	   <%}
        else{%>  	
   	  </div> 
      <div class='container'>
      <div class='card col-md-12 mx-auto' style='border:3px solid silver'>
  	    <div class='card-body'>
  	      <div class='table scrollit'>
  	        <table class='table table-hover'>
  	          <thead>
  	            <tr>
  	      		  <th>S.No</th><th>From account</th><th>Amount</th><th>Date</th>
  	      	      <th>Time</th><th>Type</th><th>To account</th>
  	            </tr>
  	          </thead>
  	          <tbody>
  	         <%
  	         int ctr=0;
  	         do{ %>
  	         <tr> 
				<td><%=++ctr%></td>	 
  	        	<td><%=rst.getString(Column.fromaccount.toString())%></td>
  	        	<td>&#8377;<%=rst.getString("amount")%></td>
  	        	<td><%=rst.getString("date")%></td>
  	        	<td><%=rst.getString("time")%></td>
  	        	<td><%=rst.getString(Column.type.toString())%></td>
  	        	<td><%=rst.getString(7)%></td>
  	       	 </tr>
  	       	 <%}
  	         while(rst.next());
  	         %>
	     </tbody> 
  	    </table>
  	   </div> 	
  	  </div>
  	</div>
  </div>
  <%}%>
  <div style="text-align: center;margin-top: 1vw">
	  <input type="button" class="btn btn-secondary" value="Home" onclick="history.back()">
  </div>
   </body>
 </html>