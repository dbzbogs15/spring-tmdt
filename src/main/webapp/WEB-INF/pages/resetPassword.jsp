<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
<p>${message}</p>
<form action="/reset" method="post">
    Token <input type="text" name="token" value="${token}">
    Password <input type="text" name="password">
    <input type="submit" value="Reset">
</form>
</body>
</html>