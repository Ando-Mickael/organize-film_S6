<%@page import="mg.ando.model.Acteur"%>
<%@page import="mg.ando.dao.HibernateDao"%>
<%@page import="mg.ando.model.Plateau"%>
<%@page import="mg.ando.model.Scene"%>
<%@page import="java.util.List"%>
<%
    HibernateDao dao = (HibernateDao) request.getAttribute("dao");
    List<Plateau> listPlateau = (List<Plateau>) request.getAttribute("plateaux");
    List<Acteur> listActeur = (List<Acteur>) request.getAttribute("acteurs");
%>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>Gestion des Disponibilite</h1>
    </div>

    <section class="section">
        <div class="row">
            <div class="col-lg-6">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Plateaux</h5>
                        <hr>

                        <form class="row g-3" action="${pageContext.request.contextPath}/#">
                            <div class="col-md-12">
                                <div class="form-floating mb-3">
                                    <select class="form-select" id="film" aria-label="State" name="idPlateau">

                                        <% for (Plateau plateau : listPlateau) { %>
                                            <option value="<%=plateau.getId()%>"><%=plateau.getNom()%></option>
                                        <%    }
                                        %>
                                        
                                    </select>
                                    <label for="Plateau">Plateaux</label>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-floating">
                                    <input type="date" class="form-control" id="dateDebut" placeholder="Date d'indisponiblite" name="dateDebut" required>
                                    <label for="dateDebut">Date</label>
                                </div>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-danger">Indisponible</button>
                                <button type="reset" class="btn btn-secondary">Annuler</button>
                            </div>
                        </form>


                    </div>
                </div>

            </div>

            <div class="col-lg-6">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Acteurs</h5>
                        <hr/>

                        <form class="row g-3" action="${pageContext.request.contextPath}/#">
                            <div class="col-md-12">
                                <div class="form-floating mb-3">
                                    <select class="form-select" id="film" aria-label="State" name="idActeur">
                                        <% for (Acteur acteur : listActeur) { %>
                                            <option value="<%=acteur.getId()%>"><%=acteur.getNom()%></option>
                                        <%    }
                                        %>
                                    </select>
                                    <label for="Acteur">Acteurs</label>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-floating">
                                    <input type="date" class="form-control" id="dateDebut" placeholder="Date d'indisponiblite" name="dateDebut" required>
                                    <label for="dateDebut">Date</label>
                                </div>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-danger">Indisponible</button>
                                <button type="reset" class="btn btn-secondary">Annuler</button>
                            </div>
                        </form>


                    </div>
                </div>

            </div>

        </div>

    </section>

</main>