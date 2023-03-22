package mg.ando.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "film")
public class Film {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
	
    String nom;
    
	@Column(name = "auteurid")
	Integer auteurid;

    public Film() {
    }

    public Film(Integer id, String nom, Integer auteurid) {
        this.id = id;
        this.nom = nom;
        this.auteurid = auteurid;
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

    public Integer getAuteurid() {
        return auteurid;
    }

    public void setAuteurid(Integer auteurid) {
        this.auteurid = auteurid;
    }

}
