<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.lang.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Lookify | Add Song</title>
    <link rel="stylesheet" type="text/css" href="/css/styles.css" />
    <script type="text/javascript" src="/js/app.js"></script>
</head>
<body>
	<a href="/dashboard">Dashboard</a>
	<form:form action="/songs/new" method="POST" modelAttribute="song">
		<p>
			<form:label path="title">Title</form:label>
			<form:input path="title"/>
			<form:errors path="title"/>
		</p>
		<p>
			<form:label path="artist">Artist</form:label>
			<form:input path="artist"/>
			<form:errors path="artist"/>
		</p>
		<p>
			<form:label path="rating">Rating</form:label>
			<form:input type="number" path="rating" min="1" max="10"/>
			<form:errors path="rating"/>
		</p>
		<p>
			<input type="submit" value="Add Song"/>
		</p>
	</form:form>
</body>
</html>