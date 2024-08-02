import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_checkbox_main.dart';
import 'package:ecommerce_shopping_project/ui/widgets/switches/switch_cupertino_custom.dart';
import 'package:ecommerce_shopping_project/ui/widgets/text_custom.dart';
import 'package:ecommerce_shopping_project/utilities/utilities_library_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unicons/unicons.dart';

// class ButtonNavBar extends StatefulWidget {
//   const ButtonNavBar({
//     super.key,
//     required this.index,
//     required this.color,
//     required this.width,
//   });

//   final int index;
//   final Color color;
//   final double width;

//   @override
//   State<ButtonNavBar> createState() => _ButtonNavBarState();
// }

// class _ButtonNavBarState extends State<ButtonNavBar> {
//   bool boolSwitch = false;
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       child: GestureDetector(
//         onTap: () {
//           setState(() {
//             widget.selectedIndex = widget.index;
//             boolSwitch = true;
//             print('selectedIndex : ${widget.selectedIndex}');
//             print('boolSwitch : $boolSwitch');
//           });
//         },
//         child: Container(
//           color: widget.color,
//           height: 500.h,
//           width: widget.width,
//           child: Visibility(
//             visible: (selectedIndex == widget.index || boolSwitch == true),
//             child: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: (selectedIndex == widget.index)
//                     // ? SizedBox()
//                     ? dot().animate(
//                         onComplete: (controller) {
//                           controller.stop();
//                         },
//                       ).moveY(duration: 300.ms, end: -50, delay: 1.ms)
//                     // .animate()
//                     // : SizedBox(),

//                     :
//                     // ((boolSwitch)
//                     // ?
//                     dot()
//                         .animate(

//                             // onInit: (controller) {
//                             //   // controller.reverse(from: -100);
//                             //   controller.stop();
//                             // },
//                             // onComplete: (controller) {
//                             //   controller.stop();
//                             // },
//                             )
//                         .moveY(duration: 300.ms, begin: -50, end: 0)
//                 // : dot())
//                 // swap in original widget & fade back in via a new Animate:
//                 // .swap(builder: (_, __) {
//                 //   if (selectedIndex == index) return dot().animate().fadeIn();
//                 //   return dot();
//                 // }),

//                 // dot().animate(
//                 //   // target: ,
//                 //   // onComplete: (controller) {
//                 //   //   controller.stop();
//                 //   // },
//                 //   onPlay: (controller) {
//                 //     controller.animateTo(1);
//                 //     if (selectedIndex != index) controller.reverse();
//                 //   },
//                 //   // onInit: (controller) {
//                 //   //   controller.stop();
//                 //   //   if (selectedIndex != index) controller.reverse();
//                 //   // },
//                 //   // effects: (selectedIndex == index) ? returnEffect() : null,
//                 //   // effects: [if (selectedIndex == index) ...returnEffect()]),
//                 //   effects: returnEffect(),
//                 // ),
//                 ),
//           ),
//         ),
//       ),
//     );
//   }
// }

List<Effect> returnEffect() {
  return [
    // SwapEffect(builder: (p0, p1) {},)
    FadeEffect(
      begin: 0,
      end: 1,
      duration: 1000.ms,
      curve: Curves.easeInCirc,
      delay: 1.ms,
    ),
    MoveEffect(
      begin: Offset(0, 0),
      end: Offset(0, -50),
      curve: Curves.easeInCirc,
      duration: 1000.ms,
    ),
  ];
}

List<Effect> returnEffect2() {
  return [
    FadeEffect(
      begin: 1,
      end: 0,
      duration: 100.ms,
      curve: Curves.easeInCirc,
      delay: 1.ms,
    ),
    MoveEffect(
      begin: Offset(0, -50),
      end: Offset(0, 0),
      curve: Curves.easeInCirc,
      duration: 100.ms,
      delay: 1.ms,
    ),
  ];
}

class TestAnimationsScreen extends StatefulWidget {
  TestAnimationsScreen({super.key});

  @override
  State<TestAnimationsScreen> createState() => _TestAnimationsScreenState();
}

class _TestAnimationsScreenState extends State<TestAnimationsScreen> {
  bool switchState = true;
  int selectedIndex = 0;

  Map<String, bool> boolSwitchList = {
    'boolSwitch0': false,
    'boolSwitch1': false,
    'boolSwitch2': false,
    'boolSwitch3': false,
    'boolSwitch4': false,
  };

  Widget dot() {
    return Container(
      height: 15.h,
      width: 15.h,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget returnButton({
    required int index,
    required Color color,
    required double width,
    required IconData icon,
    // required bool boolSwitch,
  }) {
    // bool boolSwitch = selectedIndex == index ? true : false;
    bool boolSwitch = false;
    boolSwitchList['boolSwitch0'] = true;

    return Visibility(
      visible: true,
      child: Align(
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
              boolSwitch = true;
              boolSwitchList['boolSwitch$index'] = true;
              print('selectedIndex : $selectedIndex');
              print('boolSwitch : $boolSwitch');
              print('boolSwitchList[]: $boolSwitchList');
            });
          },
          child: Container(
            // color: color,
            color: Colors.white,
            height: 275.h,
            width: width,
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40.h),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Icon(
                      icon,
                      color: selectedIndex == index
                          ? Colors.black
                          : Colors.black54,
                      size: 70.h,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Visibility(
                    // visible: (selectedIndex == index || boolSwitch == true),
                    visible: true,
                    child: (selectedIndex == index)
                        ? dot().animate(onComplete: (controller) {
                            controller.stop();
                          })
                            // .fadeIn(duration: 100.ms, begin: 0.5)
                            .moveY(
                                duration: 75.ms,
                                begin: 10,
                                end: -35,
                                delay: 1.ms,
                                curve: Curves.fastLinearToSlowEaseIn)
                        : dot()
                            .animate()
                            .fadeOut(duration: 100.ms, begin: 1)
                            .moveY(
                                duration: 75.ms,
                                begin: boolSwitchList['boolSwitch$index']!
                                    ? -35
                                    : 10,
                                end: 0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SwitchCupertinoCustom(
            switchState: switchState,
            onChanged: (state) {
              setState(() {
                switchState = state;
              });
            },
          ),
          Text("Horrible Pulsing Text").animate(onPlay: (controller) {
            controller.repeat(reverse: true);
            controller.reverse();
          }).fadeOut(curve: Curves.easeInOut),
          SizedBox(height: 300.h),
          Row(
            children: [
              returnButton(
                icon: UniconsLine.home_alt,
                color: Colors.white10,
                width: context.mediaQuery.size.width / 5,
                index: 0,
              ),
              returnButton(
                icon: UniconsLine.search,
                color: Colors.white30,
                width: context.mediaQuery.size.width / 5,
                index: 1,
              ),
              returnButton(
                icon: Icons.shopping_cart_outlined,
                color: Colors.white54,
                width: context.mediaQuery.size.width / 5,
                index: 2,
              ),
              returnButton(
                icon: UniconsLine.heart,
                color: Colors.white70,
                width: context.mediaQuery.size.width / 5,
                index: 3,
              ),
              returnButton(
                icon: UniconsLine.user,
                color: Colors.white,
                width: context.mediaQuery.size.width / 5,
                index: 4,
              ),
            ],
          ),
          // Text("Before").animate().swap(
          //       duration: 900.ms,
          //       builder: (_, __) => Text("After"),
          //     ),
          // Text("Before")
          //     .animate()
          //     .fadeOut(duration: 300.ms) // fade out & then...
          //     // swap in original widget & fade back in via a new Animate:
          //     .swap(builder: (_, __) => Text("After").animate().fadeIn()),
        ],
      ),
    );
  }
}

//  Animate(
//             // controller: ,
//             // onInit: (controller) {
//             //   controller.forward();
//             // },

//             // effects: (switchState)
//             //     ? [
//             //         FadeEffect(duration: 100.ms, curve: Curves.easeOut),
//             //         ScaleEffect(begin: Offset(0.8, 0), curve: Curves.easeIn)
//             //       ]
//             //     : [],
//             child: Text(
//               "Hello World!",
//               // textAlign: TextAlign.center,
//             ).animate(
//               // onPlay: (controller) {
//               //   if (switchState == false) controller.reverse(from: 1);
//               // },
//               onComplete: (controller) {
//                 controller.stop();
//               },
//               effects: (switchState)
//                   ? [
//                       MoveEffect(
//                         begin: Offset(0, 0),
//                         end: Offset(100, 0),
//                         curve: Curves.easeInCirc,
//                         duration: 100.ms,
//                       )
//                     ]
//                   : [
//                       MoveEffect(
//                         begin: Offset(100, 0),
//                         end: Offset(0, 0),
//                         curve: Curves.easeInCirc,
//                         duration: 100.ms,
//                         delay: 1.ms,
//                       ),
//                     ],
//             ),
//           ),
