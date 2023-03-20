<%@page import="mg.ando.model.DetailsScene"%>
<%@page import="java.util.List"%>
<%
    List<DetailsScene> listDetailsScene = (List<DetailsScene>) request.getAttribute("detailsScene");
%>

<div class="row">

    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Details scenes</h5>

                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Personnage</th>
                            <th scope="col">Expression</th>
                            <th scope="col">Action</th>
                            <th scope="col">Texte</th>
                            <th scope="col">Debut</th>
                            <th scope="col">Fin</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (DetailsScene detail : listDetailsScene) { %>

                        <tr>
                            <th scope="row"><%out.print(detail.getId());%></th>
                            <td><%out.print(detail.getPersonnageid());%></td>
                            <td><%out.print(detail.getExpressionid());%></td>
                            <td><%out.print(detail.getAction());%></td>
                            <td>"<%out.print(detail.getTexte());%>"</td>
                            <td><%out.print(detail.getDebut());%> min</td>
                            <td><%out.print(detail.getFin());%> min</td>
                        </tr>

                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>