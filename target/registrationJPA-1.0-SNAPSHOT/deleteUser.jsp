<%@page import="beans.DB" %>
<jsp:useBean id="user" class="beans.AppUsers"/>
<jsp:setProperty property="*" name="user"/>
<%

    DB db = new DB();
    db.deleteUser(user);

    response.sendRedirect("viewUsers.jsp");
%>

