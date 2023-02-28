<%@include file="inc/bootstrap.jsp"%>

<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <h2>Admin</h2><hr />
            <form action="verifLoginAdmin" method="POST">
                <input
                    type="text" 
                    placeholder="Email" 
                    name="email" 
                    class="form-control"
                    value="admin@gmail.com"><br />
                <input 
                    type="password" 
                    placeholder="Mot de passe" 
                    name="mdp" 
                    class="form-control"
                    value="1234"><br />
                <button type="submit" class="btn btn-primary">Se connecter</button>
            </form>
        </div>
    </div>
</div>