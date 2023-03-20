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
    Integer filmid;
    Integer acteurid;

    public Personnage() {
    }

    public Personnage(Integer id, String pseudo, Integer filmid, Integer acteurid) {
        this.id = id;
        this.pseudo = pseudo;
        this.filmid = filmid;
        this.acteurid = acteurid;
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

    public Integer getFilmid() {
        return filmid;
    }

    public void setFilmid(Integer filmid) {
        this.filmid = filmid;
    }

    public Integer getActeurid() {
        return acteurid;
    }

    public void setActeurid(Integer acteurid) {
        this.acteurid = acteurid;
    }
    
    
    
}
