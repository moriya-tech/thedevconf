package cloud.caravana.vo;

import java.util.*;

public class Mode {
    private String name;
    private List<Edition> editions;


    private String outraCoisa = "CARAVANA CLOUD";

    public String getOutraCoisa() {
        return outraCoisa;
    }

    public Mode(){
        this("");
    }
    public Mode(String name){
        this(name, new ArrayList<>());
    }
    
    public Mode(String name, List<Edition> editions){
        this.name = name;
        this.editions = editions;
    }

    public String getName(){
        return name;
    }

    public List<Edition> getEditions(){
        return editions;
    }

}