<%@page import="mg.ando.dao.HibernateDao"%>
<%@page import="mg.ando.model.Plateau"%>
<%@page import="mg.ando.model.Scene"%>
<%@page import="java.util.List"%>
<%
    HibernateDao dao = (HibernateDao) request.getAttribute("dao");
    List<Scene> listScene = (List<Scene>) request.getAttribute("scenes");
%>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>Liste des scenes</h1>
    </div>

    <section class="section">
        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Scenes</h5>

                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Nom</th>
                                    <th scope="col">Duree</th>
                                    <th scope="col">Plateau</th>
                                    <th scope="col">Auteurid</th>
                                    <th scope="col">Voir Details</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Scene scene : listScene) {
                                    Plateau p = dao.findById(Plateau.class, scene.getPlateauid());
                                %>

                                <tr>
                                    <th scope="row"><%=(scene.getId())%></th>
                                    <td><%=(scene.getNom())%></td>
                                    <td><%=(scene.getDuree())%> min</td>
                                    <td><%=(scene.getAuteurid())%></td>
                                    <td><%=(p.getNom())%></td>
                                    <td><a href="detailsScene?idScene=<%=(scene.getId())%>"><span class="badge bg-success">Details</span></a></td>
                                </tr>

                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>

    </section>

</main>