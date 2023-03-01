package mg.ando.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "scene")
public class Scene {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    Integer id;
    String nom;
    Double duree;
    Integer plateauid;
    Integer filmid;

    public Scene() {
    }

    public Scene(Integer id, String nom, Double duree, Integer plateauid, Integer filmid) {
        this.id = id;
        this.nom = nom;
        this.duree = duree;
        this.plateauid = plateauid;
        this.filmid = filmid;
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

    public Double getDuree() {
        return duree;
    }

    public void setDuree(Double duree) {
        this.duree = duree;
    }

    public Integer getPlateauid() {
        return plateauid;
    }

    public void setPlateauid(Integer plateauid) {
        this.plateauid = plateauid;
    }

    public Integer getFilmid() {
        return filmid;
    }

    public void setFilmid(Integer filmid) {
        this.filmid = filmid;
    }

}
