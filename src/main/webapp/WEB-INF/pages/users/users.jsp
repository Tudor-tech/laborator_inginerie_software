<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="activePage" value="Users"/>
<t:pageTemplate pageTitle="Users">
    <h1>Users</h1>

    <c:if test="${pageContext.request.isUserInRole('INVOICING')}">
        <form method="POST" action="${pageContext.request.contextPath}/Users">
        <button class="btn btn-secondary btn-lg" type="submit">Invoice</button>
    </c:if>

    <c:if test="${pageContext.request.isUserInRole('WRITE_USERS')}">
        <a href="${pageContext.request.contextPath}/AddUser" class="btn btn-primary btn-lg">Add User</a>
    </c:if>

    <div class="container text-center">
        <c:forEach var="user" items="${users}">
            <div class="row">
                <c:if test="${pageContext.request.isUserInRole('INVOICING')}">
                    <div class="col">
                        <input type="checkbox" name="user_ids" value="${user.id}" />
                    </div>
                </c:if>
            </div>
        </c:forEach>
    </div>

    <c:if test="${pageContext.request.isUserInRole('INVOICING')}">
        </form>
    </c:if>
</t:pageTemplate>