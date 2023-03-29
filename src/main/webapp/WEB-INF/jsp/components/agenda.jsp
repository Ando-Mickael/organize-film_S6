<%@page import="mg.ando.model.Film"%>
<%@page import="java.time.LocalDate"%>
<%@page import="mg.ando.model.Scene"%>
<%@page import="mg.ando.dao.HibernateDao"%>
<%@page import="mg.ando.type.AgendaType"%>
<%@page import="java.util.List"%>
<%
	List<AgendaType> listAgendaType = (List<AgendaType>) request.getAttribute("scenes");
	HibernateDao dao = (HibernateDao) request.getAttribute("dao");
	LocalDate dateDebut = LocalDate.parse(request.getParameter("dateDebut"));
	int nbJourTournage = listAgendaType.get(listAgendaType.size() - 1).getJour() + 1;
	double dureeTotale = 0;
	Film film = dao.findById(Film.class, Integer.parseInt(request.getParameter("idFilm")));
%>

<main id="main" class="main">

    <div class="pagetitle">
        <h1><%=film.getNom()%></h1>
    </div>

    <section class="section">
        <div class="row">

            <div class="col-lg-8">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Agenda</h5>

                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Jour</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Scene</th>
                                    <th scope="col">Plateau</th>
                                    <th scope="col">Duree</th>
                                    <th scope="col">Details</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (AgendaType tmp : listAgendaType) {
										Scene s = dao.findById(Scene.class, tmp.getIdScene());
										LocalDate dateTournage = dateDebut.plusDays(tmp.getJour());
										dureeTotale += s.getDuree();
                                %>
                                <tr>
                                    <th scope="row">J<%=(tmp.getJour() + 1)%></th>
                                    <td><%=dateTournage%></td>
                                    <td><%=s.getNom()%></td>
                                    <td><%=tmp.getPlateau()%></td>
                                    <td><%=s.getDuree()%> min</td>
                                    <td><a href="planifier?id=<%=s.getId()%>&dateplanification=<%=dateTournage%>"><span class="badge bg-success">Plannifier</span></a></td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Statistics</h5>
                        <table class="table table-bordered">
                            <tr>
                                <th>Date de debut</th>
                                <td><%=dateDebut%></td>
                            </tr>
                            <tr>
                                <th>Date de fin</th>
                                <td><%=dateDebut.plusDays(nbJourTournage - 1)%></td>
                            </tr>
                            <tr>
                                <th>Nombre de jour de tournage</th>
                                <td><%=nbJourTournage%></td>
                            </tr>
                            <tr>
                                <th>Duree totale</th>
                                <td><%=dureeTotale%> min</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </section>

</main>

<script>
	function submitForm()
	{
		//création de l'objet XMLHttpRequest
		var xhr;
		try {
			xhr = new ActiveXObject('Msxml2.XMLHTTP');
		} catch (e)
		{
			try {
				xhr = new ActiveXObject('Microsoft.XMLHTTP');
			} catch (e2)
			{
				try {
					xhr = new XMLHttpRequest();
				} catch (e3) {
					xhr = false;
				}
			}
		}

		//Définition des changements d'états    
		xhr.onreadystatechange = function ()
		{
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					var retour = JSON.parse(xhr.responseText);
					var resultat = document.getElementById("dyn");

					resultat.value = retour[0].Nom;
				} else {
					document.dyn = "Error code " + xhr.status;
				}
			}
		};
		//XMLHttpRequest.open(method, url, async)
		xhr.open("GET", "/plannifier", true);

		//XMLHttpRequest.send(body)
		xhr.send(null);
	}
</script>