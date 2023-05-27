package Model;

import java.util.List;

public class AnimalAbs implements Animal {
    private String name;
    private List<String> commands;
    protected String type;

    public AnimalAbs(String name, List<String> commands) {
        this.name = name;
        this.commands = commands;
    }

    public AnimalAbs(String name) {
        this.name = name;
    }

    @Override
    public String getName() {
        return name;
    }

    @Override
    public List<String> getCommands() {
        return commands;
    }

    @Override
    public String toString() {
        return "name: " + name + ", commands: " + commands.toString();
    }

    public String getType() {
        return type;
    }

    public void setCommands(String command) {
        commands.add(command);
    }

}
