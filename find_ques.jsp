<form action="find_ques.jsp" method="post">
    <b>Choose the language - </b>
    C <input type="radio" name="lang" value="c">
    Java <input type="radio" name="lang" value="java">
    <input type="submit" name="sub" value="Submit">
</form>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiwangi","shiwangi");
    String l=request.getParameter("lang");
    if(l.equals("c"))
    {
        String query="select no_c from admin";
        PreparedStatement ps=conn.prepareStatement(query);
        ResultSet rs=ps.executeQuery();
        if(rs.next())
        {
            String no=rs.getString("no_c");
            out.println("No Of Students Appeared for C test are: "+no);
        }  
    }
    else if(l.equals("java"))
    {
        String query1="select no_java from admin";
        PreparedStatement ps=conn.prepareStatement(query1);
        ResultSet rs=ps.executeQuery();
        if(rs.next())
        {
            String no=rs.getString("no_java");
            out.println("No Of Students Appeared for Java test are: "+no);
        }  
    }
%>