// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from greeting.djinni

package de.jaetzold.djinni;

public final class Greeting {


    /*package*/ final String message;

    /*package*/ final GreetingColor color;

    public Greeting(
            String message,
            GreetingColor color) {
        this.message = message;
        this.color = color;
    }

    public String getMessage() {
        return message;
    }

    public GreetingColor getColor() {
        return color;
    }

    @Override
    public String toString() {
        return "Greeting{" +
                "message=" + message +
                "," + "color=" + color +
        "}";
    }

}
