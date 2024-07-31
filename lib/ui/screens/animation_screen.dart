import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: ListView(
          children: [
            Text(
              "Shopping Cart",
              style: context.textTheme.bodyLarge,
            )
                .animate(
                  onPlay: (controller) => controller.repeat(), // loop
                  onComplete: (controller) {
                    controller.loop(reverse: true);
                  },
                )
                .fade(duration: 1.seconds)
                .fadeIn(duration: 1.seconds),
            Text("Hello")
                .animate(
                  delay:
                      1000.ms, // this delay only happens once at the very start
                  onPlay: (controller) => controller.repeat(), // loop
                )
                .fadeIn(
                    delay:
                        500.ms) // this delay happens at the start of each loop

            ,
            Column(
              children: AnimateList(
                interval: 400.ms,
                effects: [FadeEffect(duration: 300.ms)],
                children: [Text("Hello"), Text("World"), Text("Goodbye")],
              ),
            ),

// or shorthand:
            Column(
              children: [Text("Hello"), Text("World"), Text("Goodbye")]
                  .animate(interval: 400.ms)
                  .fade(duration: 300.ms),
            ),
            Text(
              "Shopping Cart",
              style: context.textTheme.bodyLarge,
            )
                .animate(
                  autoPlay: true,
                  onPlay: (controller) {
                    controller.repeat();
                  },
                )
                .moveX(duration: 500.ms)
                .fadeIn(duration: 1000.ms)
                // .tint(color: Colors.purple)
                .fadeOut(delay: 1500.ms, duration: 1000.ms),
            Text(
              "FSHX",
              style: context.textTheme.displayLarge,
            )
          ],
        ),
      ),
    );
  }
}
