<%@page import="mg.ando.model.Film"%>
<%@page import="java.util.List"%>
<%
    List<Film> listFilm = (List<Film>) request.getAttribute("films");
%>

<div class="row">
    <div class="col-lg-12">

        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Films</h5>

                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nom</th>
                            <th scope="col">Auteur</th>
                            <th scope="col">Voir Scenes</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Film film : listFilm) { %>

                        <tr>
                            <th scope="row"><%out.print(film.getId());%></th>
                            <td><%out.print(film.getNom());%></td>
                            <td><%out.print(film.getAuteurid());%></td>
                            <td><a href="scenes?idFilm=<%out.print(film.getId());%>"><span class="badge bg-success">Details</span></a></td>
                        </tr>

                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>