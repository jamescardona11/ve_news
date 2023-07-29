import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ve_news/config/res/res.dart';

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
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.grey),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppDimens.defaultPadding),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Summary',
                          ),
                          const Spacer(),
                          Text(
                            '${summary.articles.length} articles',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
