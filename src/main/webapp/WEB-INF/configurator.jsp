<%@ page import="com.mysql.cj.xdevapi.Collection" %>
<%@ page import="org.hibernate.engine.internal.Collections" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title><spring:message code="label.page.config"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="<c:url value="/css/styles.css"/>">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="<c:url value="/js/script.js"/>"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="<c:url value="/main"/>">Магазин компьютерной техники</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main_nav"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="main_nav">
            <ul class="navbar-nav">
                <li class="nav-item active"><a class="nav-link" href="<c:url value="/main"/>"><spring:message
                        code="label.page.home"/></a></li>
                <li class="nav-item dropdown" id="myDropdown1">
                    <a class="nav-link dropdown-toggle" href="" data-bs-toggle="dropdown"
                       style="float: right"><spring:message code="label.lang"/></a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="<c:url value="?lang=en"/>"><spring:message
                                code="label.lang.en"/></a></li>
                        <li><a class="dropdown-item" href="<c:url value="?lang=ru"/>"><spring:message
                                code="label.lang.ru"/></a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown" id="myDropdown">
                    <a class="nav-link dropdown-toggle" href="" data-bs-toggle="dropdown"
                       style="float: right"><sec:authentication property="principal.firstName"/> <sec:authentication
                            property="principal.lastName"/></a>
                    <ul class="dropdown-menu">
                        <sec:authentication property="principal.id" var="user_id"/>
                        <li><a class="dropdown-item" href="<c:url value="/user/${user_id}"/>"><spring:message
                                code="label.page.account"/></a></li>
                        <sec:authorize access="hasAuthority('ADMIN')">
                            <li><a class="dropdown-item" href="<c:url value="/admin"/>"><spring:message
                                    code="label.page.settings"/></a></li>
                        </sec:authorize>
                        <li>
                            <form action="<c:url value="/logout"/>" method="post">
                                <a class="dropdown-item" href="<c:url value="/logout"/>"><spring:message
                                        code="label.auth.signout"/></a>
                            </form>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container align-items-center mt-5 pt-3 " style="min-height: 77.6vh;">
    <div class="row align-middle align-items-center">
        <h1 class="col-9">Нажмите NEW, чтобы сделать заказ</h1>
        <form action="<c:url value="/config/computer/new"/>" class="col-3" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div class="row align-items-center align-middle">
                <label class="col-8">
                    <input type="text" name="title" placeholder="Название заказа" required>
                </label>
                <button class="btn btn-success col-4">New</button>
            </div>
        </form>
    </div>
    <c:if test="${computers.size() != 0}">
        <h1>Мои заказы</h1>
    </c:if>
    <c:if test="${computers.size() == 0}">
        <h1 class="justify-content-center align-middle">У вас нет заказов</h1>
    </c:if>
    <c:forEach items="${computers}" var="computer">
        <div class="row">
            <div class="card mt-1">
                <div class="card-body">
                    <div class="row">
                        <div class="col-8">
                            <h1><a href="/config/computer/${computer.id}" class="text-decoration-none"><h5
                                    class="card-title">${computer.title}</h5></a></h1>
                        </div>
                        <div class="col-2">
                            <h5 class="btn btn-warning w-100">${computer.totalPrice} <spring:message
                                    code="label.currency.byn"/></h5>
                        </div>
                        <div class="col-1">
                            <form action="/config/computer/${computer.id}/edit" method="get">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="submit" class="btn btn-primary w-100" value="Edit">
                            </form>
                        </div>
                        <div class="col-1">
                            <form action="/config/computer/${computer.id}/delete" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="submit" class="btn btn-danger w-100" value="Delete">
                            </form>
                        </div>
                    </div>
                    <p class="card-text">${computer.processor.toString()}, ${computer.graphicsCard.toString()},
                            ${computer.motherBoard.toString()}, ${computer.hdd.toString()}, ${computer.ssd.toString()},
                            ${computer.ram.toString()}, ${computer.powerUnit.toString()}, ${computer.computerCase.toString()}
                    </p>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<footer class="bg-primary text-center text-white mt-5 w-100" style="background-color: #f1f1f1;">
    <div class="container pt-1">

        <section class="mb-1">

            <a
                    class="btn btn-link btn-floating btn-lg text-dark m-1"
                    href="https://github.com/AlexandrMikyanets"
                    role="button"
                    data-mdb-ripple-color="dark"
                    target="_blank"
            >
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-github"
                     viewBox="0 0 16 16">
                    <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"/>
                </svg>
            </a>

            <a
                    class="btn btn-link btn-floating btn-lg text-dark m-1"
                    href="https://www.linkedin.com/in/alexandr-mikyanets-1ba0a922a/"
                    role="button"
                    data-mdb-ripple-color="dark"
                    target="_blank"
            >
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor"
                     class="bi bi-linkedin" viewBox="0 0 16 16">
                    <path d="M0 1.146C0 .513.526 0 1.175 0h13.65C15.474 0 16 .513 16 1.146v13.708c0 .633-.526 1.146-1.175 1.146H1.175C.526 16 0 15.487 0 14.854V1.146zm4.943 12.248V6.169H2.542v7.225h2.401zm-1.2-8.212c.837 0 1.358-.554 1.358-1.248-.015-.709-.52-1.248-1.342-1.248-.822 0-1.359.54-1.359 1.248 0 .694.521 1.248 1.327 1.248h.016zm4.908 8.212V9.359c0-.216.016-.432.08-.586.173-.431.568-.878 1.232-.878.869 0 1.216.662 1.216 1.634v3.865h2.401V9.25c0-2.22-1.184-3.252-2.764-3.252-1.274 0-1.845.7-2.165 1.193v.025h-.016a5.54 5.54 0 0 1 .016-.025V6.169h-2.4c.03.678 0 7.225 0 7.225h2.4z"/>
                </svg>
            </a>

            <a
                    class="btn btn-link btn-floating btn-lg text-dark m-1"
                    href="https://t.me/n0vell"
                    role=e"button"
                    data-mdb-ripple-color="dark"
                    target="_blank"
            >
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor"
                     class="bi bi-telegram" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.287 5.906c-.778.324-2.334.994-4.666 2.01-.378.15-.577.298-.595.442-.03.243.275.339.69.47l.175.055c.408.133.958.288 1.243.294.26.006.549-.1.868-.32 2.179-1.471 3.304-2.214 3.374-2.23.05-.012.12-.026.166.016.047.041.042.12.037.141-.03.129-1.227 1.241-1.846 1.817-.193.18-.33.307-.358.336a8.154 8.154 0 0 1-.188.186c-.38.366-.664.64.015 1.088.327.216.589.393.85.571.284.194.568.387.936.629.093.06.183.125.27.187.331.236.63.448.997.414.214-.02.435-.22.547-.82.265-1.417.786-4.486.906-5.751a1.426 1.426 0 0 0-.013-.315.337.337 0 0 0-.114-.217.526.526 0 0 0-.31-.093c-.3.005-.763.166-2.984 1.09z"/>
                </svg>
            </a>

        </section>

    </div>
</footer>
</body>
</html>
