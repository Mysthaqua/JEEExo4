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
    Race:
    <strong>
        <%= dog.getRace() %>
    </strong>
</p>

<p>
    Birth date:
    <strong>
        <%= dog.getBirthDate() %>
    </strong>
</p>

<a href="${pageContext.request.contextPath}/dogs">Back</a>

</body>
</html>
