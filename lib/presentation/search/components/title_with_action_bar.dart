import 'package:flutter/material.dart';

class TitleWithActionBar extends StatelessWidget {
  const TitleWithActionBar({
    Key? key,
    required this.title,
    this.buttonText,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String? buttonText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        // Action Button
        TextButton(onPressed: onTap, child: Text(buttonText ?? 'Show All'))
      ],
    );
  }
}
