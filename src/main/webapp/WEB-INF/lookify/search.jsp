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
	<form action="/search">
		<input type="text" name="search">
		<input type="submit" value="New Search">
	</form>
	<a href="/dashboard">Dashboard</a>
	<h1>Songs by search: <c:out value="${ text }"/></h1>
	<table>
		<tr>
			<th>Name</th>
			<th>Artist</th>
			<th>Rating</th>
			<th>actions</th>
		</tr>
		<c:forEach var="song" items="${ search }">
		<tr>
			<c:set var="id" value="${ song.getId() }"/>
			<td><a href="/songs/${ id }"><c:out value="${ song.getTitle() }"/></a></td>
			<td><c:out value="${ song.getArtist() }"/></td>
    		<td><c:out value="${ song.getRating() }"/></td>
    		<td><a href="/songs/${ id }/delete">delete</a></td>
    	</tr>
		</c:forEach>
	</table>
</body>
</html>