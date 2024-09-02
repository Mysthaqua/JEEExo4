<%--
  Created by IntelliJ IDEA.
  User: Administrateur
  Date: 02/09/2024
  Time: 12:37
  To change this template use File | Settings | File Templates.
--%>
<jsp:useBean id="dogs" type="java.util.List<tibo.jee.jeeexo4.entity.Dog>" scope="request"/>
<%@ page import="tibo.jee.jeeexo4.entity.Dog" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Dogs</title>
</head>
<body>

<h1>Dogs</h1>

<h3><a href="${pageContext.request.contextPath}/dogs/add">Add a dog</a></h3>

<% if (dogs.isEmpty()) { %>
<h3>No dog has been found</h3>
<% } else { %>
<ul>
    <% for (Dog dog : dogs) { %>
    <li>
        <h3>
            <a href="${pageContext.request.contextPath}/dogs?id=<%= dog.getId() %>">
                <%= dog.getName() %>
            </a>
        </h3>
    </li>
    <% } %>
</ul>
<% } %>

<a href="${pageContext.request.contextPath}/">Back</a>

</body>
</html>
