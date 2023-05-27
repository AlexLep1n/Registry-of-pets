package Presenter;

import java.util.LinkedList;
import java.util.List;
import java.util.Scanner;

import Model.Animal;
import Model.Model;
import View.View;

public class Presenter {
    private Model model;
    private View view;
    private List<Animal> animals = new LinkedList<>();

    public Presenter(Model model, View view) {
        this.model = model;
        this.view = view;
    }

    public void run() {
        boolean flag = false;
        Scanner scanner = new Scanner(System.in);
        while (!flag) {
            if (animals.isEmpty()) {
                System.out.println("База пустая! Добавьте новое животное!");
                animals.add(model.add());
            }
            System.out.println("\nВыберите пункт меню: ");
            view.printMenu();
            String userChoice = scanner.nextLine();
            switch (userChoice) {
                case "1":
                    animals.add(model.add());
                    break;
                case "2":
                    view.showlist(animals);
                    break;
                case "3":
                    System.out.println(model.findAnimal(animals).getCommands());
                    break;
                case "4":
                    model.addCommand(animals);
                    break;
                case "5":
                    System.out.println("Спасибо за работу!");
                    flag = true;
                    break;
            }
        }
        scanner.close();
    }

}
