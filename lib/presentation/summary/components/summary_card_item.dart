import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ve_news/common/presentation/presentation.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/config/theme/text_theme.dart';
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
      height: height,
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
            padding: const EdgeInsets.all(AppDimens.size8),
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
                    padding: const EdgeInsets.only(top: AppDimens.defaultPadding),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
                          child: _HeaderWidget(articles: summary.articles),
                        ),
                        if (!summary.isEmpty) ...[
                          const SizedBox(height: AppDimens.size10),
                          CategoriesList(categories: summary.categories),
                        ],
                        const SizedBox(height: AppDimens.size10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _IconText(
                                icon: FontAwesomeIcons.newspaper,
                                label: 'Articles length: ${summary.bodyLength}',
                              ),
                              _IconText(
                                icon: FontAwesomeIcons.book,
                                label: 'Summary length: ${summary.bodyLength}',
                                showEdit: !summary.isCompleted,
                              ),
                              _IconText(
                                icon: FontAwesomeIcons.solidClock,
                                label: 'Summary ~time: ${summary.bodyLength}',
                                showEdit: !summary.isCompleted,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: AppDimens.size10),
                  if (!summary.isEmpty)
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
                        child: ClipRRect(
                          child: RippleEffectWrapper(
                            splashColor: AppColors.primaryLight,
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(AppDimens.defaultPadding),
                              child: Row(
                                children: [
                                  const FaIcon(
                                    FontAwesomeIcons.solidEye,
                                    color: AppColors.black,
                                    size: 18,
                                  ),
                                  const SizedBox(width: AppDimens.size8),
                                  Text(
                                    'View Articles',
                                    style: context.textTheme.bodyMedium?.copyWith(color: AppColors.black),
                                  ),
                                ],
                              ),
                            ),
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

  double get height => summary.isCompleted
      ? 270
      : !summary.isEmpty
          ? 270
          : 160;
}

class _IconText extends StatelessWidget {
  const _IconText({
    Key? key,
    required this.icon,
    required this.label,
    this.showEdit = false,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final bool showEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.size4),
      child: Row(
        children: [
          FaIcon(
            icon,
            color: AppColors.black,
            size: 18,
          ),
          const SizedBox(width: AppDimens.size8),
          Text(label, style: context.textTheme.bodyMedium?.copyWith(color: AppColors.black)),
          const SizedBox(width: AppDimens.size8),
          if (showEdit)
            SizedBox(
              width: 80,
              height: 20,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Edit'),
              ),
            ),
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
    final textTheme = context.textTheme;
    final sources = articles.take(5).map((e) => e.source).toList();

    if (sources.isEmpty) {
      return Row(
        children: [
          Text(
            'No Articles yet',
            textAlign: TextAlign.start,
            style: textTheme.titleMedium,
          ),
        ],
      );
    }

    return SizedBox(
      height: AppDimens.size40,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: sources.length == 1 ? 40 : sources.length * AppDimens.size24,
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
            style: textTheme.titleMedium,
          ),
          const Spacer()
        ],
      ),
    );
  }
}
