<%@page import="mg.ando.model.Element"%>
<%@include file="inc/bootstrap.jsp"%>
<%
    Element e = (Element) request.getAttribute("publication");
%>

<div class="container">
    <div class="row">
        <h2>Modifier une pub</h2>
        <form action="${pageContext.request.contextPath}/updatePub" method="post">
            <input type="hidden" name="id" value="<%=e.getId()%>" />
            <div class="form-group">
                <label for="titre">Titre</label>
                <input class="form-control" type="text" name="titre" id="titre" value="<%=e.getTitre()%>">
            </div>
            <div class="form-group">
                <label for="photo">URL Photo</label>
                <input class="form-control" type="text" name="photo" id="photo" value="<%=e.getPhoto()%>">
            </div>
            <div class="form-group">
                <label for="titre">Description</label>
                <textarea class="form-control" name="description" id="description"><%=e.getDescription()%></textarea>
            </div>
            <input type="checkbox" name="favorie" />
            <button type="submit" class="btn btn-primary">Modifier</button>
        </form>
    </div>
</div>