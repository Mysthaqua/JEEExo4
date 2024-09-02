<%--
  Created by IntelliJ IDEA.
  User: Administrateur
  Date: 02/09/2024
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<jsp:useBean id="dog" type="tibo.jee.jeeexo4.entity.Dog" scope="request"/>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>
        <%= dog.getName() %>
    </title>
</head>
<body>

<h1>
    <%= dog.getName() %>
</h1>

<p>
    Breed:
    <strong>
        <%= dog.getBreed() %>
    </strong>
</p>

<p>
    Birth date:
    <strong>
        <%= dog.getBirthDateAsString() %>
    </strong>
</p>

<a href="${pageContext.request.contextPath}/dogs/edit?id=${dog.getId()}">Edit the dog</a>

<form method="post" action="${pageContext.request.contextPath}/dogs">
    <input name="action" value="delete" type="hidden"/>
    <input name="id" value="${dog.getId()}" type="hidden"/>
    <button>Remove the dog</button>
</form>

<a href="${pageContext.request.contextPath}/dogs">Back</a>

</body>
</html>
