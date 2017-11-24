<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Objects"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiwangi","shiwangi");
    String c=(String)session.getAttribute("correctans");
    int k=(Integer)session.getAttribute("k");
    String option=request.getParameter("answer");
    option=option.trim();
    int a=(Integer)session.getAttribute("a");
    String query="insert into result values(?,?,?)";
    PreparedStatement ps= conn.prepareStatement(query);
    if(Objects.equals(c,option))
    {
        k++;
        session.setAttribute("k",k);
        ps.setString(1,c);
        ps.setString(2,option);
        ps.setInt(3,a);
        ps.executeUpdate();
        a++;
        session.setAttribute("a",a);
        response.sendRedirect("jques.jsp");  
    }
   /*else if(Objects.equals(c,option) && (k==10))
    {
        k++;
        session.setAttribute("k",k);
        ps.setString(1,c);
        ps.setString(2,option);
        ps.setInt(3,a);
        ps.executeUpdate();
        a++;
        session.setAttribute("a",a); 
        
    }*/
    else
    {
      ps.setString(1,c);
      ps.setString(2,option);
      ps.setInt(3,a);
      ps.executeUpdate();
      a++;
      session.setAttribute("a",a);
      response.sendRedirect("jques.jsp");
    }  
    conn.close();
%>