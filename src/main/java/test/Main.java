package test;

import java.util.ArrayList;
import java.util.List;

public class Main {

    public static void main(String[] args) throws Exception {
        List<String> nom = new ArrayList<>();
        List<String> nom2 = new ArrayList<>();
        nom.add("Ando");
        nom.add("Mickael");
        nom2.add("Jean");
        nom2.add("Paul");
        nom2.addAll(nom);
        
        System.out.println(nom);
        System.out.println(nom2);
    }
    
}
