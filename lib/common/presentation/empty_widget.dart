import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    Key? key,
    required this.label,
    this.action,
  }) : super(key: key);

  final String label;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('You don\'t have any $label yet'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: action ?? const SizedBox(),
          ),
        ],
      ),
    );
  }
}
