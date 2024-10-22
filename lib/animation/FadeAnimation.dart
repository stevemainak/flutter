// import 'package:flutter/material.dart';
// import 'package:simple_animations/simple_animations.dart';

// class FAdeAnimation extends StatelessWidget {

//   final double delay;
//   final widget child;


//    FAdeAnimation(this.delay, this.child);

//   @override
//   Widget build(BuildContext context) {
//     final tween = MultiTrackTween([
//       Track('opacity').add(DUration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
//       Track("translator").add(
//         Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
//         curve: Curve.easeOut
//       ),    
//       ]);

//     return ControlledAnimated(
//       delay: Duration(milliseconds: (500* delay).round()),
//       duration: tween.duration,
//       tween: tween,
//       child: child,
//       builderWithChild: (context, child, animation) => Opacity(
//         opacity: animation["opacity"],
//         child: Transform.translate(
//           offset: Offset( 0, animation["translateY"]),
//           child: child,
//           ),
//         ),
//     );

//   }
// }