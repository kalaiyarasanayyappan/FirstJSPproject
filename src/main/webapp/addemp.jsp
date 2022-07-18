<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.io.PrintWriter,
com.chainsys.jsp.dao.EmployeeDao,
com.chainsys.jsp.pojo.Employee,
java.io.IOException,
java.text.ParseException,
 java.util.Date ,
 java.text.SimpleDateFormat,
 com.chainsys.jsp.common.Validator,
com.chainsys.jsp.common.ExceptionManager,
 com.chainsys.jsp.common.InvalidInputDataException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Employee</title>
</head>
<body>
	<% 
	String source="AddNewEmployee";
		String message="<h1>Error while "+source+"</h1>";
        PrintWriter out1 = response.getWriter();
		Employee newemp = new Employee();

		String id = request.getParameter("Emp_Id");
		try {
			Validator.checkStringForParseInt(id);
		} catch (InvalidInputDataException err) {
			message +=" Error in Employee id input </p>";
			String errorPage=ExceptionManager.handleException(err, source, message);
			out.print(errorPage);
			return;
		}
		int empId = Integer.parseInt(id);
		try {
			Validator.checkNumberForGreaterThanZero(empId);
		} catch (InvalidInputDataException err) {
			message +=" Error in Employee id input </p>";
			String errorPage=ExceptionManager.handleException(err, source, message);
			out.print(errorPage);
			return;
		}
		Employee emp = EmployeeDao.getEmployeeById(empId);
		if (emp == null) {
			System.out.println("Employee Doesn't Exist For Id " + empId);
			return;
		}
		newemp.setEmp_id(empId);
		String fName = request.getParameter("fname");
		try {
			Validator.checkCharLessThanTwenty(fName);
		} catch (InvalidInputDataException err) {
			message +=" Error in First Name input </p>";
			String errorPage=ExceptionManager.handleException(err, source, message);
			out.print(errorPage);
			return;
		}
		try {
			Validator.checkDataOnlyString(fName);
		} catch (InvalidInputDataException err) {
			message +=" Error in First Name input </p>";
			String errorPage=ExceptionManager.handleException(err, source, message);
			out.print(errorPage);
			return;
		}
		newemp.setFirst_name(fName);
		String lName = request.getParameter("lname");
		try {
			Validator.checkCharLessThanTwenty(lName);
		} catch (InvalidInputDataException err) {
			message +=" Error in Last Name input </p>";
			String errorPage=ExceptionManager.handleException(err, source, message);
			out.print(errorPage);
			return;
		}
		try {
			Validator.checkDataOnlyString(lName);
		} catch (InvalidInputDataException err) {
			message +=" Error in Last Name input </p>";
			String errorPage=ExceptionManager.handleException(err, source, message);
			out.print(errorPage);
			return;
		}
		newemp.setLast_name(lName);
		String eMail = request.getParameter("mail");
		try {
			Validator.checkMailContainsAtsymbol(eMail);
		} catch (InvalidInputDataException err) {
			message +=" Error in email input </p>";
			String errorPage=ExceptionManager.handleException(err, source, message);
			out.print(errorPage);
			return;
		}
		newemp.setEmail(eMail);
		String num = request.getParameter("Phone_no");
		try {
			Validator.checkStringForParseInt(num);
		} catch (InvalidInputDataException err) {
			message +=" Error in phone_no input </p>";
			String errorPage=ExceptionManager.handleException(err, source, message);
			out.print(errorPage);
			return;
		}
		try {
			Validator.checkPhoneNumberTenDigits(num);
		} catch (InvalidInputDataException err) {
			message +=" Error in phone_no input </p>";
			String errorPage=ExceptionManager.handleException(err, source, message);
			out.print(errorPage);
			return;
		}
		newemp.setPhone_number(num);
		String dateFormat = "dd/MM/yyyy";
		try {
			newemp.setHire_date(new SimpleDateFormat(dateFormat).parse(request.getParameter("Date")));
		} catch (ParseException e) {
			e.printStackTrace();
		} 
		
		// -----------------------------------------------------
		String jobId = request.getParameter("Job_Id");
		try {
			Validator.checkCharLessThanTwenty(jobId);
		} catch (InvalidInputDataException err) {
			message +=" Error in Job Id input </p>";
			String errorPage=ExceptionManager.handleException(err, source, message);
			out.print(errorPage);
			return;
		}
		newemp.setJob_id(jobId);
		String salary = request.getParameter("Salary");
		float sal = Float.parseFloat(salary);
		try {
			Validator.checkSalaryLessThanTenDigit(sal);
		} catch (InvalidInputDataException err) {
			message +=" Error in Salary input </p>";
			String errorPage=ExceptionManager.handleException(err, source, message);
			out.print(errorPage);
			return;
		}
		try {

			Validator.checkNumberForGreaterThanZero(sal);
		} catch (InvalidInputDataException err) {
			message +=" Error in Salary input </p>";
			String errorPage=ExceptionManager.handleException(err, source, message);
			out.print(errorPage);
			return;
		}
		try {
			Validator.checkSalaryOnlyNumbers((int) sal);
		} catch (InvalidInputDataException err) {
			message +=" Error in Salary input </p>";
			String errorPage=ExceptionManager.handleException(err, source, message);
			out.print(errorPage);
			return;
		}
		newemp.setSalary(sal);
		int result = EmployeeDao.insertEmployee(newemp);
		System.out.println(result);
        
		out1.println("<div> Added New Employee : " + result + "</div>");
		%>
</body>
</html>