<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiwangi","shiwangi");
    String p= request.getParameter("questionj");
    String num=(String)session.getAttribute("no");
    String query="update javaques set ques=? where quesno=?";
    PreparedStatement ps=conn.prepareStatement(query);
    ps.setString(1,p);
    ps.setString(2,num);   
    ps.executeUpdate();
    conn.close();
    out.println("Record updated");
%>
<a href="admin.jsp">Back</a>