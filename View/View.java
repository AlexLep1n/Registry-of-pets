package View;

import java.util.List;
import Model.Animal;

public class View {
    public void printMenu() {
        System.out.println(
                "1. Завести новое животное.\n2. Вывести список животных.\n3. Увидеть список команд, которое выполняет животное.\n4. Обучить животное новым командам.\n5. Выйти из программы.");
    }

    public void showlist(List<Animal> animals) {
        System.out.println("\nСписок животных: ");
        for (Animal animal : animals) {
            System.out.println(animal.getName());
        }
    }

    // public void
}
