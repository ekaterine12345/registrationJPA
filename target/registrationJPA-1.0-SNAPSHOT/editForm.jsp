<%@ page import="beans.AppUsers" %>
<%@page import="beans.DB" %>
<jsp:useBean id="u" class="beans.AppUsers"/>
<jsp:setProperty property="*" name="u"/>

<%

    int id = Integer.parseInt(request.getParameter("id"));
    AppUsers user = new AppUsers();
    DB db = new DB();
    if (id > 0) {
        user = db.getRecordById(id);
    } else {

        db.updateUser(u);
        response.sendRedirect("viewUsers.jsp");
    }

%>
<html>

<body>

<h1>EDIT USER</h1>
<form action="editForm.jsp" method="post">

    <input type="hidden" name="id" value="<%=-1*user.getId()%>">
    ID:<input type="text" name="id1" value="<%=user.getId()%>"/></br>
    NAME:<input type="text" name="name" value="<%=user.getName()%>"/></br>
    LAST NAME:<input type="text" name="lastname" value="<%=user.getLastname()%>"/></br>
    PASSWORD:<input type="password" name="password" value="<%=user.getPassword()%>"/></br>




    </br>
    <input type="submit" value="EDIT USER"/>
</form>

</body>
</html>
