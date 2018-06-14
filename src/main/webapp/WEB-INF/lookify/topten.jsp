<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.lang.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Jeff's new JSP File</title>
    <link rel="stylesheet" type="text/css" href="/css/styles.css" />
    <script type="text/javascript" src="/js/app.js"></script>
</head>
<body>
	<a href="/dashboard">Dashboard</a>
	<h1>Top Ten Songs:</h1>
	<fieldset>
		<c:forEach var="song" items="${ top }">
			<c:set var="id" value="${ song.getId() }"/>
			<p>${ song.getRating() } - <a href="/songs/${id}">${ song.getTitle() } - ${ song.getArtist() }</p>
		</c:forEach>
	</fieldset>
</body>
</html>