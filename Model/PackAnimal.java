package Model;

import java.util.List;

public class PackAnimal extends AnimalAbs implements Animal {

    public PackAnimal(String name, List<String> commands) {
        super(name, commands);
        this.type = "PackAnimal";
    }

    public PackAnimal(String name) {
        super(name);
        this.type = "PackAnimal";
    }

    public String getType() {
        return type;
    }

    @Override
    public String toString() {
        return super.toString() + ", type: " + type;
    }

}
