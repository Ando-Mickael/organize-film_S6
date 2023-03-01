package mg.ando.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "personnage")
public class Personnage {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    Integer id;
    String pseudo;
    Integer filmId;
    Integer acteurId;

    public Personnage() {
    }

    public Personnage(Integer id, String pseudo, Integer filmId, Integer acteurId) {
        this.id = id;
        this.pseudo = pseudo;
        this.filmId = filmId;
        this.acteurId = acteurId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    public Integer getFilmId() {
        return filmId;
    }

    public void setFilmId(Integer filmId) {
        this.filmId = filmId;
    }

    public Integer getActeurId() {
        return acteurId;
    }

    public void setActeurId(Integer acteurId) {
        this.acteurId = acteurId;
    }
    
    
    
}
