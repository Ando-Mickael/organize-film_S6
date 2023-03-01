package mg.ando.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "film")
public class Film {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    Integer id;
    String nom;
    Integer auteurId;

    public Film() {
    }

    public Film(Integer id, String nom, Integer auteurId) {
        this.id = id;
        this.nom = nom;
        this.auteurId = auteurId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Integer getAuteurId() {
        return auteurId;
    }

    public void setAuteurId(Integer auteurId) {
        this.auteurId = auteurId;
    }

}
