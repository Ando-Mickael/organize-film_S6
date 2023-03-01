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
    Integer plateauId;
    Integer filmId;

    public Scene() {
    }

    public Scene(Integer id, String nom, Double duree, Integer plateauId, Integer filmId) {
        this.id = id;
        this.nom = nom;
        this.duree = duree;
        this.plateauId = plateauId;
        this.filmId = filmId;
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

    public Integer getPlateauId() {
        return plateauId;
    }

    public void setPlateauId(Integer plateauId) {
        this.plateauId = plateauId;
    }

    public Integer getFilmId() {
        return filmId;
    }

    public void setFilmId(Integer filmId) {
        this.filmId = filmId;
    }

}
