import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ve_news/common/presentation/presentation.dart';
import 'package:ve_news/config/res/res.dart';

import 'components/summary_card_item.dart';
import 'cubit/summary_cubit.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryCubit, SummaryState>(
      builder: (context, state) => VeNewsScaffold(
        title: 'Summary',
        body: ListView.builder(
          padding: const EdgeInsets.all(AppDimens.defaultPadding),
          itemCount: 1,
          itemBuilder: (context, index) => SummaryCardItem(summary: state.summaries[index]),
        ),
      ),
    );
  }
}
