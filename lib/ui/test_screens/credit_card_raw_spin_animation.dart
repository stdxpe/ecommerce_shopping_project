import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_custom_carousel/flutter_custom_carousel.dart';

class CreditCardRawSpinAnimation extends StatefulWidget {
  const CreditCardRawSpinAnimation({super.key});

  @override
  State<CreditCardRawSpinAnimation> createState() =>
      _CreditCardRawSpinAnimationState();
}

class _CreditCardRawSpinAnimationState
    extends State<CreditCardRawSpinAnimation> {
  bool _showFrontSide = true;
  @override
  Widget build(BuildContext context) {
    // int currentIndex = 1;
    // bool isPlayOn = true;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showFrontSide = !_showFrontSide;
          });
          // print(_showFrontSide);
        },
      ),
      backgroundColor: Colors.red,
      // body: _buildCarousel(),
      body: Center(

          // child: Animate(
          //   onPlay: (controller) {
          //     controller.repeat(); // loop
          //     // if (isPlayOn == true) controller.animateTo(1);
          //   },
          //   effects: [
          //     FlipEffect(direction: Axis.horizontal),
          //   ],
          //   child: _showFrontSide ? _Card(1) : _Card(2),
          // ),

          child: AnimatedSwitcher(
        duration: 500.ms,
        child: _showFrontSide
            ? const _Card(1).animate(
                // target: 0,
                onComplete: (controller) {
                  setState(() {
                    _showFrontSide = !_showFrontSide;
                  });
                },
              ).flipH(
                duration: 250.ms,
                begin: 0,
                end: 0.5,
              )
            : const _Card(2)
                // _Card(_showFrontSide ? 1 : 2)
                .animate(
                  // target: 0,
                  onPlay: (controller) {
                    // controller.repeat(); // loop
                  },
                  onComplete: (controller) {
                    setState(() {
                      _showFrontSide = !_showFrontSide;
                    });
                  },
                )
                .flipH(
                  duration: 250.ms,
                  begin: -0.5,
                  end: 0,
                )
                .tint(duration: 4000.ms, color: Colors.white12)
                .shader(duration: 4000.ms, layer: ShaderLayer.background),
      )

          // //         .align(
          // //           begin: const Alignment(0, 0),
          // //           end: const Alignment(0, 0),
          // //           curve: Curves.easeIn,
          // //         ),,
          ),

      // CustomCarousel(
      //   scrollDirection: Axis.horizontal,
      //   children: [
      //     _Card(0),
      //     _Card(0),
      //     _Card(0),
      //   ],
      //   effectsBuilder: CustomCarousel.effectsBuilderFromAnimate(
      //     effects: EffectList()
      //         // .tint(begin: 0.5, color: const Color(0xFF1F1B2E))
      //         // .flipH(begin: -0.15, end: 0.5)
      //         // .slideY(end: 0.5)
      //         // .scaleXY(begin: 0.75, curve: Curves.fastEaseInToSlowEaseOut)
      //         .flipH(begin: )
      //         .align(
      //           begin: const Alignment(0, 0),
      //           end: const Alignment(0, 0),
      //           curve: Curves.easeIn,
      //         ),
      //   ),
      // ),
    );
  }
}
// _Card(0).animate()
// // .tint(begin: 0.5)
// // .flipV(begin: -0.15, end: 0.5),
// // .flipH(delay: 3000.ms, duration: 1000.ms)
// // .flipH(delay: 1000.ms, duration: 1000.ms)
// // .child.,

Widget _buildCarousel() {
  List<Widget> items = List.generate(5, (i) => _Card(i));

  // See `card_deck_view.dart` for a fully commented example of using
  // Animate with CustomCarousel.
  return CustomCarousel(
    itemCountBefore: 1,
    itemCountAfter: 1,
    // loop: true,
    // tapToSelect: false,
    scrollSpeed: 5,
    effectsBuilder: CustomCarousel.effectsBuilderFromAnimate(
      effects: EffectList()
          .tint(begin: 0.5, color: const Color(0xFF1F1B2E))
          .flipV(begin: -0.15, end: 0.5)
          .slideY(end: 0.5)
          .scaleXY(begin: 0.75, curve: Curves.fastEaseInToSlowEaseOut)
          .align(
            begin: const Alignment(0, -1),
            end: const Alignment(0, 1),
            curve: Curves.easeIn,
          ),
    ),
    children: items,
  );
}

class _Card extends StatelessWidget {
  const _Card(this.index);
  final int index;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage('assets/images/digital_wallet/wallet-$index.jpg'),
              fit: BoxFit.cover,
            ),
            border: const Border(
              top: BorderSide(color: Colors.white38, width: 2),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(child: Text('Credit Card')),
        ),
      ),
    );
  }
}
