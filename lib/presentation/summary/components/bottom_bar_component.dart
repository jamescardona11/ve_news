import 'package:flutter/material.dart';
import 'package:ve_news/config/res/res.dart';

class BottomBarComponent extends StatelessWidget {
  const BottomBarComponent({
    Key? key,
    required this.height,
    required this.first,
    this.second = const SizedBox(),
    this.showFirst = true,
    this.showSecond = false,
  }) : super(key: key);

  final Widget first;
  final Widget second;
  final double height;
  final bool showFirst;
  final bool showSecond;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AnimatedContainer(
      duration: duration,
      curve: Curves.linear,
      height: height,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.size12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: AppDimens.radius25),
        boxShadow: [AppShadows.shadow200],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showFirst) Flexible(child: Padding(padding: const EdgeInsets.only(bottom: AppDimens.size10), child: first)),
          if (showSecond) Expanded(child: second)
        ],
      ),
    );
  }

  Duration get duration => const Duration(milliseconds: 300);
}
