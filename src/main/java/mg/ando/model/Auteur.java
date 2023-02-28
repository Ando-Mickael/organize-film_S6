package mg.ando.model;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Table(name = "auteur")
public class Auteur {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    Integer id;
    String pseudo;
    String email;
    String mdp;

    public Auteur() {
    }

    public Auteur(Integer id, String pseudo, String email, String mdp) {
        this.id = id;
        this.pseudo = pseudo;
        this.email = email;
        this.mdp = mdp;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPseudo() {
        return this.pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMdp() {
        return this.mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    @Override
    public String toString() {
        return "{"
                + " id='" + getId() + "'"
                + ", pseudo='" + getPseudo() + "'"
                + ", email='" + getEmail() + "'"
                + ", mdp='" + getMdp() + "'"
                + "}";
    }

}
