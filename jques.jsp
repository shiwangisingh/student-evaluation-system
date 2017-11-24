<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    String query;
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiwangi","shiwangi");
    int i=(Integer)session.getAttribute("a");
    if(i<10)
    {
    query="select ques,ans1,ans2,ans3,ans4,correctans from javaques where quesno='"+i+"'";
    PreparedStatement ps= conn.prepareStatement(query);
    ResultSet rs=ps.executeQuery();
    if(rs.next())
    {
        String q=rs.getString("ques");
        String a1=rs.getString("ans1");
        String a2=rs.getString("ans2");
        String a3= rs.getString("ans3");
        String a4= rs.getString("ans4");
        String cans= rs.getString("correctans");
        session.setAttribute("correctans",cans);
        out.print(i+". "+q);
       %>
    <form action="check2.jsp" method="post">
            <% out.println(a1); %>:<input type="radio" name="answer" value="<% out.println(a1); %>"><br>
            <% out.println(a2); %>:<input type="radio" name="answer" value="<% out.println(a2); %>"><br>
            <% out.println(a3); %>:<input type="radio" name="answer" value="<% out.println(a3); %>"><br>
            <% out.println(a4); %>:<input type="radio" name="answer" value="<% out.println(a4); %>"><br>
            <input type="submit" name="sub" value="next">
    </form>
            <%
       } 
    }
    else if(i==10)
    {
        query="select ques,ans1,ans2,ans3,ans4,correctans from javaques where quesno='"+i+"'";
        PreparedStatement ps= conn.prepareStatement(query);
        ResultSet rs=ps.executeQuery();
    if(rs.next())
    {
        String q=rs.getString("ques");
        String a1=rs.getString("ans1");
        String a2=rs.getString("ans2");
        String a3= rs.getString("ans3");
        String a4= rs.getString("ans4");
        String cans= rs.getString("correctans");
        session.setAttribute("correctans",cans);
        out.print(i+". "+q);
       %>
    <form action="check2.jsp" method="post">
            <% out.println(a1); %>:<input type="radio" name="answer" value="<% out.println(a1); %>"><br>
            <% out.println(a2); %>:<input type="radio" name="answer" value="<% out.println(a2); %>"><br>
            <% out.println(a3); %>:<input type="radio" name="answer" value="<% out.println(a3); %>"><br>
            <% out.println(a4); %>:<input type="radio" name="answer" value="<% out.println(a4); %>"><br>
            <input type="submit" name="sub" value="submit">
    </form>
            <%
    }
    }
    else
    {
        int no_java=(Integer)session.getAttribute("no_java");
        no_java++;
        session.setAttribute("no_java",no_java);
        query="update admin set no_java=?";
        PreparedStatement ps= conn.prepareStatement(query);
        ps.setInt(1,no_java);
        ps.executeUpdate();
        %>
        <a href="result.jsp">Click here to see the result</a><br>
        <%
    }
    conn.close();
 %>
