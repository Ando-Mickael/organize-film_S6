package mg.ando.model;

import java.sql.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "scene")
public class Scene {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;

	@Column(name = "nom")
	String nom;

	@Column(name = "duree")
	Double duree;

	@Column(name = "plateauid")
	Integer plateauid;

	@Column(name = "filmid")
	Integer filmid;

	@Column(name = "auteurid")
	Integer auteurid;

	@Column(name = "ordre")
	Integer ordre;

	@Column(name = "dateplanification")
	Date dateplanification;

	@Column(name = "status")
	Integer status;

//	construct
	public Scene() {
	}

	public Scene(String nom, Double duree, Integer plateauid, Integer filmid, Integer auteurid) {
		this.nom = nom;
		this.duree = duree;
		this.plateauid = plateauid;
		this.filmid = filmid;
		this.auteurid = auteurid;
	}

//	get & set
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

	public Integer getOrdre() {
		return ordre;
	}

	public void setOrdre(Integer ordre) {
		this.ordre = ordre;
	}

	public Date getdateplanification() {
		return dateplanification;
	}

	public void setDateplanification(Date dateplanification) {
		this.dateplanification = dateplanification;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getAuteurid() {
		return auteurid;
	}

	public void setAuteurid(Integer auteurid) {
		this.auteurid = auteurid;
	}

	@Override
	public String toString() {
		return "Scene{" + "id=" + id + ", nom=" + nom + ", duree=" + duree + ", plateauid=" + plateauid + ", filmid=" + filmid + ", auteurid=" + auteurid + ", ordre=" + ordre + ", dateplanification=" + dateplanification + ", status=" + status + '}';
	}

//	my functions
	public static double dureeTotale(List<Scene> listScene) {
		double result = 0;

		for (Scene tmp : listScene) {
			result += tmp.getDuree();
		}

		return result;
	}

}
