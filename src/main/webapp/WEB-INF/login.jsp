<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign in</title>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>
<body>

<section class="vh-100" style="background-color: #ffffff;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card shadow-2-strong" style="border-radius: 1rem;">
                    <div class="card-body p-5 text-center">
                        <form id="login" action="<c:url value="/sign-in"/>" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                            <h3 class="mb-5">Sign in</h3>

                            <c:if test="${param['error'] != null}">
                                <h3 class="mb-5" style="color: #b02a37">Wrong login or password</h3>
                            </c:if>

                            <div class="form-outline mb-4">
                                <label class="form-label">
                                    <input type="email" id="typeEmailX-2" class="form-control form-control-lg"
                                           name="email" placeholder="Email"/>
                                </label>
                            </div>

                            <div class="form-outline mb-4">
                                <label class="form-label">
                                    <input type="password" id="typePasswordX-2" class="form-control form-control-lg"
                                           name="password" placeholder="Password"/>
                                </label>
                            </div>
                        </form>

                        <button form="login" class="btn btn-primary btn-lg btn-block" type="submit">Login</button>

                        <hr class="my-4">

                        <a href="<c:url value="/sign-up"/>">
                            <input type="button" class="btn btn-primary btn-lg btn-block" value="Sign up">
                        </a>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
