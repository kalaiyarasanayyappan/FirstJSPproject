<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Employee</title>
</head>
<body>
<form action="Employees" method="post">
		<!--need to mention method = put  -->
		<center>
			<div>
				ID : <input type='text' name='Emp_Id'>
			</div>
			<div>
			Update First Name : <input type='text' name='fname'>
			</div>
			<div>
			Update Last Name : <input type='text' name='lname'>
			</div>
			<div>
			Update E-mail : <input type='text' name='mail'>
			</div>
			<div>
			Update Phone-No : <input type='text' name='phone'>
			</div>
			<div>
			Update Hire Date : <input type='text' name='date'>
			</div>
			<div>
			Update Job ID : <input type='text' name='Job_Id'>
			</div>
			<div>
			Update Salary : <input type='text' name='Salary'>
			</div>
			<div>
				<input type='submit' name='submit' value='UPDATE EMPLOYEE'>
			</div>
		</center>
	</form>
</body>
</html>