<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%
    String m= request.getParameter("mobile");
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiwangi","shiwangi");
    String query = "select name,mobileno,email_id,java_marks,c_marks from user_info where mobileno =? ";
    PreparedStatement ps=conn.prepareStatement(query);
    ps.setString(1,m);
    ResultSet rs = ps.executeQuery();
    while(rs.next())
    {
	String u=rs.getString("name");
        String mob=rs.getString("mobileno");
	String id=rs.getString("email_id");
	String j= rs.getString("java_marks");
	String c= rs.getString("c_marks");
	%>
        <b>Name : </b><% out.println(u);%><br>
        <b>Mobile Number: </b><% out.println(m);%><br>
        <b>Email-Id : </b><% out.println(id);%><br>
        <b>Java Marks : </b><% out.println(j);%><br>
        <b>C Marks : </b><% out.println(c);%><br>
        <%
    }
%>
