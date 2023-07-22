import 'package:flutter/material.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/domain/channel/source_model.dart';

import 'source_logo.dart';

class SourcesRow extends StatelessWidget {
  const SourcesRow({
    Key? key,
    required this.sources,
  }) : super(key: key);

  final List<SourceModel> sources;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) {
        return SourceLogo(
          source: sources[index],
          onTap: () {},
        );
      },
      separatorBuilder: (_, index) => const Padding(padding: EdgeInsets.symmetric(horizontal: AppDimens.size10)),
      itemCount: sources.length,
    );
  }
}
