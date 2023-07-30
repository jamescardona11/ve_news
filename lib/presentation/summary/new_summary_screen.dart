import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ve_news/common/presentation/presentation.dart';

class NewSummaryScreen extends StatelessWidget {
  const NewSummaryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VeNewsScaffold(
      title: 'New Summary',
      iconLeft: FontAwesomeIcons.chevronLeft,
      onLeftTap: () => Navigator.pop(context),
      body: Center(
        child: Text('New Page'),
      ),
    );
  }
}
