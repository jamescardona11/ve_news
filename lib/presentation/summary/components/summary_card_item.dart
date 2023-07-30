import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ve_news/common/presentation/source_logo.dart';
import 'package:ve_news/common/presentation/widgets/categories_list_chip.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/domain/article/article_model.dart';
import 'package:ve_news/domain/summary/summary.dart';

class SummaryCardItem extends StatelessWidget {
  const SummaryCardItem({
    Key? key,
    required this.summary,
  }) : super(key: key);

  final SummaryArticles summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 270,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: AppDimens.size24,
            left: 0,
            right: 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.grey,
                border: Border.all(color: AppColors.black, width: AppDimens.size1),
                borderRadius: const BorderRadius.all(AppDimens.radius10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.pureWhite,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.black),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: AppDimens.defaultPadding,
                      left: AppDimens.defaultPadding,
                      right: AppDimens.defaultPadding,
                    ),
                    child: Column(
                      children: [
                        _HeaderWidget(articles: summary.articles),
                        const SizedBox(height: AppDimens.size10),
                        CategoriesList(categories: summary.categories),
                        const SizedBox(height: AppDimens.size10),
                        _IconText(icon: FontAwesomeIcons.newspaper, label: 'Articles length: ${summary.bodyLength}'),
                        _IconText(icon: FontAwesomeIcons.book, label: 'Summary length: ${summary.bodyLength}'),
                        _IconText(icon: FontAwesomeIcons.solidClock, label: 'Summary ~time: ${summary.bodyLength}'),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppDimens.size10),
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.purple,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(AppDimens.size10),
                          bottomRight: Radius.circular(AppDimens.size10),
                        ),
                        border: Border.all(color: AppColors.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(AppDimens.defaultPadding),
                        child: Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidEye,
                              color: AppColors.black,
                              size: 18,
                            ),
                            const SizedBox(width: AppDimens.size8),
                            Text('Review Articles'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IconText extends StatelessWidget {
  const _IconText({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.size2),
      child: Row(
        children: [
          FaIcon(
            icon,
            color: AppColors.black,
            size: 18,
          ),
          const SizedBox(width: AppDimens.size8),
          Text(label),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({
    Key? key,
    required this.articles,
  }) : super(key: key);

  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    final sources = articles.take(5).map((e) => e.source).toList();
    return SizedBox(
      height: AppDimens.size50,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: sources.length * AppDimens.size24,
            child: Stack(
              alignment: Alignment.topLeft,
              fit: StackFit.loose,
              children: sources.map(
                (source) {
                  final index = sources.indexOf(source);
                  return Positioned(
                    top: 0,
                    left: index * AppDimens.size8,
                    child: SourceLogo(
                      source: source,
                      size: AppDimens.size40,
                      showName: false,
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          const SizedBox(width: AppDimens.size10),
          Text(
            '${articles.length} articles',
          ),
          const Spacer()
        ],
      ),
    );
  }
}
