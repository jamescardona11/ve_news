import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ve_news/common/presentation/presentation.dart';
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
        return VeNewsScaffold(
          title: 'Summary',
          body: Stack(
            children: [
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
                itemCount: state.summaries.where((element) => element.isCompleted).length,
                itemBuilder: (context, index) => SummaryCardItem(
                  summary: state.summaries[index],
                  index: index,
                  onPlayPressed: (summary) {
                    cubit.onPlaySummaryPressed(summary);
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomBarComponent(
                  height: 130,
                  first: PlayerWidget(
                    label: state.currentPlayingArticle?.title ?? '',
                    audioPlayerState: cubit.audioPlayerState,
                    onPlayPressed: cubit.onMainActionPlayerPressed,
                    onNextPressed: cubit.onNextMessagePlayerPressed,
                    onBackPressed: cubit.onBackMessagePlayerPressed,
                    onSeekChanged: cubit.onSeekPlayerChanged,
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
