<%@page import="java.util.Objects"%>
<html>
        <form action="add.jsp" method="post">
        Language:<select name="lang">
        <option value="java">Java</option>
        <option value="c">C</option>
        </select><br>
        Question:<textarea name="ques"></textarea><br>
        Option 1:<input type="text" name="ans1"><br>
        Option 2:<input type="text" name="ans2"><br>
        Option 3:<input type="text" name="ans3"><br>
        Option 4:<input type="text" name="ans4"><br>
        Correct Answer:<input type="text" name="cans"><br>
        Question no:<input type="number" name="number"><br>
        <input type="submit" name="sub" value="submit"><br>
        <a href="admin.jsp">Back</a><br>
    </form>
</html>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    String l=request.getParameter("lang");
    String q=request.getParameter("ques");
    String a1=request.getParameter("ans1");
    String a2=request.getParameter("ans2");
    String a3=request.getParameter("ans3");
    String a4=request.getParameter("ans4");
    String c=request.getParameter("cans");
    String no=request.getParameter("number");
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn=DriverManager.
    getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiwangi","shiwangi");
    if(Objects.equals(l,"java"))
    {
        String query=
    "insert into javaques values(?,?,?,?,?,?,?)";        
    PreparedStatement pst=conn.prepareStatement(query);
    pst.setString(1,q);
    pst.setString(2,a1);
    pst.setString(3,a2);
    pst.setString(4,a3);
    pst.setString(5,a4);
    pst.setString(6,c);
    pst.setString(7,no);
    pst.executeUpdate();
    }
    else if(Objects.equals(l,"c"))
    {
        String query="insert into cques values(?,?,?,?,?,?,?)";        
        PreparedStatement pst=conn.prepareStatement(query);
        pst.setString(1,q);
        pst.setString(2,a1);
        pst.setString(3,a2);
        pst.setString(4,a3);
        pst.setString(5,a4);
        pst.setString(6,c);
        pst.setString(7,no);
        pst.executeUpdate();
    }
    
    
    conn.close();
%>