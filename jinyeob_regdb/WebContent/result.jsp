<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kpu.club.domain.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result</title>
<link rel="stylesheet" href="resources/student.css" type="text/css"></link>
</head>
<body>
	<header>2019 KPU Study Club</header>
	<p id="sect"><%=request.getAttribute("message")%><br>
	<div>
		<%
			StudentVO student = (StudentVO) request.getAttribute("student");
		%>
		<table>
			<td>계정</td>
			<td>이름</td>
			<td>학번</td>
			<td>학과</td>
			<td>핸드폰</td>
			<td>이메일</td>

			<tr>
				<td><%=student.getId()%></td>
				<td><%=student.getUsername()%></td>
				<td><%=student.getSnum()%></td>
				<td><%=student.getDepart()%></td>
				<td><%=student.getMobile()%></td>
				<td><%=student.getEmail()%></td>

			</tr>
		</table>
		<br> <a
			href="http://localhost:8080/jinyeob_regdb/StudentServlet?key=list"
			target="_self">전체 회원 목록 보기 </a>
	</div>
</body>
</html>