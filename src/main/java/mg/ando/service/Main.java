package mg.ando.service;

import mg.ando.mailJava.SendEmail;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello World!");

        MyPdf myPdf = new MyPdf();

        int idFilm = 8;
        // myPdf.generatePdf(idFilm, "2023-03-29");

        SendEmail sendEmail = new SendEmail();

        sendEmail.send("medra7638@gmail.com", "output.pdf");

        // projet etude mdp google : nbblypedjzjotuec
    }
}
