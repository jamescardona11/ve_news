import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ve_news/common/presentation/presentation.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/presentation/quick_actions/cubit/quick_actions_cubit.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VeNewsScaffold(
      title: 'Quick Actions',
      body: BlocBuilder<QuickActionsCubit, QuickActionsState>(
        builder: (context, state) {
          final cubit = context.read<QuickActionsCubit>();

          return Padding(
            padding: const EdgeInsets.all(AppDimens.defaultPadding),
            child: Column(
              children: [
                _TempCard(
                  label: '10 Minutes News',
                  onPressed: cubit.onTemp10MinutesNews,
                ),
                _TempCard(
                  label: '5 The Guardian News',
                  onPressed: cubit.onTemp5TheGuardianNews,
                ),
                _TempCard(
                  label: '5 Sports News',
                  onPressed: cubit.onTemp5SportsNews,
                ),
                const SizedBox(height: AppDimens.size30),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('More Comming soon'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _TempCard extends StatelessWidget {
  const _TempCard({
    Key? key,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return BounceWrapper(
      onPressed: onPressed,
      child: Card(
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(AppDimens.radius10),
        ),
        color: AppColors.pureWhite,
        child: SizedBox(
          height: 55,
          child: Center(child: Text(label)),
        ),
      ),
    );
  }
}
