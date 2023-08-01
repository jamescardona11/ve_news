import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:ve_news/common/presentation/presentation.dart';
import 'package:ve_news/config/navigation/app_router.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/presentation/summary/components/bottom_bar_component.dart';

import 'components/player_widget.dart';
import 'components/summary_card_item.dart';
import 'cubit/summary_cubit.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryCubit, SummaryState>(
      builder: (context, state) {
        final cubit = context.read<SummaryCubit>();
        final doneSummaries = state.summaries.where((element) => element.isCompleted).toList();

        return VeNewsScaffold(
          title: 'Summary',
          body: doneSummaries.isEmpty
              ? EmptyWidget(
                  label: 'Summary',
                  action: CircularIconButton(
                    color: AppColors.pureWhite,
                    size: AppDimens.size50,
                    onPressed: () {
                      context.push(AppRouter.newSummary);
                    },
                    icon: FontAwesomeIcons.inbox,
                  ))
              : Stack(
                  children: [
                    ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
                      itemCount: state.summaries.where((element) => element.isCompleted).length,
                      itemBuilder: (context, index) => SummaryCardItem(
                        summary: state.summaries[index],
                        index: index,
                        isPlaying: state.currentPlayingSummaryId == state.summaries[index].id,
                        onPlayPressed: (summary) {
                          cubit.onPlaySummaryPressed(summary);
                        },
                      ),
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      bottom: state.notCurrent ? -200 : 0,
                      child: BottomBarComponent(
                        height: 150,
                        first: PlayerWidget(
                          summary: state.summaries.firstWhereOrNull((element) => element.id == state.currentPlayingSummaryId),
                          audioPlayerState: cubit.audioPlayerState,
                          onPlayPressed: cubit.onMainActionPlayerPressed,
                          onNextPressed: cubit.onNextMessagePlayerPressed,
                          onBackPressed: cubit.onBackMessagePlayerPressed,
                          onSeekChanged: cubit.onSeekPlayerChanged,
                          onClosePressed: cubit.onClosePlayerPressed,
                        ),
                      ),
                    )
                  ],
                ),
        );
      },
    );
  }
}
