import 'package:flutter/material.dart';
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
    return ListView.builder(
      itemBuilder: (context, index) => ArticleTileHorizontal(
        article: articles[index],
      ),
      padding: const EdgeInsets.all(AppDimens.defaultPadding),
      itemCount: articles.length,
    );
  }
}
