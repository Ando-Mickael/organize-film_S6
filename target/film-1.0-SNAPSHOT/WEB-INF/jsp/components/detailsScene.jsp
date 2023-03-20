<%@page import="mg.ando.model.Personnage"%>
<%@page import="mg.ando.dao.HibernateDao"%>
<%@page import="mg.ando.model.Expression"%>
<%@page import="mg.ando.model.DetailsScene"%>
<%@page import="java.util.List"%>
<%
    HibernateDao dao = (HibernateDao) request.getAttribute("dao");
    List<DetailsScene> listDetailsScene = (List<DetailsScene>) request.getAttribute("detailsScene");
%>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>Liste des details scene</h1>
    </div>

    <section class="section">
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
                                <%for (DetailsScene detail : listDetailsScene) {
                                    Expression e = dao.findById(Expression.class, detail.getExpressionid());
                                    Personnage p = dao.findById(Personnage.class, detail.getPersonnageid());
                                %>

                                <tr>
                                    <th scope="row"><%=(detail.getId())%></th>
                                    <td><%=(p.getPseudo())%></td>
                                    <td><%=(e.getExpression())%></td>
                                    <td><%=(detail.getAction())%></td>
                                    <td>"<%=(detail.getTexte())%>"</td>
                                    <td><%=(detail.getDebut())%> min</td>
                                    <td><%=(detail.getFin())%> min</td>
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