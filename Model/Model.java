package Model;

import java.util.LinkedList;
import java.util.List;
import java.util.Scanner;

public class Model {

    public Animal add() {
        List<String> commands = new LinkedList<>();
        Animal animal = null;
        Scanner addScanner = new Scanner(System.in);
        System.out.println("\nВыберите животное из списка, которое хотите добавить!");
        System.out.println("1. Dog\n2. Cat\n3. Hamster\n4. Camel\n5. Horse\n6. Donkey\n");
        System.out.printf("Введите его номер: ");
        int newAnimal = addScanner.nextInt();
        try (Counter counter = new Counter()) {
            switch (newAnimal) {
                case 1:
                    animal = new PetAnimal("Dog", commands);
                    animal.setCommands("Up");
                    counter.add();
                    break;
                case 2:
                    animal = new PetAnimal("Cat", commands);
                    animal.setCommands("Meow");
                    counter.add();
                    break;
                case 3:
                    animal = new PetAnimal("Hamster", commands);
                    animal.setCommands("Run");
                    counter.add();
                    break;
                case 4:
                    animal = new PackAnimal("Camel", commands);
                    animal.setCommands("Sit");
                    counter.add();
                    break;
                case 5:
                    animal = new PackAnimal("Horse", commands);
                    animal.setCommands("Gallop");
                    counter.add();
                    break;
                case 6:

                    animal = new PackAnimal("Donkey", commands);
                    animal.setCommands("Roam");
                    counter.add();
                    break;
            }

        } catch (Exception e) {
            System.out.println("Counter isn`t close!");
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
