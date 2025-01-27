<%@page import="java.sql.*"%>
<html>
<head>
  <link href='/banking-app/CSS/style.css' rel='stylesheet'>
</head>
<body class='bgi'>
 <%
  //Command to save user details into userinfo table
  String uid=request.getParameter("userid");
  String name=request.getParameter("name");
  PreparedStatement psSaveUser=(PreparedStatement)application.getAttribute("insertUserInfo");
  psSaveUser.setString(1,uid);
  psSaveUser.setString(2,request.getParameter("password"));
  psSaveUser.setString(3,name);
  psSaveUser.setString(4,request.getParameter("phone"));
  psSaveUser.setString(5,request.getParameter("address"));
  psSaveUser.executeUpdate();
  
  //Command to save user's account details into accountinfo table
  PreparedStatement psSaveAccount=(PreparedStatement)application.getAttribute("insertAccountInfo");
  psSaveAccount.setString(1,uid);
  psSaveAccount.setInt(2,0);
  psSaveAccount.executeUpdate();
  
  //Command to get account number of current user from accountinfo table
  PreparedStatement ps=(PreparedStatement)application.getAttribute("selectAccountNo");
  ps.setString(1,uid);
  ResultSet rst=ps.executeQuery();
  rst.next();
  int accountno=rst.getInt(1);
%>  
 <div class='dvv'>
   <label class='lah' style='color:white;text-decoration:underline;font-size:2.5vw'>User Registration</label>
  </div>
  <hr>
 <div class='dv'>
  <label class='lah' style='color:white'>Congratulations!!!<%=name%></label>
 </div>
 <div class='dv'>
  <label class='lah' style='color:white'>Your account has been created successfully</label>
 </div>
 <div class='dv'>
  <label class='lah' style='color:white'>Your account number is <%=accountno%></label>
 </div>
 <div class='dvv'>
   <a href='login-form.jsp' class='btl'>Click to Login</a>
 </div>
</body>
</html>