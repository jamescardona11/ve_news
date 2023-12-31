import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ve_news/common/presentation/presentation.dart';
import 'package:ve_news/config/navigation/app_router.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/domain/source/source_model.dart';

class SourcesList extends StatelessWidget {
  const SourcesList({
    Key? key,
    required this.sources,
  }) : super(key: key);

  final List<SourceModel> sources;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) {
        return Padding(
          padding: EdgeInsets.only(left: index == 0 ? AppDimens.size20 : 0),
          child: SourceLogo(
            source: sources[index],
            onPressed: () {
              context.push(AppRouter.bySourceScreen, extra: sources[index]);
            },
          ),
        );
      },
      separatorBuilder: (_, index) => const Padding(padding: EdgeInsets.symmetric(horizontal: AppDimens.size10)),
      itemCount: sources.length,
    );
  }
}
