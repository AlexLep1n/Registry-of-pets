package Model;

public class Counter extends Exception implements AutoCloseable {
    private int counter;
    private boolean closeable;

    public void add() {
        counter++;
    }

    public void close() {
        if (closeable) {
            throw new RuntimeException("Dont close!");
        }
    }

    public int getCounter() {
        return counter;
    }

}
