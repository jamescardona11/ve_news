import 'package:flutter/material.dart';
import 'package:ve_news/config/res/res.dart';

class RoundContainer extends StatelessWidget {
  const RoundContainer({
    Key? key,
    this.width,
    this.height,
    this.border = 16,
    this.color = Colors.transparent,
    this.showDefaultShadow = false,
    this.child,
    this.duration = const Duration(milliseconds: 200),
  }) : super(key: key);

  final double? width;
  final double? height;
  final double border;

  final Color color;
  final bool showDefaultShadow;
  final Duration duration;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: width,
      height: height,
      duration: duration,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.grey),
          borderRadius: BorderRadius.circular(border),
          color: color,
          boxShadow: showDefaultShadow ? const [AppShadows.shadow200] : null,
        ),
        child: child,
      ),
    );
  }
}
