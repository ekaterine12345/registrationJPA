<%@page import="beans.DB" %>
<jsp:useBean id="obj" class="beans.AppUsers"/>
<jsp:setProperty property="*" name="obj"/>
<%

    DB db = new DB();
    if (db.saveUser(obj)) {

        response.sendRedirect("viewUsers.jsp");
    } else {

        response.sendRedirect("error.jsp");
    }
%>