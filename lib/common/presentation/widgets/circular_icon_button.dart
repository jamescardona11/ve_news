import 'package:flutter/material.dart';
import 'package:ve_news/config/res/res.dart';

import 'bounce_wrapper.dart';
import 'circular_container.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton({
    Key? key,
    required this.icon,
    this.size = AppDimens.size50,
    this.color = AppColors.white,
    this.iconColor = AppColors.black,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final Color color;
  final Color iconColor;
  final double size;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return BounceWrapper(
      onPressed: onPressed,
      child: CircularContainer(
        color: color,
        size: size,
        showDecoration: true,
        child: Icon(
          icon,
          size: AppDimens.size20,
          color: iconColor,
        ),
      ),
    );
  }
}
