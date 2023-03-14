<%@page import="mg.ando.model.Film"%>
<%@page import="java.util.List"%>
<%
    List<Film> listFilm = (List<Film>) request.getAttribute("films");
%>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>Organiser</h1>
    </div>

    <section class="section">
        <div class="row">

            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Organiser</h5>

                        <form class="row g-3" action="${pageContext.request.contextPath}/agenda">
                            <div class="col-md-12">
                                <div class="form-floating mb-3">
                                    <select class="form-select" id="film" aria-label="State" name="idFilm">
                                        <% for (Film tmp : listFilm) { %>
                                        <option value="<%=tmp.getId()%>"><%=tmp.getNom()%></option>
                                        <% }%>
                                    </select>
                                    <label for="film">Film</label>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-floating">
                                    <input type="date" class="form-control" id="dateDebut" placeholder="Date de debut" name="dateDebut" required>
                                    <label for="dateDebut">Date de debut</label>
                                </div>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Organiser</button>
                                <button type="reset" class="btn btn-secondary">Annuler</button>
                            </div>
                        </form>

                    </div>
                </div>

            </div>
        </div>
    </section>

</main>