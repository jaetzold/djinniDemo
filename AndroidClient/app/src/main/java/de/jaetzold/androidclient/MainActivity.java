package de.jaetzold.androidclient;

import android.graphics.Color;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.Arrays;

import de.jaetzold.djinni.Greeting;
import de.jaetzold.djinni.GreetingColor;
import de.jaetzold.djinni.GreetingDisplay;
import de.jaetzold.djinni.GreetingService;

public class MainActivity extends AppCompatActivity {
    GreetingService greetingService;

    // Used to load the 'native-lib' library on application startup.
    static {
        System.loadLibrary("native-lib");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final TextView tv = (TextView) findViewById(R.id.sample_text);
        // Example of a call to a native method
        greetingService = GreetingService.createService(new GreetingDisplay() {
            @Override
            public void display(Greeting greeting) {
                MainActivity.this.display(greeting, tv);
            }
        });
        new Thread(new Runnable() {
            public void run() {
                greetingService.greet(new ArrayList<>(Arrays.asList("World", "Devoxx", "Djinni", "Android")));
            }
        }).start();
    }

    private void display(final Greeting greeting, final TextView textView) {
        runOnUiThread(new Runnable() {
            public void run() {
                String message = greeting.getMessage();
                textView.setText(message);
                GreetingColor color = greeting.getColor();
                switch (color) {
                    case RED:
                        textView.setTextColor(Color.RED);
                        break;
                    case BLUE:
                        textView.setTextColor(Color.BLUE);
                        break;
                }
                fadeOut(textView, GreetingService.COOLDOWN_MS / 2, GreetingService.COOLDOWN_MS / 4);
            }
        });
    }

    private void fadeOut(final TextView textView, long delay, long duration) {
        textView.setAlpha(1);
        AlphaAnimation animation = new AlphaAnimation(1, 0);
        animation.setStartOffset(delay);
        animation.setDuration(duration);
        animation.setAnimationListener(new Animation.AnimationListener() {
            @Override
            public void onAnimationEnd(Animation animation) {
                textView.setAlpha(0);
            }

            @Override
            public void onAnimationStart(Animation animation) {
            }

            @Override
            public void onAnimationRepeat(Animation animation) {
            }
        });
        textView.startAnimation(animation);

    }
}
