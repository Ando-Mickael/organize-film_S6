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
    Integer sceneId;
    Integer expressionId;
    Integer personnageId;

    public DetailsScene() {
    }

    public DetailsScene(Integer id, String action, String texte, Double debut, Double fin, Integer sceneId, Integer expressionId, Integer personnageId) {
        this.id = id;
        this.action = action;
        this.texte = texte;
        this.debut = debut;
        this.fin = fin;
        this.sceneId = sceneId;
        this.expressionId = expressionId;
        this.personnageId = personnageId;
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

    public Integer getSceneId() {
        return sceneId;
    }

    public void setSceneId(Integer sceneId) {
        this.sceneId = sceneId;
    }

    public Integer getExpressionId() {
        return expressionId;
    }

    public void setExpressionId(Integer expressionId) {
        this.expressionId = expressionId;
    }

    public Integer getPersonnageId() {
        return personnageId;
    }

    public void setPersonnageId(Integer personnageId) {
        this.personnageId = personnageId;
    }

}
