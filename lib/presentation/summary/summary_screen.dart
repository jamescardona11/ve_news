import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/cross/presentation/widgets/categories_list_chip.dart';
import 'package:ve_news/cross/presentation/widgets/source_logo.dart';
import 'package:ve_news/domain/article/article_model.dart';

import 'cubit/summary_cubit.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocBuilder<SummaryCubit, SummaryState>(
      builder: (context, state) => ListView.builder(
        padding: const EdgeInsets.all(AppDimens.defaultPadding),
        itemCount: 1,
        itemBuilder: (context, index) {
          final summary = state.summaries[index];
          return SizedBox(
              width: size.width,
              height: 250,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.pureWhite,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppDimens.defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _HeaderWidget(articles: summary.articles),
                      CategoriesList(categories: state.categories),
                    ],
                  ),
                ),
              ));
        },
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
                      radius: AppDimens.size24,
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
