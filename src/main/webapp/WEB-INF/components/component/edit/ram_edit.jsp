<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Магазин компьютерной техники (ADMIN)</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="<c:url value="/css/styles.css"/>">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="<c:url value="/js/script.js"/>"></script>
</head>
<body style="background-color: #508bfc;">

<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="<c:url value="/main"/>">Магазин компьютерной техники (ADMIN)</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main_nav"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="main_nav">
            <ul class="navbar-nav">
                <li class="nav-item active"><a class="nav-link" href="<c:url value="/main"/>"><spring:message
                        code="label.page.home"/></a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value="/catalog"/>"><spring:message
                        code="label.page.catalog"/></a></li>
                <li class="nav-item"><a class="nav-link" href="<c:url value="/config"/>"><spring:message
                        code="label.page.config"/></a></li>
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
                    <sec:authorize access="isAuthenticated()">
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
                    </sec:authorize>
                    <sec:authorize access="!isAuthenticated()">
                        <a class="nav-link dropdown-toggle" href="" data-bs-toggle="dropdown"
                           style="float: right"><spring:message code="label.page.profile"/></a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="<c:url value="/sign-in"/>"><spring:message
                                    code="label.auth.signin"/></a></li>
                            <li><a class="dropdown-item" href="<c:url value="/sign-up"/>"><spring:message
                                    code="label.auth.signup"/></a></li>
                        </ul>
                    </sec:authorize>
                </li>
            </ul>
        </div>
    </div>
</nav>

<section style="background-color: #508bfc; min-height: 77.6vh;">
    <div class="container py-5 mt-5">
        <div class="row d-flex justify-content-center align-items-center">
            <div class="col-12">
                <div class="card shadow-2-strong" style="border-radius: 1rem;">
                    <div class="card-body p-5 text-center">
                        <form id="add-component" action="<c:url value="/admin/ram/${ram.id}/edit"/>" method="post"
                              enctype="multipart/form-data">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                            <h3 class="mb-5">Update ram</h3>

                            <div class="errors mb-5">
                                <c:if test="${error != null}">
                                    <h5 class="mb-2" style="color: #b02a37">${error}</h5>
                                </c:if>
                            </div>

                            <div class="mb-3 row">
                                <label for="inputProducer" class="col-sm-3 col-form-label">
                                    <spring:message code="label.component.producer"/></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="producer" id="inputProducer"
                                           placeholder="RAM producer" value="${ram.producer}" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputModel" class="col-sm-3 col-form-label">
                                    <spring:message code="label.component.model"/></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="model" id="inputModel"
                                           placeholder="RAM model" value="${ram.model}" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputCore" class="col-sm-3 col-form-label">
                                    <spring:message code="label.ram.capacity"/></label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" name="capacity" id="inputCore"
                                           placeholder="RAM capacity" value="${ram.capacity}" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputCoreNum" class="col-sm-3 col-form-label">
                                    <spring:message code="label.ram.type"/></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="type" id="inputCoreNum"
                                           placeholder="RAM type" value="${ram.type}" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputSocket" class="col-sm-3 col-form-label">
                                    <spring:message code="label.ram.freq"/></label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" name="freq" id="inputSocket"
                                           placeholder="RAM frequency" step="any" value="${ram.freq}" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputCrystalName" class="col-sm-3 col-form-label">
                                    <spring:message code="label.ram.modules"/></label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" name="moduleSet" id="inputCrystalName"
                                           placeholder="RAM modules" value="${ram.moduleSet}" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputPrice" class="col-sm-3 col-form-label">Price</label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" name="price" id="inputPrice"
                                           placeholder="RAM price" step="any" value="${ram.price}" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="formFileSm" class="form-label"></label>
                                <input class="form-control form-control-sm" name="imageFile" id="formFileSm"
                                       type="file">
                            </div>

                        </form>

                        <button form="add-component" class="btn btn-primary btn-lg btn-block" type="submit">Edit
                        </button>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
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
