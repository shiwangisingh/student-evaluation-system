<%@page import="oracle.net.aso.n"%>
<%@page import="javax.jms.Session"%>
<b>Choose the language of the test</b><br><br>
<a href="cques.jsp">
<img src="c.jpg" 
width="200" height="200" >
</a>
<a href="jques.jsp">
<img src="download.png" alt="java"
width="200" height="200" >
</a>

<%
    int i=1;
    int j=0;
    int no_c=0;
    int no_java=0;
    session.setAttribute("a",i);
    session.setAttribute("k",j);    
    session.setAttribute("no_c",no_c); 
    session.setAttribute("no_java",no_java); 
%>
