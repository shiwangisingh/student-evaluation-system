<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<form>
    Enter the mobile number of the user to deleted: <input type="number" name="mobile">
    <input type="submit" name="get" value="submit">
</form>
<%
    String m= request.getParameter("mobile");
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn=DriverManager.
    getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiwangi","shiwangi");
    String l =request.getParameter("mobile");
    String query="delete from user_info where mobileno=?";
    PreparedStatement ps= conn.prepareStatement(query);
    ps.setString(1,l);
    ps.executeUpdate();
    conn.close();
%>
<a href="admin.jsp">Back</a>