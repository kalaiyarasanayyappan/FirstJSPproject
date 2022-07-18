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
 com.chainsys.jsp.common.InvalidInputDataException"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Employee</title>
</head>
<body>
<% 
String source="Delete Employee";
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
                System.out.println("Employee Doesn't Exist For Id " + empId); //
                return;
            }
            newemp.setEmp_id(empId);
            int result = EmployeeDao.deleteEmployee(empId);
            System.out.println(result);
            out1.print("<h1>Value Deleted</h1>");
	
	%>
</body>
</html>