<%@page import="mg.ando.model.Scene"%>
<%@page import="java.util.List"%>
<%
    List<Scene> listScene = (List<Scene>) request.getAttribute("scenes");
%>

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
                            <th scope="col">Voir Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Scene scene : listScene) { %>

                        <tr>
                            <th scope="row"><%out.print(scene.getId());%></th>
                            <td><%out.print(scene.getNom());%></td>
                            <td><%out.print(scene.getDuree());%> min</td>
                            <td><%out.print(scene.getPlateauid());%></td>
                            <td><a href="detailsScene?idScene=<%out.print(scene.getId());%>"><span class="badge bg-success">Details</span></a></td>
                        </tr>

                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>