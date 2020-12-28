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
Exam Name : <input  type="text" name="t1" required placeholder="Enter Name" autofocus><br>
Min Age eligibility : <input type="number" name="t2" required placeholder="Enter Age"><br>
Max Age eligibility : <input type="number" name="t3" required placeholder="Enter Age"><br>
Minimum Education :<input type="text" name="t4" required placeholder="Enter Education"><br>
Interest :<input type="text" name="t5" required placeholder="Enter Interest"><br>
<br>
<input type="submit" name="b1" value="submit">
</form>
<%
if(request.getParameter("b1")!=null){
	try{
		String Ename=request.getParameter("t1");
		String MinAge=request.getParameter("t2");
		String MaxAge=request.getParameter("t3");
		String MinEducation=request.getParameter("t4");
		String Interest=request.getParameter("t5");
		
		Class.forName("org.postgresql.Driver");
		Connection cn=DriverManager.getConnection(
				"jdbc:postgresql://localhost:5432/postgres",
				"postgres","postgres");
		String sql="insert into  examentry values('"+Ename+"','"+MinAge+"','"+MaxAge+"','"+MinEducation+"','"+Interest+"')";
		Statement stmt=cn.createStatement();
		stmt.execute(sql);
		stmt.close();
		cn.close();
		out.println("Record Saved...");
	}catch(Exception ex){
		out.println(ex);
		
	}
}
%>
</body>
</html>