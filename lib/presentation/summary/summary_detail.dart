import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ve_news/common/presentation/presentation.dart';
import 'package:ve_news/config/di/di.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/config/theme/text_theme.dart';
import 'package:ve_news/domain/summary/export_summary.dart';
import 'package:ve_news/presentation/summary/cubit/new_summary_cubit.dart';

import 'components/smaill_article_tile.dart';
import 'components/summary_card_item.dart';

class SummaryDetailScreen extends StatelessWidget {
  const SummaryDetailScreen({
    Key? key,
    required this.summary,
  }) : super(key: key);

  final SummaryArticles summary;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NewSummaryCubit>(),
      child: VeNewsScaffold(
        title: 'Summary Detail',
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
        final cubit = context.read<NewSummaryCubit>();

        return Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
              child: Column(
                children: [
                  SummaryCardItem(
                    summary: state.summary!,
                    onEditPressed: (value) => cubit.onChangeSummaryPercentage(value),
                    onActionPressed: context.read<NewSummaryCubit>().onStartSummary,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.summary!.length,
                      itemBuilder: (context, index) {
                        return SmallArticleTile(
                          article: state.summary!.articles[index],
                          trailingWidget: CircularContainer(
                            size: 50,
                            color: AppColors.lightGrey100,
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              transitionBuilder: (Widget child, Animation<double> animation) {
                                return FadeTransition(opacity: animation, child: child);
                              },
                              child: true
                                  ? const Icon(
                                      Icons.play_arrow,
                                      size: AppDimens.size30,
                                      color: AppColors.black,
                                    )
                                  : Icon(
                                      Icons.play_arrow,
                                      size: AppDimens.size30,
                                      color: AppColors.white,
                                    ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            if (state.isLoading) _LoadingScreen(label: state.loadingMessage),
          ],
        );
      },
    );
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.8),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: AppColors.primary,
            ),
            const SizedBox(height: AppDimens.size10),
            Text(
              label,
              style: context.textTheme.bodyMedium?.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
