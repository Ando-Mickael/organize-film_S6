package mg.ando.service;

import java.io.FileOutputStream;
import java.time.LocalDate;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import mg.ando.dao.HibernateDao;
import mg.ando.model.DetailsScene;
import mg.ando.model.Expression;
import mg.ando.model.Film;
import mg.ando.model.Personnage;
import mg.ando.model.Scene;
import mg.ando.type.AgendaType;

import java.util.List;

public class MyPdf {

    /**
     * @param idFilm
     */
    public void generatePdf(int idFilm, String dateDeb) {

        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-context.xml");
        HibernateDao dao = (HibernateDao) ctx.getBean("hibernateDAO");
        Film film = dao.findById(Film.class, idFilm);
        LocalDate dateDebut = LocalDate.parse(dateDeb);
        int nbJourTournage = dao.selectAgendaFilm(Integer.toString(idFilm))
                .get(dao.selectAgendaFilm(Integer.toString(idFilm)).size() - 1).getJour() + 1;
        double dureeTotale = 0;

        System.out.println("dateDebut : " + dateDebut);
        System.out.println("nbJourTournage : " + nbJourTournage);
        System.out.println("dureeTotale : " + dureeTotale);


        try {
            List<AgendaType> listAgendaType = dao.selectAgendaFilm(Integer.toString(idFilm));

            Document document = new Document(PageSize.A4, 0, 0, 50, 50);
            PdfWriter.getInstance(document, new FileOutputStream("output.pdf"));
            document.open();

            // Create a font object for the title
            Font titleFont = new Font(Font.FontFamily.TIMES_ROMAN, 36, Font.BOLD);

            // Create a new paragraph object for the title
            Paragraph title = new Paragraph(film.getNom(), titleFont);

            // Set the alignment of the title to center
            title.setAlignment(Element.ALIGN_CENTER);

            // Add the title to the document
            document.add(title);

            // Create a new paragraph object for the empty line
            Paragraph emptyLine = new Paragraph("\n");

            // Add the empty line to the document
            document.add(emptyLine);
            document.add(emptyLine);

            // Planning
            Paragraph paragraph = new Paragraph();
            for (AgendaType agendaType : listAgendaType) {
                Scene s = dao.findById(Scene.class, agendaType.getIdScene());
                LocalDate dateTournage = dateDebut.plusDays(agendaType.getJour());
                dureeTotale += s.getDuree();

                // jour
                paragraph = new Paragraph();
                paragraph.setIndentationLeft(50);
                paragraph.add("Jour " + Integer.toString(agendaType.getJour() + 1));
                document.add(paragraph);

                // date
                paragraph = new Paragraph();
                paragraph.setIndentationLeft(100);
                paragraph.add("Date : " + dateTournage);
                document.add(paragraph);

                // scene
                paragraph = new Paragraph();
                paragraph.setIndentationLeft(100);
                paragraph.add("Scene : " + s.getNom());
                document.add(paragraph);

                // plateau
                paragraph = new Paragraph();
                paragraph.setIndentationLeft(100);
                paragraph.add("Plateau : " + agendaType.getPlateau());
                document.add(paragraph);

                // detail scene
                List<DetailsScene> listDetailScene = dao.getSceneDetail(DetailsScene.class,
                        s.getId());
                for (DetailsScene detailsScene : listDetailScene) {
                    document.add(emptyLine);

                    // action
                    paragraph = new Paragraph();
                    paragraph.setIndentationLeft(150);
                    paragraph.add("- Action : " + detailsScene.getAction());
                    document.add(paragraph);

                    // duree
                    paragraph = new Paragraph();
                    paragraph.setIndentationLeft(150);
                    paragraph
                            .add("- Duree : " + detailsScene.getDebut() + "e min A " + detailsScene.getFin() + "e min");
                    document.add(paragraph);

                    // expression
                    Expression e = dao.findById(Expression.class, detailsScene.getExpressionid());
                    paragraph = new Paragraph();
                    paragraph.setIndentationLeft(150);
                    paragraph.add("- Expression : " + e.getExpression());
                    document.add(paragraph);

                    // personnage
                    Personnage p = dao.findById(Personnage.class, detailsScene.getPersonnageid());
                    paragraph = new Paragraph();
                    paragraph.setIndentationLeft(150);
                    paragraph.add("- Personnage : " + p.getPseudo());
                    document.add(paragraph);

                    // texte
                    paragraph = new Paragraph();
                    paragraph.setIndentationLeft(200);
                    paragraph.add("- Texte : \" " + detailsScene.getTexte() + " \" ");
                    document.add(paragraph);
                }

            }

            document.close();
            System.out.println("PDF generated successfully.");
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public MyPdf() {
    }
}
