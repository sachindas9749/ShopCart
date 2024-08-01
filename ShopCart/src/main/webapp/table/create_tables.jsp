<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<% 
	try{
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		String q1="create table users(name varchar(150),email varchar(100)primary key,mobilenumber bigint,securityQuestion varchar(200),answer varchar(200),password varchar(200),address varchar(500),city varchar(100),state varchar(100),country varchar(100))";
		String q2="create table product(id int,name varchar(500),category varchar(200),price int,active varchar(10))";
		String q3="create table cart(email varchar(100),product_id int,quantity int,price int,total int,address varchar(200),city varchar(200),state varchar(100),country varchar(100),mobilenumber bigint,orderDate varchar(100),deliveryDate varchar(100),paymentMethod varchar(100),transactionId varchar(100),status varchar(10))";
		System.out.print(q1);
		//st.execute(q1);
		System.out.println("Table Created");
		System.out.println(q1);
		//st.execute(q2);
		System.out.println(" product Table Created");
		System.out.println(q3);
		st.execute(q3);
		System.out.println(" cart Table Created");
		con.close();
	}
	catch(Exception e){
		System.out.print(e);
	}







%>