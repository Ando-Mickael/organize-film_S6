package mg.ando.model;

import java.sql.Date;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "element")
public class Element {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    Integer id;
    String titre;
    String photo;
    String description;
    Date date_debut;
    Date date_fin;
    String type;
    Integer statut;
    Integer id_auteur;
    Date date_creation;
    LocalDateTime date_publication;
    LocalDateTime favori;

    public Element() {
    }

    public Element(String titre, String photo, String description, Date date_debut, Date date_fin, String type, LocalDateTime date_publication, Integer id_auteur) {
        this.titre = titre;
        this.photo = photo;
        this.description = description;
        this.date_debut = date_debut;
        this.date_fin = date_fin;
        this.type = type;
        this.date_publication = date_publication;
        this.id_auteur = 1;
        this.statut = 0;
    }


    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitre() {
        return this.titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getPhoto() {
        return this.photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDate_debut() {
        return this.date_debut;
    }

    public void setDate_debut(Date date_debut) {
        this.date_debut = date_debut;
    }

    public Date getDate_fin() {
        return this.date_fin;
    }

    public void setDate_fin(Date date_fin) {
        this.date_fin = date_fin;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getStatut() {
        return this.statut;
    }

    public void setStatut(Integer statut) {
        this.statut = statut;
    }

    public Integer getId_auteur() {
        return this.id_auteur;
    }

    public void setId_auteur(Integer id_auteur) {
        this.id_auteur = id_auteur;
    }

    public Date getDate_creation() {
        return this.date_creation;
    }

    public void setDate_creation(Date date_creation) {
        this.date_creation = date_creation;
    }

    public LocalDateTime getDate_publication() {
        return this.date_publication;
    }

    public void setDate_publication(LocalDateTime date_publication) {
        this.date_publication = date_publication;
    }

    public LocalDateTime getFavori() {
        return favori;
    }

    public void setFavori(LocalDateTime favori) {
        this.favori = favori;
    }

    @Override
    public String toString() {
        return "Element{" + "id=" + id + ", titre=" + titre + ", photo=" + photo + ", description=" + description + ", date_debut=" + date_debut + ", date_fin=" + date_fin + ", type=" + type + ", statut=" + statut + ", id_auteur=" + id_auteur + ", date_creation=" + date_creation + ", date_publication=" + date_publication + ", favori=" + favori + '}';
    }

}
