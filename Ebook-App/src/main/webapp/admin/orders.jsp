<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Book_Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Order</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
	<c:redirect url="../login.jsp"/>
	</c:if>
	<h3 class="text-center">Hello Admin</h3>

	<table class="table table-striped">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment type</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
			List<Book_Order> blist = dao.getAllOrder();
			for (Book_Order b : blist) {
			%>
			<tr>
				<th scope="row"><%=b.getOrderId() %></th>
				<td><%=b.getUsername() %></td>
				<td><%=b.getEmail() %></td>
				<td><%=b.getFulladd() %></td>
				<td><%=b.getPhno() %></td>
				<td><%=b.getBookName() %></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getPaymentType() %></td>
				<td>
					<a href=""
					class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i> Delete</a>
				</td>

			</tr>
			<%
			}
			%>


		</tbody>
	</table>
	<div style="margin-top: 171px;">
		<%@include file="footer.jsp"%></div>

</body>
</html>