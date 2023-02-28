<%
    Integer id_auteur = (Integer) session.getAttribute("id_auteur");
%>

<ul>
    <li><a href="${pageContext.request.contextPath}/auteur">Tous les publications</a></li>
    <li><a href="${pageContext.request.contextPath}/publicationsByAuteur/<%=id_auteur%>">Mes publications</a></li>
    <li><a href="${pageContext.request.contextPath}/logout">Se deconnecter</a></li>
</ul>

<%@include file="publications.jsp" %>
