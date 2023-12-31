import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:ve_news/common/presentation/presentation.dart';
import 'package:ve_news/config/di/di.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/presentation/summary/cubit/new_summary_cubit.dart';

import 'components/smaill_article_tile.dart';
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
    return BlocConsumer<NewSummaryCubit, NewSummaryState>(
      listenWhen: (previous, current) => current.isDone,
      listener: (context, state) {
        if (state.isDone) {
          context.pop(true);
        }
      },
      builder: (context, state) {
        final cubit = context.read<NewSummaryCubit>();

        if (state.summary == null) {
          return EmptyWidget(
            label: 'Pending Summary',
            action: CircularIconButton(
              color: AppColors.pureWhite,
              size: AppDimens.size50,
              onPressed: () {
                cubit.createNewPendingSummary();
              },
              icon: FontAwesomeIcons.plus,
            ),
          );
        }

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
                    onLanguagePressed: (value) => cubit.onChangeSummaryLanguage(value),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.summary!.length,
                      itemBuilder: (context, index) {
                        return SmallArticleTile(
                          article: state.summary!.articles[index],
                          trailingWidget: CircularIconButton(
                            icon: FontAwesomeIcons.xmark,
                            color: AppColors.red,
                            iconColor: AppColors.white,
                            size: AppDimens.size30,
                            onPressed: () => cubit.removeArticle(state.summary!.articles[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            if (state.isLoading) LoadingScreen(label: state.loadingMessage),
          ],
        );
      },
    );
  }
}
