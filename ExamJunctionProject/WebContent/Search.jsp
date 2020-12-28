<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="Home.html"></jsp:include>
<form>
Enter your Age :<input  type="text" name="t1" required placeholder="Enter Age" autofocus><br>
Select Your Education:<br>
<select name="t2">
<option selected disabled>Select</option>
<option>B.tech(IT,CS)</option>
<option>M.tech(IT,CS)</option>
<option>Phd</option>
<option>MBA</option>
<option>B.sc</option>
<option>Metric(10th)</option>
<option>(10+2)</option>
</select>
<br>
Select your Interest:<br>
<select name="t3">
<option selected disabled>Select</option>
<option>Army</option>
<option>Navy</option>
<option>Banking</option>
<option>PSU</option>
<option>Teaching</option>
</select><br>
<input type="submit" name="b1" value="submit">
</form>
<%
if(request.getParameter("b1")!=null){
	try{
		
		String MinAge=request.getParameter("t1");
		String MinEducation=request.getParameter("t2");
		String Interest=request.getParameter("t3");
		Class.forName("org.postgresql.Driver");
		Connection cn=DriverManager.getConnection(
				"jdbc:postgresql://localhost:5432/postgres",
				"postgres","postgres");
		String sql="select * from examentry where minage <'"+MinAge+"' and  mineducation='"+MinEducation+"'and  interest ='"+Interest+"'";
		Statement stmt=cn.createStatement();
		out.println("<table><tr><th>Name</th><th>MinAge</th><th>MaxAge</th><th>MinEducation</th><th>Interest</th></tr>");
		ResultSet rs=stmt.executeQuery(sql);
		while(rs.next()){
			out.println("<tr>");
			out.println("<td>"+rs.getString(1)+"</td>");
			out.println("<td>"+rs.getString(2)+"</td>");
			out.println("<td>"+rs.getString(3)+"</td>");
			out.println("<td>"+rs.getString(4)+"</td>");
			out.println("<td>"+rs.getString(5)+"</td>");
		}
		out.println("</table>");
		stmt.close();
		cn.close();
	}catch(Exception ex){
		
	}
}
%>
</body>
</html>