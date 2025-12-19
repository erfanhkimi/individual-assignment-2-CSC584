<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Profiles</title>
</head>
<body>

<h2>Student Profile List</h2>

<table border="1" cellpadding="8">
<tr>
    <th>Name</th>
    <th>Student ID</th>
    <th>Program</th>
    <th>Email</th>
    <th>Hobbies</th>
</tr>

<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/student_profile", "root", "");

    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM profile");

    while (rs.next()) {
%>
<tr>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("student_id") %></td>
    <td><%= rs.getString("program") %></td>
    <td><%= rs.getString("email") %></td>
    <td><%= rs.getString("hobbies") %></td>
</tr>
<%
    }
    con.close();
%>

</table>

</body>
</html>
