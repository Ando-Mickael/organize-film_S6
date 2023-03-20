package mg.ando.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "detailsscene")
public class DetailsScene {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    Integer id;
    String action;
    String texte;
    Double debut;
    Double fin;
    Integer sceneid;
    Integer expressionid;
    Integer personnageid;

    public DetailsScene() {
    }

    public DetailsScene(Integer id, String action, String texte, Double debut, Double fin, Integer sceneid, Integer expressionid, Integer personnageid) {
        this.id = id;
        this.action = action;
        this.texte = texte;
        this.debut = debut;
        this.fin = fin;
        this.sceneid = sceneid;
        this.expressionid = expressionid;
        this.personnageid = personnageid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getTexte() {
        return texte;
    }

    public void setTexte(String texte) {
        this.texte = texte;
    }

    public Double getDebut() {
        return debut;
    }

    public void setDebut(Double debut) {
        this.debut = debut;
    }

    public Double getFin() {
        return fin;
    }

    public void setFin(Double fin) {
        this.fin = fin;
    }

    public Integer getSceneid() {
        return sceneid;
    }

    public void setSceneid(Integer sceneid) {
        this.sceneid = sceneid;
    }

    public Integer getExpressionid() {
        return expressionid;
    }

    public void setExpressionid(Integer expressionid) {
        this.expressionid = expressionid;
    }

    public Integer getPersonnageid() {
        return personnageid;
    }

    public void setPersonnageid(Integer personnageid) {
        this.personnageid = personnageid;
    }

}
