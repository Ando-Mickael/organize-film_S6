package mg.ando.service;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello World!");

        MyPdf myPdf = new MyPdf();

        int idFilm = 8;
        myPdf.generatePdf(idFilm, "2023-03-29");
    }
}
