<%@page import="mg.ando.model.Auteur"%>
<%@include file="inc/bootstrap.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-md-3">
            <%@include file="inc/sidebarAuteur.jsp"%>
        </div>  
        <div class="col-md-8 col-md-offset-1">
            <div class="row">
                <h3>Inserer une publication</h3>
                <form action="addPublication" method="post">
                    <input
                        type="text" 
                        name="titre" 
                        placeholder="Titre"
                        class="form-control"><br>
                    <input 
                        type="text" 
                        name="photo" 
                        placeholder="Lien vers la photo"
                        class="form-control"><br>
                    <input 
                        type="text" 
                        name="description" 
                        placeholder="Description"
                        class="form-control"><br>
                    <input 
                        type="date" 
                        name="date_debut" 
                        placeholder="Date debut"
                        class="form-control"><br>
                    <input
                        type="date"
                        name="date_fin"
                        placeholder="Date Fin"
                        class="form-control"><br>
                    <select name="type" class="form-control">
                        <option value="evenement">Evenement</option>
                        <option value="article">Article</option>
                    </select><br>
                    <button type="submit" class="btn btn-primary">Ajouter</button>
                    <a href="allElement"><button type="button" class="btn btn-default">Annuler</button></a>
                </form>
            </div>
        </div>
    </div>
</div>
