import 'package:flutter/material.dart';
import 'package:ve_news/common/presentation/presentation.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/config/theme/text_theme.dart';
import 'package:ve_news/domain/source/source_model.dart';

class SourceLogo extends StatelessWidget {
  const SourceLogo({
    Key? key,
    required this.source,
    this.size = AppDimens.size50,
    this.showName = true,
    this.onPressed,
  }) : super(key: key);

  final SourceModel source;
  final double size;
  final bool showName;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Column(
      children: [
        Hero(
          tag: source.name,
          child: BounceWrapper(
            onPressed: onPressed,
            child: Container(
              width: size,
              height: size,
              decoration: const BoxDecoration(
                color: AppColors.pureWhite,
                shape: BoxShape.circle,
                border: Border.fromBorderSide(
                  BorderSide(
                    color: AppColors.grey,
                    width: 1,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppDimens.size4),
                child: ClipOval(
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    source.logo.value,
                    width: 40,
                  ),
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
    );
  }
}
