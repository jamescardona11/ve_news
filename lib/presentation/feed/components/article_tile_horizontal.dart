import 'package:flutter/material.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/config/theme/text_theme.dart';
import 'package:ve_news/cross/presentation/widgets/network_image_with_loader.dart';
import 'package:ve_news/cross/utils/date_utils.dart';
import 'package:ve_news/domain/article/article_model.dart';

class ArticleTileHorizontal extends StatelessWidget {
  const ArticleTileHorizontal({
    Key? key,
    required this.article,
  }) : super(key: key);

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppDimens.defaultPadding),
          child: Row(
            children: [
              if (article.image != null)
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: NetworkImageWithLoader(article.image!),
                  ),
                ),
              const SizedBox(width: AppDimens.defaultPadding),
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.source.name,
                        style: textTheme.bodySmall,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        article.title,
                        style: textTheme.titleMedium,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            article.category,
                            style: textTheme.category,
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.circle,
                            size: 4,
                            color: AppColors.grey50,
                          ),
                          const SizedBox(width: 10),
                          if (article.dateTime != null) Text(AppDateUtils.timeAgo(article.dateTime!), style: textTheme.timeAgo),
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
