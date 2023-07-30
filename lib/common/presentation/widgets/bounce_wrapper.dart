import 'package:flutter/material.dart';

// ```
// BounceWrapper(
//   child: Container(
//     width: 100,
//     height: 40,
//     color: Colors.amber,
//     child: const Center(
//       child: Text('Widget'),
//     ),
//   ),
// )
// ```

class BounceWrapper extends StatefulWidget {
  const BounceWrapper({
    super.key,
    required this.child,
    this.scale = 0.1,
    this.onPressed,
    this.startWhenChange = false,
    this.duration = const Duration(milliseconds: 200),
  });

  final Widget child;
  final double scale;
  final VoidCallback? onPressed;
  final Duration duration;
  final bool startWhenChange;

  @override
  BounceWrapperState createState() => BounceWrapperState();
}

class BounceWrapperState extends State<BounceWrapper> with TickerProviderStateMixin {
  late AnimationController animate = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 250),
    // lowerBound: 0.0,
    upperBound: widget.scale,
  );

  @override
  void didUpdateWidget(covariant BounceWrapper oldWidget) {
    if (widget.scale != oldWidget.scale) {
      animate = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 250),
        // lowerBound: 0.0,
        upperBound: widget.scale,
      );

      if (widget.startWhenChange) _onTap();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onPressed != null ? _onTap : () {},
        child: AnimatedBuilder(
          animation: animate,
          builder: (context, child) => Transform.scale(
            scale: 1 - animate.value,
            child: widget.child,
          ),
        ));
  }

  void _onTap() {
    if (widget.scale == 0) return;
    animate.forward();
    //Now reversing the animation after the user defined duration
    Future.delayed(widget.duration, () {
      animate.reverse();
      widget.onPressed?.call();
    });
  }

  @override
  void dispose() {
    animate.dispose();
    super.dispose();
  }
}
