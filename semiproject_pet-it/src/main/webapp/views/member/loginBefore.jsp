<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession session2 = request.getSession();
    String originalRequestURI = (String) session2.getAttribute("originalRequestURI");
    session2.removeAttribute("originalRequestURI"); // 이후에는 필요 없으므로 세션에서 삭제

    if (originalRequestURI != null && !originalRequestURI.isEmpty()) {
        response.sendRedirect(originalRequestURI);
    } else {
        // 이전 페이지 주소가 없을 경우, 기본 페이지로 이동하거나 필요한 작업 수행
        response.sendRedirect(request.getContextPath() + "/");
    }
%>