import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ve_news/common/presentation/empty_widget.dart';
import 'package:ve_news/common/presentation/presentation.dart';
import 'package:ve_news/config/di/di.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/config/theme/text_theme.dart';
import 'package:ve_news/domain/article/article_model.dart';
import 'package:ve_news/presentation/summary/cubit/new_summary_cubit.dart';

import 'components/summary_card_item.dart';

class NewSummaryScreen extends StatelessWidget {
  const NewSummaryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NewSummaryCubit>(),
      child: VeNewsScaffold(
        title: 'New Summary',
        iconLeft: FontAwesomeIcons.chevronLeft,
        onLeftTap: () => Navigator.pop(context),
        body: const _NewSummaryView(),
      ),
    );
  }
}

class _NewSummaryView extends StatelessWidget {
  const _NewSummaryView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewSummaryCubit, NewSummaryState>(
      builder: (context, state) {
        if (state.summary == null) {
          return const EmptyWidget(label: 'Pending Summary');
        }

        final cubit = context.read<NewSummaryCubit>();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
          child: Column(
            children: [
              SummaryCardItem(
                summary: state.summary!,
                onEditPressed: (value) => cubit.onChangeSummaryPercentage(value),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.summary!.length,
                  itemBuilder: (context, index) {
                    return _SmallArticleTile(
                      article: state.summary!.articles[index],
                      onPressed: () => cubit.removeArticle(state.summary!.articles[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SmallArticleTile extends StatelessWidget {
  const _SmallArticleTile({
    Key? key,
    required this.article,
    this.onPressed,
  }) : super(key: key);

  final ArticleModel article;
  final VoidCallback? onPressed;

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
            CircularIconButton(
              icon: FontAwesomeIcons.xmark,
              color: AppColors.red,
              iconColor: AppColors.white,
              size: AppDimens.size30,
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}
