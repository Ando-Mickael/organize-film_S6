<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="mg.ando.model.Element, java.util.List" %>
<%@include file="inc/bootstrap.jsp" %>

<%
    List<Element> listPublications = (List<Element>) request.getAttribute("listPublications");
%>

<div class="container">
    <div class="row">
        <div class="row">
            <h2>Liste des pubs</h2>
        </div>
        
        <div class="row">
            <form action="recherche" method="post">
                <div class="input-group">
                    <input 
                        type="text" 
                        class="form-control" 
                        placeholder="Ecrire ici..."
                        name="recherche">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit">Rechercher</button>
                    </span>
                </div>
            </form>
        </div>

        <div class="row">
            <% for (Element publication : listPublications) {%>
            <div class="well">
                <img width="250" src="<%= publication.getPhoto()%>">

                <% if (publication.getType().equals("article")) {%>
                <h2><%= publication.getTitre()%></h2>
                <% } else {%>
                <h2 style="color:blue"><%= publication.getTitre()%></h2>
                <% }%>

                <p><%= publication.getDescription()%></p>   

                <p style="text-transform: uppercase"><b><%= publication.getType()%></b></p>

                <%
                    if (publication.getType().equals("evenement")) {
                        out.print("<p><b>Date de debut :</b> " + publication.getDate_debut() + "</p>");
                        out.print("<p><b>Date de fin :</b> " + publication.getDate_fin() + "</p>");
                    } else
                        out.print("<p><b>Date de l'article :</b> " + publication.getDate_debut() + "</p>");
                %>

                <p><b>Date de creation :</b> <%= publication.getDate_creation()%></p>

                <p><b>Date de publication :</b> <%= publication.getDate_publication()%></p>

                <p><a href="${pageContext.request.contextPath}/formUpdatePub/<%=publication.getId()%>">Modifier</a></p>
            </div>
            <% }%>
        </div>

        <div class="row">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/paginate/1">1</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/paginate/2">2</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/paginate/3">3</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>
