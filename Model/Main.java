package Model;

import Presenter.Presenter;
import View.View;

public class Main {
    public static void main(String[] args) {
        Model model = new Model();
        View view = new View();
        Presenter presenter = new Presenter(model, view);
        presenter.run();
    }
}