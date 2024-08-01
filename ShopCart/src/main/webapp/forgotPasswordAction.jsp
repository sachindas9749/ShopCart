 <%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.* "%>
 <% 
  String email = request.getParameter("email");
  String mobileNumber = request.getParameter("mobileNo");
  String securityQuestion = request.getParameter("securityQuestion");
  String answer = request.getParameter("answer");
  String newpassword = request.getParameter("newPassword");
  int chk=0;
  try{
	  Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from users where email='"+email+"' and mobilenumber='"+mobileNumber+"' and securityQuestion='"+securityQuestion+"' and answer='"+answer+"'");
		while(rs.next()){
			chk=1;
			st.executeUpdate("update users set password='"+newpassword+"' where email='"+email+"'");
			session.setAttribute("email", email);
			response.sendRedirect("forgotPassword.jsp?msg=done");
		}
		if(chk==0)
		response.sendRedirect("forgotPassword.jsp?msg=Invalid");
  }
  catch(Exception e){
	  System.out.println(e);
  }
  %>