<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Publications</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
        rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
        rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/vendor/boxicons/css/boxicons.min.css"
        rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/vendor/simple-datatables/style.css"
        rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/style.css" rel="stylesheet">
</head>

<body>

    <%@include file="components/header.jsp" %>

        <%@include file="components/sidebarAdmin.jsp" %>

            <main id="main" class="main">

                <div class="pagetitle">
                    <h1>Administrateur</h1>
                </div><!-- End Page Title -->

                <section class="section">
                    <div class="row align-items-top">

                        <div class="col-lg-4">
                            <div class="card">
                                <img src="${pageContext.request.contextPath}/resources/assets/img/card.jpg"
                                    class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">Card with an image on top</h5>
                                    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                    <p class="card-text">Some quick example text to build on the card title and make up
                                        the bulk of the card's content.</p>
                                    <p class="card-text"><a href="#" class="btn btn-primary">Button</a></p>
                                </div>
                            </div><!-- End Card with an image on top -->
                        </div>

                        <div class="col-lg-4">
                            <div class="card">
                                <img src="${pageContext.request.contextPath}/resources/assets/img/card.jpg"
                                    class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">Card with an image on top</h5>
                                    <p class="card-text">Some quick example text to build on the card title and make up
                                        the bulk of the card's content.</p>
                                </div>
                            </div><!-- End Card with an image on top -->
                        </div>

                        <div class="col-lg-4">
                            <div class="card">
                                <img src="${pageContext.request.contextPath}/resources/assets/img/card.jpg"
                                    class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">Card with an image on top</h5>
                                    <p class="card-text">Some quick example text to build on the card title and make up
                                        the bulk of the card's content.</p>
                                </div>
                            </div><!-- End Card with an image on top -->
                        </div>

                    </div>

                    <div class="row card">
                        <div class="col-md-4">
                            <img src="assets/img/card.jpg" class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">Card with an image on left</h5>
                                <p class="card-text">This is a wider card with supporting text below as a natural
                                    lead-in to additional content. This content is a little bit longer.</p>
                            </div>
                        </div>
                    </div>
                </section>

            </main><!-- End #main -->

            <%@include file="components/footer.jsp" %>

                <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                        class="bi bi-arrow-up-short"></i></a>

                <!-- Vendor JS Files -->
                <script
                    src="${pageContext.request.contextPath}/resources/assets/vendor/apexcharts/apexcharts.min.js"></script>
                <script
                    src="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                <script src="${pageContext.request.contextPath}/resources/assets/vendor/chart.js/chart.min.js"></script>
                <script
                    src="${pageContext.request.contextPath}/resources/assets/vendor/echarts/echarts.min.js"></script>
                <script src="${pageContext.request.contextPath}/resources/assets/vendor/quill/quill.min.js"></script>
                <script
                    src="${pageContext.request.contextPath}/resources/assets/vendor/simple-datatables/simple-datatables.js"></script>
                <script
                    src="${pageContext.request.contextPath}/resources/assets/vendor/tinymce/tinymce.min.js"></script>
                <script
                    src="${pageContext.request.contextPath}/resources/assets/vendor/php-email-form/validate.js"></script>

                <!-- Template Main JS File -->
                <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

</body>

</html>