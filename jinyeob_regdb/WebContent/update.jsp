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
	<div align="center">
		<header>Member Update</header>
		<HR>
		<form
			action="http://localhost:8080/jinyeob_regdb/StudentServlet?key=update"
			method="post">

			<%
				StudentVO student = (StudentVO) request.getAttribute("student");
			%>
			<fieldset>
				<legend>개인 정보</legend>
				<ul>
					<li>계정 : <input type="text" name="id"
						value=<%=student.getId()%> readonly ></li>
					<li>비밀번호 : <input type="password" name="passwd"
						value=<%=student.getPasswd()%> autofocus></li>
					<li>이름 : <input type="text" name="username"
						value=<%=student.getUsername()%>></li>
					<li>학번 : <input type="text" name="snum"
						value=<%=student.getSnum()%>></li>
					<li>학과 : <input type="text" name="depart"
						value=<%=student.getDepart()%>></li>
					<li>핸드폰번호 : <input type="text" name="mobile"
						value=<%=student.getMobile()%>></li>
					<li>이메일 : <input type="text" name="email"
						value=<%=student.getEmail()%>></li>
				</ul>
			</fieldset>
			<br>
			<fieldset>
				<input type="submit" name="submit" value="최종 수정"> <input
					type="reset" name="reset" value="다시 작성">
			</fieldset>

		</form>

	</div>
</body>
</html>