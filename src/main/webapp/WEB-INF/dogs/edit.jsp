<%--
  Created by IntelliJ IDEA.
  User: Administrateur
  Date: 02/09/2024
  Time: 12:36
  To change this template use File | Settings | File Templates.
--%>
<jsp:useBean id="dog" type="tibo.jee.jeeexo4.entity.Dog" scope="request"/>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Edit a dog</title>
</head>
<body>

<h1>Edit a dog</h1>

<form method="post" action="${pageContext.request.contextPath}/dogs">
    <input name="action" value="update" type="hidden"/>
    <input name="id" value="${dog.getId()}" type="hidden"/>
    <div>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="${dog.getName()}"/>
    </div>
    <div>
        <label for="breed">Breed:</label>
        <input type="text" id="breed" name="breed" value="${dog.getBreed()}"/>
    </div>
    <div>
        <label for="birthDate">Birth date:</label>
        <input type="date" id="birthDate" name="birthDate" value="${dog.getBirthDate()}"/>
    </div>
    <button>Send</button>
</form>

<a href="${pageContext.request.contextPath}/dogs?id=${dog.getId()}">Cancel</a>

</body>
</html>
