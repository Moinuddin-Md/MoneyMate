package com.cetpa;
import java.sql.*;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;


@WebListener
public class ConnectionListener implements ServletContextListener
{
	Statement st;
	ServletContext context;
	Connection cn;
	public void contextInitialized(ServletContextEvent evt)
	{
		context=evt.getServletContext();
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp5?createDatabaseIfNotExist=true","root","root");
			st=cn.createStatement();
			context.setAttribute("st",st);
			createTable();
			createLoginPreparedStatement();
			createTransactionPreparedStatement();
			System.out.println("Listener called");
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
	}
	private void createTable()throws Exception
	{
		st.execute("create table if not exists userinfo(userid varchar(30) primary key,password varchar(20),username varchar(30),phone varchar(20),address varchar(50))");
		st.execute("create table if not exists accountinfo(accountno int primary key auto_increment,userid varchar(30),amount int)auto_increment=11111");
		st.execute("create table if not exists tsummary(tid int primary key auto_increment,fromaccount int,amount int,date varchar(20),time varchar(20),type varchar(20),toaccount int)auto_increment=123456");
	}
	private void createLoginPreparedStatement()throws Exception
	{
		PreparedStatement psInsertUserInfo=cn.prepareStatement("insert into userinfo values(?,?,?,?,?)");
		context.setAttribute("insertUserInfo",psInsertUserInfo);
		PreparedStatement psInsertAccountInfo=cn.prepareStatement("insert into accountinfo(userid,amount) values(?,?)");
		context.setAttribute("insertAccountInfo",psInsertAccountInfo);
		PreparedStatement psSelectAccountNo=cn.prepareStatement("select accountno from accountinfo where userid=?");
		context.setAttribute("selectAccountNo",psSelectAccountNo);
		//PreparedStatement psSelectUser=cn.prepareStatement("select * from userinfo where userid=?");
		PreparedStatement psSelectUser=cn.prepareStatement("select password,username,accountno from userinfo u join accountinfo a on u.userid=a.userid where u.userid=?");
		context.setAttribute("selectUser",psSelectUser);
	}
	private void createTransactionPreparedStatement()throws Exception
	{
		PreparedStatement psSelectAmount=cn.prepareStatement("select amount from accountinfo where accountno=?");
		context.setAttribute("selectAmount",psSelectAmount);
		PreparedStatement psUpdateAmount=cn.prepareStatement("update accountinfo set amount=amount+? where accountno=?");
		context.setAttribute("updateAmount",psUpdateAmount);
		PreparedStatement psInsertStatement=cn.prepareStatement("insert into tsummary(fromaccount,amount,date,time,type,toaccount) values(?,?,?,?,?,?)");
		context.setAttribute("insertStatement",psInsertStatement);
		PreparedStatement psViewStatement=cn.prepareStatement("select * from tsummary where fromaccount=? or toaccount=?");
		context.setAttribute("viewStatement",psViewStatement);
		PreparedStatement psCheckAccountNo=cn.prepareStatement("select username from userinfo ui join accountinfo ai on ui.userid=ai.userid where accountno=?");
		context.setAttribute("checkAccountNo",psCheckAccountNo);
	}
}
