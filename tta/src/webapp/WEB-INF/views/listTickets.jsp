<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<title>Ticket Tracking Application</title>
</head>

<body>

	<div class="container">

		<h3>Tickets Directory</h3>
		<hr>

		<!-- Add a search form -->
		




			<form action="/tickets/tickets/search" class="form-inline">

				<!-- Add a button -->
				<a href="/tickets/tickets/showFormForAdd"
					class="btn btn-primary btn-sm mb-3"> Add Ticket </a> <input
					type="search" name="title" placeholder="Title"
					class="form-control-sm ml-5 mr-2 mb-3" /> <input type="search"
					name="description" placeholder="Description"
					class="form-control-sm mr-2 mb-3" />

				<button type="submit" class="btn btn-success btn-sm mb-3">Search</button>
					<a href="/tickets/logout" 
					class="btn btn-primary btn-sm mb-3 mx-auto"> Logout </a> 

			</form>
	

		<table class="table table-bordered table-striped">
			<thead class="thead-dark">
				<tr>
					<th>Title</th>
					<th>Description</th>
					<th>Date</th>
					
					<th>Action</th>
					
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${Tickets}" var="temp">
					<tr>
						<td><c:out value="${temp.title}" /></td>
						<td><c:out value="${temp.description}" /></td>
						<td><c:out value="${temp.date}" /></td>
						
						<td>
							<!-- Add "update" button/link --> <a
							href="/tickets/tickets/showFormForUpdate?TicketId=${temp.id}"
							class="btn btn-info btn-sm"> Update </a> <!-- Add "delete" button/link -->
							<a href="/LibraryManagement/books/delete?bookId=${temp.id}"
							class="btn btn-danger btn-sm"
							onclick="if (!(confirm('Are you sure you want to delete this ticket?'))) return false">
								Delete </a>

						</td>
					

					</tr>
				</c:forEach>

			</tbody>
		</table>

	</div>

</body>
</html>



