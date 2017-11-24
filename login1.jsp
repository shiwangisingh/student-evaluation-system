<%@page import="java.util.Objects"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    String l=request.getParameter("login");
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn=DriverManager.
    getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiwangi","shiwangi");
    if(l.equals("admin"))
    {
        String u =request.getParameter("user");
        String p=request.getParameter("pass");
        String query="select * from admin where username=? and password=?";
        PreparedStatement ps=conn.prepareStatement(query);
        ps.setString(1,u);
        ps.setString(2,p);
        ResultSet r=ps.executeQuery();
        if(r.next())
        {
            out.println("<a href=admin.jsp>Click here to continue</a>");
        }
        else
        {
            out.println("<strong>invalid username/password</strong>");
            out.println("<a href=index1.html>Back</a>"); 
        }
    }
    else if(l.equals("user"))
    {
        String un =request.getParameter("user");
        session.setAttribute("name",un);
        String ps=request.getParameter("pass");
        String query="select * from user_info where name=? and password=?";
        PreparedStatement pst=conn.prepareStatement(query);
        pst.setString(1,un);
        pst.setString(2,ps);
        ResultSet rs=pst.executeQuery();
        if(rs.next())
        {
            out.println("<a href=user.jsp><h1>Click here to continue</h1></a>");
        }
        else
        {
            out.println("<strong>invalid username/password<strong>");
            out.println("<a href=index1.html>Back</a>");
        }
    }
%>
