<%@page import="java.util.List"%>
<%@page import="com.msbhosale.service.AppService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="stylesheet" type="text/css"
	href="https://bootswatch.com/4/spacelab/bootstrap.min.css" />
</head>
<body>
	<%
		String _pageNumber = request.getParameter("pagenumber");

		int pageNumber = 0;

		if (_pageNumber == null || _pageNumber.equals("0")) {
			pageNumber = 1;
		} else {
			pageNumber = Integer.parseInt(_pageNumber);
		}

		AppService service = new AppService();

		List<String> players = service.getPlayers(pageNumber);
		int counter = 1;
	%>
	<div class="container">
		<br> <br>
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
			<a class="navbar-brand" href="#">My Cool App</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarColor01" aria-controls="navbarColor01"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="#">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Features</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Pricing</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">About</a></li>
				</ul>
				<form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="text"
						placeholder="Search">
					<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
		</nav>
		<br>
		<h4>
			Page :
			<%=pageNumber%>
		</h4>

		<%
			if (players.size() > 0) {
		%>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>Id</th>
					<th>Player</th>
				</tr>
			</thead>
			<%
				for (String player : players) {
						out.print("<tbody>");
						out.print("<tr>");
						out.print("<td>" + counter + "</td>");
						out.print("<td>" + player + "</td>");
						out.print("</tr>");
						out.print("</tbody>");
						counter++;
					}
			%>
		</table>
		<%
			} else {
				out.print("No record found !");
			}
		%>
		<%
			if (players.size() > 0) {
		%>
		<div class="pull-right">
			<ul class="pagination">
				<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a>
				</li>
				<li class="page-item"><a class="page-link"
					href="index.jsp?pagenumber=1">1</a></li>
				<li class="page-item"><a class="page-link"
					href="index.jsp?pagenumber=2">2</a></li>
				<li class="page-item"><a class="page-link"
					href="index.jsp?pagenumber=3">3</a></li>
				<li class="page-item"><a class="page-link"
					href="index.jsp?pagenumber=4">4</a></li>
				<li class="page-item"><a class="page-link"
					href="index.jsp?pagenumber=5">5</a></li>
				<li class="page-item"><a class="page-link" href="#">&raquo;</a>
				</li>
			</ul>
		</div>
		<%
			}
		%>

	</div>

</body>
</html>