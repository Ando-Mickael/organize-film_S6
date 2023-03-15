<%-- 
    Document   : planning
    Created on : 1 mars 2023, 09:40:43
    Author     : ReynoldsComputer
--%>

<%@page import="mg.ando.model.DetailsScene"%>
<%@page import="mg.ando.model.Film"%>
<%@page import="java.util.List"%>
<%

    List<DetailsScene> listDetailScenes = (List<DetailsScene>) request.getAttribute("detailScenes");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LIST SCENE-DETAIL</title>

        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" rel="icon">
        <link href="${pageContext.request.contextPath}/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/assets/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/resources/assets/vendor/simple-datatables/style.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="${pageContext.request.contextPath}/resources/assets/css/style.css" rel="stylesheet">
    </head>
    <body>

        <main>
            <div class="container">

                <div class="pagetitle">
                    <h1>MG PRODUCTION</h1>
                </div><!-- End Page Title -->

                <!-- Recent Sales -->
                <div class="col-12">
                    <div class="card recent-sales overflow-auto">

                        <div class="card-body">
                            <h5 class="card-title">DETAILS <span>| Today</span></h5>

                            <table class="table table-borderless datatable">
                                <thead>
                                    <tr>
                                        <th scope="col">#Num</th>
                                        <th scope="col">#Personnage</th>
                                        <th scope="col">Action</th>
                                        <th scope="col">#Expression</th>
                                        <th scope="col">Texte</th>
                                        <th scope="col">De</th>
                                        <th scope="col">A</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <%for (DetailsScene detail : listDetailScenes) { %>

                                    <tr>
                                        <th scope="row">#<%out.print(detail.getId());%></th>
                                        <th scope="row">#<%out.print(detail.getPersonnageid());%></th>
                                        <td><a href="#" class="text-primary"><%out.print(detail.getAction());%></a></td>
                                        <th scope="row">#<%out.print(detail.getExpressionid());%></th>
                                        <th scope="row">"<%out.print(detail.getTexte());%>"</th>
                                        <th scope="row"><%out.print(detail.getDebut());%>e min</th>
                                        <th scope="row"><%out.print(detail.getFin());%>e min</th>
                                    </tr>

                                    <%    }
                                    %>


                                </tbody>
                            </table>

                        </div>

                    </div>
                </div><!-- End Recent Sales -->

                <%@ include file="components/credits.jsp" %>
            </div>
        </main>

        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/chart.js/chart.min.js"></script>
        <script src="assets/vendor/echarts/echarts.min.js"></script>
        <script src="assets/vendor/quill/quill.min.js"></script>
        <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="assets/vendor/tinymce/tinymce.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
    </body>
</html>
