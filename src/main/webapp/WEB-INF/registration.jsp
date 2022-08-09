<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Sign up</title>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>
<body>

<section class="vh-100" style="background-color: #508bfc;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card shadow-2-strong" style="border-radius: 1rem;">
                    <div class="card-body p-5 text-center">
                        <form:form id="sign-up" action="/sign-up" modelAttribute="user" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                            <h3 class="mb-5">Sign up</h3>

                            <div class="errors mb-5">
                                <c:if test="${error != null}">
                                    <h5 class="mb-2" style="color: #b02a37">${error}</h5>
                                </c:if>
                                <div>
                                    <h5 class="mb-2" style="color: #b02a37"><form:errors path="firstName"/></h5>
                                </div>
                                <div>
                                    <h5 class="mb-2" style="color: #b02a37"><form:errors path="lastName"/></h5>
                                </div>
                                <div>
                                    <h5 class="mb-2" style="color: #b02a37"><form:errors path="email"/></h5>
                                </div>
                                <div>
                                    <h5 class="mb-2" style="color: #b02a37"><form:errors path="password"/></h5>
                                </div>
                            </div>

                            <div class="form-outline mb-4">
                                <form:label path="firstName" class="form-label">
                                    <form:input path="firstName" type="text" id="typeTextX-2"
                                                class="form-control form-control-lg"
                                                name="firstName" placeholder="First name" value="${user.firstName}"/>
                                </form:label>
                            </div>

                            <div class="form-outline mb-4">
                                <form:label path="lastName" class="form-label">
                                    <form:input path="lastName" type="text" id="typeTextX-3"
                                                class="form-control form-control-lg"
                                                name="lastName" placeholder="Last name" value="${user.lastName}"/>
                                </form:label>
                            </div>

                            <div class="form-outline mb-4">
                                <form:label path="email" class="form-label">
                                    <form:input path="email" type="email" id="typeEmailX-2"
                                                class="form-control form-control-lg"
                                                name="email" placeholder="Email" value="${user.email}"/>
                                </form:label>
                            </div>

                            <div class="form-outline mb-4">
                                <form:label path="password" class="form-label">
                                    <form:input path="password" type="password" id="typePasswordX-2"
                                                class="form-control form-control-lg"
                                                name="password" placeholder="Password"/>
                                </form:label>
                            </div>

                            <div class="form-outline mb-4">
                                <label class="form-label">
                                    <input type="password" id="typePasswordX-3" class="form-control form-control-lg"
                                           name="confirm" placeholder="Confirm password"/>
                                </label>
                            </div>

                        </form:form>

                        <button form="sign-up" class="btn btn-primary btn-lg btn-block" type="submit">Create</button>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
