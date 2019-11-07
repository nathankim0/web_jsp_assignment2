<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="kpu.club.domain.*, java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/student.css" type="text/css"></link>
</head>
<body>
	<header>Study Club Member List</header>
	<hr>
	<div>
		<a href="http://localhost:8080/jinyeob_regdb/welcome.html"
			target="_self">메인페이지 이동</a>
		<table>
			<tr>
				<td>계정</td>
				<td>이름</td>
				<td>학번</td>
				<td>학과</td>
				<td>핸드폰</td>
				<td>이메일</td>
				<%
					List<StudentVO> studentList = (List<StudentVO>) request.getAttribute("studentList");
					for (StudentVO vo : studentList) {
				%>
			
			<tr>
				<td><a href="http://localhost:8080/jinyeob_regdb/StudentServlet?key=update&id=<%=vo.getId()%>"target="_self"><%=vo.getId()%></a></td>
				<td><%=vo.getUsername()%></td>
				<td><%=vo.getSnum()%></td>
				<td><%=vo.getDepart()%></td>
				<td><%=vo.getMobile()%></td>
				<td><%=vo.getEmail()%></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>