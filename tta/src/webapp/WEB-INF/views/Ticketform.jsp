<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<title>Save Ticket</title>
</head>

<body>

	<div class="container">

		<h3>Ticket Directory</h3>
		<hr>

		<p class="h4 mb-4">Enter Ticket</p>

		<form action="/tickets/tickets/save" method="POST">

			<!-- Add hidden form field to handle update -->
			<input type="hidden" name="id" value="${Ticket.id}" />

			<div class="form-inline">
				<input type="text" name="title" value="${Ticket.title}"
					class="form-control mb-4 col-4" placeholder="Title">



			</div>

			<div class="form-inline">

				<input type="text" name="description" value="${Ticket.descrition}"
					class="form-control mb-4 col-4" placeholder="Description">



			</div>

			<div class="form-inline">

				<input type="text" name="date" value="${Ticket.date}"
					class="form-control mb-4 col-4" placeholder="Date">



			</div>

			<button type="submit" class="btn btn-info col-2">Save</button>

		</form>

		<hr>
		<a href="/LibraryManagement/books/list">Back to Ticket List</a>

	</div>
</body>

</html>










