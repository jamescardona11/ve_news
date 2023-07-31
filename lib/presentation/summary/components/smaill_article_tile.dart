import 'package:flutter/material.dart';
import 'package:ve_news/common/presentation/presentation.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/config/theme/text_theme.dart';
import 'package:ve_news/domain/article/article_model.dart';

class SmallArticleTile extends StatelessWidget {
  const SmallArticleTile({
    Key? key,
    required this.article,
    required this.trailingWidget,
  }) : super(key: key);

  final ArticleModel article;

  final Widget trailingWidget;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Card(
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(AppDimens.radius25),
      ),
      color: AppColors.pureWhite,
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.size8),
        child: Row(
          children: [
            if (article.image != null) NetworkImageWithLoader(article.image!),
            const SizedBox(width: AppDimens.defaultPadding),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppDimens.size4),
                  Text(
                    article.title,
                    style: textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppDimens.size8),
                  Row(
                    children: [
                      Text(
                        article.source.name,
                        style: textTheme.bodySmall,
                      ),
                      const SizedBox(width: AppDimens.size10),
                      Text(
                        'Length: ${article.body.length.toString()}',
                        style: textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
