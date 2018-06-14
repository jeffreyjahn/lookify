<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.lang.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Lookify</title>
    <link rel="stylesheet" type="text/css" href="/css/styles.css" />
    <script type="text/javascript" src="/js/app.js"></script>
</head>
<body>
	<a href="/dashboard">Dashboard</a>
	<table>
		<tr>
			<td>Title</td>
			<td><c:out value="${ song.getTitle() }"/></td>
		</tr>
		<tr>
			<td>Artist</td>
			<td><c:out value="${ song.getArtist() }"/></td>
		</tr>
		<tr>
			<td>Rating (1-10))</td>
			<td><c:out value="${ song.getRating() }"/></td>
		</tr>
	</table>
	<c:set var="id" value="${ song.getId() }"/>
	<a href="songs/${ id }/delete">Delete</a>
</body>
</html>