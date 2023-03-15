package mg.ando.type;

public class AgendaType {

    Integer idScene;
    Integer idPlateau;
    String plateau;
    Float duree;
    Integer jour;

    public AgendaType() {
    }

    public AgendaType(Integer idScene, Integer idPlateau, String plateau, Float duree, Integer jour) {
        this.idScene = idScene;
        this.idPlateau = idPlateau;
        this.plateau = plateau;
        this.duree = duree;
        this.jour = jour;
    }

    public Integer getIdScene() {
        return idScene;
    }

    public void setIdScene(Integer idScene) {
        this.idScene = idScene;
    }

    public Integer getIdPlateau() {
        return idPlateau;
    }

    public void setIdPlateau(Integer idPlateau) {
        this.idPlateau = idPlateau;
    }

    public String getPlateau() {
        return plateau;
    }

    public void setPlateau(String plateau) {
        this.plateau = plateau;
    }

    public Float getDuree() {
        return duree;
    }

    public void setDuree(Float duree) {
        this.duree = duree;
    }

    public Integer getJour() {
        return jour;
    }

    public void setJour(Integer jour) {
        this.jour = jour;
    }

    @Override
    public String toString() {
        return "AgendaType{" + "idScene=" + idScene + ", idPlateau=" + idPlateau + ", plateau=" + plateau + ", duree=" + duree + ", jour=" + jour + '}';
    }

}
