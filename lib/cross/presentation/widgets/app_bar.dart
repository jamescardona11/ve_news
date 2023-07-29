import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/config/theme/text_theme.dart';

import 'circular_icon_button.dart';

class VeNewsAppBar extends StatelessWidget {
  const VeNewsAppBar({
    Key? key,
    this.title = '',
    this.paddingTop = true,
    this.onLeftTap,
    this.onRightTap,
    this.iconLeft = FontAwesomeIcons.inbox,
    this.iconRight = FontAwesomeIcons.magnifyingGlass,
  }) : super(key: key);

  final String title;
  final bool paddingTop;
  final VoidCallback? onLeftTap;
  final VoidCallback? onRightTap;
  final IconData iconLeft;
  final IconData? iconRight;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(
        left: AppDimens.size20,
        right: AppDimens.size20,
        top: paddingTop ? AppDimens.size60 : 0,
      ),
      child: SizedBox(
        width: size.width,
        height: AppDimens.size50,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              child: Stack(
                children: [
                  CircularIconButton(
                    size: AppDimens.size50,
                    onPressed: onLeftTap,
                    icon: iconLeft,
                  ),
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
                child: CircularIconButton(
                  size: AppDimens.size50,
                  onPressed: onRightTap,
                  icon: iconRight!,
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
    );
  }
}
