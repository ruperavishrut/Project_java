<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.util.DBUtil" %>
<% 
	String id=request.getParameter("id");
	Connection con=new DBUtil().getDatabaseConnection();
	Statement stmt=con.createStatement();
	
	String sql="select image from user where uid="+id;
	
	ResultSet rs=stmt.executeQuery(sql);
	
	if(rs.next())
	{
		Blob blob=rs.getBlob("image");
		byte byteArray[]= blob.getBytes(1, (int)blob.length());
		response.setContentType("image/jpg");
		OutputStream os=response.getOutputStream();
		os.write(byteArray);
		os.flush();
		os.close();
	}
	
	else
	{
		
	}
		
%>
</body>
</html>