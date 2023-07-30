import 'package:flutter/material.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/config/theme/text_theme.dart';
import 'package:ve_news/domain/source/source_model.dart';

class SourceLogo extends StatelessWidget {
  const SourceLogo({
    Key? key,
    required this.source,
    this.radius = AppDimens.size30,
    this.showName = true,
    this.onTap,
  }) : super(key: key);

  final SourceModel source;
  final double radius;
  final bool showName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Hero(
            tag: source.name,
            child: CircleAvatar(
              radius: radius,
              backgroundColor: AppColors.lightGrey300,
              child: Container(
                margin: const EdgeInsets.all(AppDimens.size4),
                decoration: BoxDecoration(
                  color: AppColors.pureWhite,
                  shape: BoxShape.circle,
                  boxShadow: const [AppShadows.shadow200],
                  image: DecorationImage(
                    image: AssetImage(source.logo.value),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
          if (showName) ...[
            const SizedBox(height: AppDimens.size4),
            Text(
              source.formatName,
              textAlign: TextAlign.center,
              style: textTheme.bodySmall!.copyWith(fontSize: source.longName ? AppTextTheme.fontSize50 : AppTextTheme.fontSize100),
            ),
          ]
        ],
      ),
    );
  }
}
