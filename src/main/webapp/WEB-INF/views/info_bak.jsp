<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<h2>Hello panshuai!</h2>
</body>
<label> id: </label>
<c:out value="${usersEntity.id}"/>
<label> name: </label>
<c:out value="${usersEntity.name}"/>
<label> userId: </label>
<c:out value="${usersEntity.userId}"/>
</html>
