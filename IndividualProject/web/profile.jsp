<%@ page import="model.ProfileBean" %>
<!DOCTYPE html>
<html>
<head>
    <title>Profile Saved</title>
</head>
<body>

<%
    ProfileBean p = (ProfileBean) request.getAttribute("profile");
%>

<h2>Profile Saved Successfully</h2>

<p><strong>Name:</strong> <%= p.getName() %></p>
<p><strong>Student ID:</strong> <%= p.getStudentId() %></p>
<p><strong>Program:</strong> <%= p.getProgram() %></p>
<p><strong>Email:</strong> <%= p.getEmail() %></p>
<p><strong>Hobbies:</strong> <%= p.getHobbies() %></p>
<p><strong>About Me:</strong> <%= p.getIntro() %></p>

<hr>
<a href="viewProfiles.jsp">View All Profiles</a>

</body>
</html>
