import 'package:flutter/material.dart';

class RippleEffectWrapper extends StatelessWidget {
  const RippleEffectWrapper({
    Key? key,
    required this.child,
    this.onPressed,
    this.splashColor,
    this.customBorder,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget child;
  final Color? splashColor;
  final ShapeBorder? customBorder;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: splashColor,
        highlightColor: splashColor?.withOpacity(0.2),
        customBorder: customBorder,
        onTap: onPressed,
        child: child,
      ),
    );
  }
}
