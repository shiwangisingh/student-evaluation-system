<%@page import="java.util.Objects"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    String query;
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiwangi","shiwangi");
    String n=request.getParameter("getans");
    String a=request.getParameter("new");
    String num=(String)session.getAttribute("no");
    if(Objects.equals(n,"option1"))
    {
        query="update cques set ans1=? where quesno=?";
        PreparedStatement ps=conn.prepareStatement(query);
        ps.setString(1,a);
        ps.setString(2,num);  
        ps.executeUpdate();
    }
    else if(Objects.equals(n,"option2"))
    {
        query="update cques set ans2=? where quesno=?";
        PreparedStatement ps=conn.prepareStatement(query);
        ps.setString(1,a);
        ps.setString(2,num);
        ps.executeUpdate();
    }
    else if(Objects.equals(n,"option3"))
    {
        query="update cques set ans3=? where quesno=?";
        PreparedStatement ps=conn.prepareStatement(query);
        ps.setString(1,a);
        ps.setString(2,num);
        ps.executeUpdate();
    }
    else if(Objects.equals(n,"option4"))
    {
        query="update cques set ans4=? where quesno=?";
        PreparedStatement ps=conn.prepareStatement(query);
        ps.setString(1,a);
        ps.setString(2,num);
        ps.executeUpdate();
    }
    else if(Objects.equals(n,"canswer"))
    {
        query="update cques set correctans=? where quesno=?";
        PreparedStatement ps=conn.prepareStatement(query);
        ps.setString(1,a);
        ps.setString(2,num);
        ps.executeUpdate();
    }
    conn.close();
    out.println("Record updated");
%>
<a href="admin.jsp">Back</a>