package mg.ando.model;

import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "indisponibiliteplateau")
public class IndisponibilitePlateau {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;
    
    @Column(name = "plateauid")
    Integer plateauId;
    
    Date date;

    public IndisponibilitePlateau() {
    }

    public IndisponibilitePlateau(Integer id, Integer plateauId, Date date) {
        this.id = id;
        this.plateauId = plateauId;
        this.date = date;
    }

    public IndisponibilitePlateau(Integer plateauId, Date date) {
        this.plateauId = plateauId;
        this.date = date;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPlateauId() {
        return plateauId;
    }

    public void setPlateauId(Integer plateauId) {
        this.plateauId = plateauId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

}
