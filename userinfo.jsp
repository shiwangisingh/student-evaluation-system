<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn=DriverManager.
    getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiwangi","shiwangi");
    String query="select name,mobileno,email_id,java_marks,c_marks from user_info";
   Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(query);
    while(rs.next())
    {
        String u=rs.getString("NAME");
        String m=rs.getString("MOBILENO");
	String id=rs.getString("EMAIL_ID");
	int j= rs.getInt("JAVA_MARKS");
	int c= rs.getInt("C_MARKS");
	%>
        <b>Name : </b><% out.println(u);%><br>
        <b>Mobile Number: </b><% out.println(m);%><br>
        <b>Email-Id : </b><% out.println(id);%><br>
        <b>Java Marks : </b><% out.println(j);%><br>
        <b>C Marks : </b><% out.println(c);%><br>
        <%
    }
%>
