<form action="update.jsp" method="post">
    Language:<select name="lang">
        <option value="c">C</option>
        <option value="java">Java</option><br>
    </select><br>
        Question Number to be updated:<input type="number" name="ques"><br>
    Option:<select name="option">
        <option value="question">Question</option>
        <option value="answer">Answer</option>
    </select><br>
    <input type="submit" name="get" value="submit">
</form>
<%@page import="java.util.Objects"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","shiwangi","shiwangi");
    Statement st = conn.createStatement();
    String l=request.getParameter("lang");
    String o=request.getParameter("option");
    String q=request.getParameter("ques");
    session.setAttribute("no",q);
    if(Objects.equals(l,"c"))
    {
        if(Objects.equals(o,"question"))
        { 
           %>
           <form action="update_quesc.jsp" method="post">
               New Question: <textarea name="questionc"></textarea><br>
               <input type="submit" name="sub" ><br>
           </form>
           <%
        }                           
        else if(Objects.equals(o,"answer"))
        {
            %>
            <form action="update_ansc.jsp" method="post">
            Option:<select name="getans">
            <option value="option1">Option 1</option>
            <option value="option2">Option 2</option>
            <option value="option3">Option 3</option>
            <option value="option4">Option 4</option>
            <option value="canswer">Correct answer</option>
            </select><br>
            New answer:<input type="text" name="new"><br>
            <input type="submit" name="get" value="submit"><br>
            </form>
            <%
        }
    }
    else if(Objects.equals(l,"java"))
    {
        if(Objects.equals(o,"question"))
        { 
            %>
                <form action="java_ques_update.jsp" method="post">
                    New Question: <textarea name="questionj"></textarea><br>
                <input type="submit" name="get" value="submit"><br>
                </form>
            <%
        }
        else if(Objects.equals(o,"answer"))
        {
            %>
            <form action="update_java_ans.jsp" method="post">
            Option:<select name="getans">
            <option value="option1">Option 1</option>
            <option value="option2">Option 2</option>
            <option value="option3">Option 3</option>
            <option value="option4">Option 4</option>
            <option value="canswer">Correct answer</option>
            </select><br>
            New answer:<input type="text" name="new"><br>
            <input type="submit" name="get" value="submit"><br>
            </form>
            <%
        }
}
%>
           