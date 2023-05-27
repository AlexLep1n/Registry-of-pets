package Model;

import java.io.Closeable;

public class Counter extends Exception implements Closeable {
    private int counter;
    private boolean closeable;

    public void add() {
        counter++;
    }

    public void close() {
        if (!closeable) {
            throw new RuntimeException("Dont close!");
        }
    }

    public int getCounter() {
        return counter;
    }
}
