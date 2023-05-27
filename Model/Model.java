package Model;

import java.util.LinkedList;
import java.util.List;
import java.util.Scanner;

public class Model {
    private List<String> commands = new LinkedList<>();

    public Animal add() {
        Animal animal = null;
        Scanner addScanner = new Scanner(System.in);
        System.out.println("\nВыберите животное из списка, которое хотите добавить!");
        System.out.println("1. Dog\n2. Cat\n3. Hamster\n4. Camel\n5. Horse\n6. Donkey\n");
        System.out.printf("Введите его номер: \n");
        int newAnimal = addScanner.nextInt();
        switch (newAnimal) {
            case 1:
                commands.add("Up");
                animal = new PetAnimal("Dog", commands);
                break;
            case 2:
                commands.add("Meow");
                animal = new PetAnimal("Cat", commands);
                break;
            case 3:
                commands.add("Run");
                animal = new PetAnimal("Hamster", commands);
                break;
            case 4:
                commands.add("Sit");
                animal = new PackAnimal("Camel", commands);
                break;
            case 5:
                commands.add("Gallop");
                animal = new PackAnimal("Horse", commands);
                break;
            case 6:
                commands.add("Roam");
                animal = new PackAnimal("Donkey", commands);
                break;
        }
        return animal;
    }

    public List<Animal> addCommand(List<Animal> animals) {
        Animal foundedAnimal = findAnimal(animals);
        System.out.printf("Введите новую команду: ");
        Scanner nameAnimalScanner = new Scanner(System.in);
        String newCommand = nameAnimalScanner.next();
        foundedAnimal.setCommands(newCommand);
        return animals;
    }

    public Animal findAnimal(List<Animal> animals) {
        Scanner nameAnimalScanner = new Scanner(System.in);
        System.out.printf("Введите имя животного из списка: ");
        String nameAnimal = nameAnimalScanner.nextLine();
        for (Animal animal : animals) {
            if (animal.getName().equals(nameAnimal)) {
                return animal;
            }
        }
        return null;
    }

}
