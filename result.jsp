 <%@page import="java.sql.Statement"%>
<h1 style="text-align: center"><b>RESULT</b></h1>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiwangi","shiwangi");
    int marks=(Integer)session.getAttribute("k");
    float p=(marks*100)/10;
    String u_name=(String)session.getAttribute("name");
    String query1="select name,mobileno,email_id from user_info where name=?";
    PreparedStatement pst= conn.prepareStatement(query1);
    pst.setString(1, u_name);
    ResultSet r=pst.executeQuery();
    while(r.next())
        {
            String m=r.getString("mobileno");
            String n=r.getString("name");
            String id=r.getString("email_id");
            %>
            <b>Name: </b><%out.println(n);%><br>
            <b>Mobile Number: </b><%out.println(m);%><br>
            <b>Email-Id: </b><%out.println(id);%><br>
            <%
        }
    %>
    <b>Marks:</b> <%out.println(marks+"/10"); %><br>
    <%
        String query="select * from result order by quesno";
        PreparedStatement ps= conn.prepareStatement(query);
        ResultSet rs=ps.executeQuery();
        %>
        <br><table border="3">
            <tr>
                <th><b>Question Number</b></th>
                <th><b>Your Answer</b></th>
                <th><b>Correct Answer</b></th>
            </tr>
            <%
        while(rs.next())
        {
            int n=rs.getInt("quesno");
            String cans=rs.getString("correctans");
            String ans=rs.getString("answer");
            %>
            <tr>
                <td><% out.println(n); %></td>
                <td><% out.println(ans); %></td>
                <td><% out.println(cans); %></td>
            </tr>
                <%
        }
        %>
            </table>
        <b>Total Questions: </b><% out.println(10); %><br>
        <b>Correct Answers: </b><% out.println(marks); %><br>
        <b>Percentage: </b><% out.println(p+"%"); %><br>
        <%
            String q="truncate table result";
            Statement st = conn.createStatement();
            st.executeUpdate(q);
        %>
<br><a href="index1.html"><b>Logout</b></a>