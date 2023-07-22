import 'package:flutter/material.dart';
import 'package:ve_news/config/res/res.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    Key? key,
    this.size,
    this.child,
    this.color = AppColors.white,
    this.duration = const Duration(milliseconds: 200),
    this.showDecoration = true,
  }) : super(key: key);

  final double? size;
  final Widget? child;
  final Color color;
  final Duration duration;
  final bool showDecoration;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: size,
      height: size,
      duration: duration,
      decoration: showDecoration
          ? BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              boxShadow: const [AppShadows.shadow100],
            )
          : null,
      child: child,
    );
  }
}
