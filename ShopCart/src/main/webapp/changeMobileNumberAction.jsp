<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String email= session.getAttribute("email").toString();
String mobileNumber = request.getParameter("mobileNumber");
String password = request.getParameter("password");
int chek=0;
try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs1 = st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'"); 
	while(rs1.next()){
		chek=1;
		st.executeUpdate("update users set mobilenumber='"+mobileNumber+"' where email='"+email+"'");
		response.sendRedirect("changeMobileNumber.jsp?msg=done");
	}
	if(chek==0){
		response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
	}
}
catch(Exception e){
	System.out.println(e); 
}
%>
