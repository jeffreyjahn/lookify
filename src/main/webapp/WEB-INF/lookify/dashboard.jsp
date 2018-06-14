<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.lang.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Lookify | Dashboard</title>
    <link rel="stylesheet" type="text/css" href="/css/styles.css" />
    <script type="text/javascript" src="/js/app.js"></script>
</head>
<body>
	<%@ page isErrorPage="true" %>
	<a href="/songs/new">Add New</a>
	<a href="/search/topTen">Top Songs</a>
	<form action="/search">
		<input type="text" name="search">
		<input type="submit" value="Search Artists">
	</form>
	<div>
		<table>
			<tr>	
				<th>Name</th>
				<th>Artist</th>		
				<th>Rating</th>	
				<th>Actions</th>
			</tr>
	    	<c:forEach items="${songs}" var="song">
	    	<c:set var ="id" value="${ song.getId() }"/>
	    	<tr>
	    		<td><a href="/songs/${ id }"><c:out value="${ song.getTitle() }"/></a></td>
	    		<td><c:out value="${ song.getArtist() }"/></td>
	    		<td><c:out value="${ song.getRating() }"/></td>
	    		<td><a href="/songs/${ id }/delete">delete</a></td>
	    	</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>