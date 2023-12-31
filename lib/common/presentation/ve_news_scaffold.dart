import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ve_news/common/presentation/presentation.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/config/theme/text_theme.dart';

class VeNewsScaffold extends StatelessWidget {
  const VeNewsScaffold({
    Key? key,
    this.title = '',
    this.onLeftTap,
    this.onRightTap,
    this.iconLeft,
    this.iconRight,
    this.showLeftNotification = false,
    this.extendBodyBehindAppBar = false,
    this.backgroundColor,
    required this.body,
  }) : super(key: key);

  final String title;
  final VoidCallback? onLeftTap;
  final VoidCallback? onRightTap;
  final IconData? iconLeft;
  final IconData? iconRight;
  final bool showLeftNotification;
  final bool extendBodyBehindAppBar;
  final Color? backgroundColor;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      appBar: title.isNotEmpty
          ? PreferredSize(
              preferredSize: const Size.fromHeight(100.0),
              child: ColoredBox(
                color: backgroundColor ?? AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: AppDimens.size20,
                    right: AppDimens.size20,
                    top: AppDimens.size50,
                  ),
                  child: SizedBox(
                    width: size.width,
                    height: AppDimens.size60,
                    child: Stack(
                      children: [
                        if (iconLeft != null)
                          Positioned(
                            left: 0,
                            child: Stack(
                              children: [
                                CircularIconButton(
                                  color: AppColors.pureWhite,
                                  size: AppDimens.size50,
                                  onPressed: onLeftTap,
                                  icon: iconLeft!,
                                ),
                                if (showLeftNotification)
                                  const Positioned(
                                    top: 10,
                                    right: 10,
                                    child: Icon(
                                      FontAwesomeIcons.solidCircle,
                                      size: AppDimens.size12,
                                      color: AppColors.primary,
                                    ),
                                  )
                              ],
                            ),
                          ),
                        if (iconRight != null)
                          Positioned(
                            right: 0,
                            child: Stack(
                              children: [
                                CircularIconButton(
                                  color: AppColors.pureWhite,
                                  size: AppDimens.size50,
                                  onPressed: onRightTap,
                                  icon: iconRight!,
                                ),
                                if (showLeftNotification)
                                  const Positioned(
                                    top: 10,
                                    right: 10,
                                    child: Icon(
                                      FontAwesomeIcons.solidCircle,
                                      size: AppDimens.size16,
                                      color: AppColors.primary,
                                    ),
                                  )
                              ],
                            ),
                          ),
                        if (title.isNotEmpty)
                          Align(
                            child: Text(
                              title,
                              style: textTheme.titleLarge,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ))
          : null,
      body: Padding(
        padding: const EdgeInsets.only(top: AppDimens.size10),
        child: body,
      ),
    );
  }
}
