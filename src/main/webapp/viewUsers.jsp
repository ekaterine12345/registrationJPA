<%@page import="beans.DB" %>
<%@page import="beans.AppUsers" %>
<%@page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%
    DB db = new DB();
    List<AppUsers> appUsersList = db.getAllRecods();
    request.setAttribute("appUsersList", appUsersList);
%>


<table border="2" width="70%">
    <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>LASTNAME</th>
        <th>PASSWORD</th>
        <th>DELETE</th>
        <th>EDIT</th>
    </tr>

    <c:forEach items="${appUsersList}" var="u">
        <tr>
            <td>${u.getId()}</td>
            <td>${u.getName()}</td>
            <td>${u.getLastname()}</td>
            <td>${u.getPassword()}</td>
            <td><a href="deleteUser.jsp?id=${u.getId()}">DELETE</a></td>
            <td><a href="editForm.jsp?id=${u.getId()}">EDIT</a></td>
        </tr>
    </c:forEach>

</table>

<br>
<a href="addUserForm.jsp"> add new user </a>
</body>
</html>

