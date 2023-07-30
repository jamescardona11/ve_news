import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ve_news/common/presentation/empty_widget.dart';
import 'package:ve_news/common/presentation/presentation.dart';
import 'package:ve_news/config/di/di.dart';
import 'package:ve_news/config/res/res.dart';
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

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
          child: Column(
            children: [
              SummaryCardItem(summary: state.summary!),
            ],
          ),
        );
      },
    );
  }
}
