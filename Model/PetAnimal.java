package Model;

import java.util.List;

public class PetAnimal extends AnimalAbs implements Animal {

    public PetAnimal(String name, List<String> commands) {
        super(name, commands);
        this.type = "PetAnimal";
    }

    public String getType() {
        return type;
    }

    @Override
    public String toString() {
        return super.toString() + ", type: " + this.type;
    }

}
