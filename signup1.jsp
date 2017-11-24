<%@page import="java.sql.*"%>
<%
    String m=request.getParameter("phone");
    String u=request.getParameter("user");
    String p=request.getParameter("pass");
    String e=request.getParameter("em");
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn=DriverManager.
    getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiwangi","shiwangi");
    String query="insert into user_info(name,password,mobileno,email_id) values(?,?,?,?)";        
    PreparedStatement pst=conn.prepareStatement(query);
    pst.setString(1,u);
    pst.setString(2,p);
    pst.setString(3,m);
    pst.setString(4,e);
    pst.executeUpdate();
    out.println("<b>sign up completed</b>");
    response.sendRedirect("index.html");
%>
