<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%-- Session Check Fragment - Include at the top of protected pages --%>
<%-- Usage: set requiredRole attribute before including (optional) --%>
<%
  Integer userId = (Integer) session.getAttribute("userId");
  String userRole = (String) session.getAttribute("userRole");
  String requiredRole = (String) request.getAttribute("requiredRole");
  
  if (userId == null) {
    response.sendRedirect("login.jsp?redirect=" + request.getRequestURI() + "&error=session_expired");
    return;
  }
  
  if (requiredRole != null && !requiredRole.equals(userRole)) {
    response.sendRedirect("login.jsp?error=unauthorized");
    return;
  }
%>
