<%--
  Created by IntelliJ IDEA.
  User: Administrateur
  Date: 02/09/2024
  Time: 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add a dog</title>
</head>
<body>

<h1>Add a dog</h1>

<form method="post" action="${pageContext.request.contextPath}/dogs">
    <input name="action" value="create" type="hidden"/>
    <div>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name"/>
    </div>
    <div>
        <label for="breed">Breed:</label>
        <input type="text" id="breed" name="breed"/>
    </div>
    <div>
        <label for="birthDate">Birth date:</label>
        <input type="date" id="birthDate" name="birthDate"/>
    </div>
    <button>Send</button>
</form>

<a href="${pageContext.request.contextPath}/dogs">Cancel</a>

</body>
</html>
