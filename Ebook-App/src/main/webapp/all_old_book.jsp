<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.*"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Old Book</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
					<%
				BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list3 = dao3.getAllOldBook();
				for (BookDtls b : list3) {%>
				<div class="col-md-3">
					<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName() %>" style="width: 100px; height: 150px"
							class="img-thumblin">
						<p><%=b.getBookname() %></p>
						<p><%=b.getAuthor() %></p>
						<p>Categories: <%=b.getBookCategory() %></p>
						<div class="row-md-3"> 
							<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a>
							<a href="" class="btn btn-danger btn-sm ml-1 mt-1"><%=b.getPrice() %><i class="fas fa-dollar-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
				<%}%>

		</div>
	</div>
</body>
</html>