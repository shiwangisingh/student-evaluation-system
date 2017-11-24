<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Objects"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<form action="delete_ques.jsp" method="post">
    Choose the language:<select name="option">
        <option value="c">C</option>
        <option value="java">Java</option>
    </select><br>
    Enter the question number to be deleted: <input type="number" name="quesno"><br>
    <input type="submit" name="get" value="submit">
</form>
<%
   String query; 
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn=DriverManager.
    getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiwangi","shiwangi");
    String o= request.getParameter("option");
    String m= request.getParameter("quesno");
    if(Objects.equals(o,"c"))
    {
        query="delete from cques where quesno=?";
        PreparedStatement ps=conn.prepareStatement(query);
        ps.setString(1,m);
        ps.executeUpdate();
    }
    else if(Objects.equals(o,"java"))
    {
        query="delete from javaques where quesno=?";
        PreparedStatement ps=conn.prepareStatement(query);
        ps.setString(1,m);
        ps.executeUpdate();
    }
%>