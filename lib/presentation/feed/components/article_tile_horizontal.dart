import 'package:flutter/material.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/config/theme/text_theme.dart';
import 'package:ve_news/cross/presentation/widgets/network_image_with_loader.dart';

class ArticleTileHorizontal extends StatelessWidget {
  const ArticleTileHorizontal({
    Key? key,
    required this.title,
    this.imageSrc,
    required this.category,
    this.channelName,
    required this.time,
  }) : super(key: key);

  final String title;
  final String? imageSrc;
  final String category;
  final String time;
  final String? channelName;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppDimens.defaultPadding),
          child: Row(
            children: [
              if (imageSrc != null)
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: NetworkImageWithLoader(
                      imageSrc!,
                    ),
                  ),
                ),
              const SizedBox(
                width: AppDimens.defaultPadding,
              ),
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (channelName != null)
                        Text(
                          channelName!,
                          style: textTheme.bodySmall,
                        ),
                      const SizedBox(height: 10),
                      Text(
                        title,
                        style: textTheme.titleMedium,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            category,
                            style: textTheme.bodyMedium!.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.circle,
                            size: 7,
                            color: AppColors.secondaryTextColor,
                          ),
                          const SizedBox(width: 10),
                          Text('$time ago'),
                          const Spacer(),
                          const Icon(Icons.more_horiz_rounded)
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
        const Divider(
          height: 0,
        ),
      ],
    );
  }
}
