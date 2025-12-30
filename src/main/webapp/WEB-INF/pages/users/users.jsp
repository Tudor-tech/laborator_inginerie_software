<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="activePage" value="Users"/>
<t:pageTemplate pageTitle="Users">
    <h1>Users</h1>

        <c:if test="${pageContext.request.isUserInRole('INVOICING')}">
            <form method="POST" action="${pageContext.request.contextPath}/Users">
        </c:if>

        <c:if test="${pageContext.request.isUserInRole('WRITE_USERS')}">
            <a href="${pageContext.request.contextPath}/AddUser" class="btn btn-primary btn-lg">Add User</a>
            <button class="btn btn-secondary" type="submit">Invoice</button>
        </c:if>

        <div class="container text-center">
            <c:forEach var="user" items="${users}">
                <div class="row">
                    <c:if test="${pageContext.request.isUserInRole('INVOICING')}">
                        <div class="col">
                            <input type="checkbox" name="user_ids" value="${user.id}" />
                        </div>
                    </c:if>

                    <div class="col">
                            ${user.username}
                    </div>

                    <div class="col">

                    </div>

                    <div class="col">
                            ${user.email}
                    </div>
                </div>
            </c:forEach>
        </div>

    <c:if test="${pageContext.request.isUserInRole('INVOICING')}">
        </form>
    </c:if>

    <c:if test="${not empty invoices}">
        <h2>Invoices</h2>
        <c:forEach var="username" items="${invoices}" varStatus="status">
            ${status.index + 1}. ${username}
            <br/>
        </c:forEach>
    </c:if>
</t:pageTemplate>
