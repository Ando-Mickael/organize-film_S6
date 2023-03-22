package mg.ando.model;

import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "indisponibiliteacteur")
public class IndisponibiliteActeur {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    
    @Column(name = "acteurid")
    Integer acteurId;
    
    Date date;

    public IndisponibiliteActeur() {
    }

    public IndisponibiliteActeur(Integer id, Integer acteurId, Date date) {
        this.id = id;
        this.acteurId = acteurId;
        this.date = date;
    }

    public IndisponibiliteActeur(Integer acteurId, Date date) {
        this.acteurId = acteurId;
        this.date = date;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getActeurId() {
        return acteurId;
    }

    public void setActeurId(Integer acteurId) {
        this.acteurId = acteurId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

}
