import 'package:flutter/material.dart';
import 'package:ve_news/common/presentation/presentation.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/config/theme/text_theme.dart';

class ArticleSquareWidget extends StatelessWidget {
  const ArticleSquareWidget({Key? key, required this.title, required this.imageSrc, this.category, this.time, this.width})
      : super(key: key);

  final String title;
  final String imageSrc;
  final String? category;
  final String? time; //2m
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(AppDimens.size12)),
            child: AspectRatio(
              aspectRatio: 2 / 2,
              child: NetworkImageWithLoader(imageSrc),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: context.textTheme.bodyMedium!.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 10),
          if (category != null && time != null)
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  category!,
                  style: context.textTheme.bodyMedium!.copyWith(
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
              ],
            )
        ],
      ),
    );
  }
}
