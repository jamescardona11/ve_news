import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ve_news/config/navigation/app_router.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/domain/article/article_model.dart';

import 'article_tile_horizontal.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({
    Key? key,
    required this.articles,
  }) : super(key: key);

  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.defaultPadding),
      child: ListView.separated(
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => context.push(
            AppRouter.articleScreen,
            extra: articles[index],
          ),
          child: ArticleTileHorizontal(
            article: articles[index],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: AppDimens.size16),
        padding: EdgeInsets.zero,
        itemCount: articles.length,
      ),
    );
  }
}
