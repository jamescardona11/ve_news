import 'package:flutter/material.dart';
import 'package:ve_news/config/res/app_dimens.dart';

class Tags extends StatelessWidget {
  const Tags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return // Tags
        Wrap(
      spacing: 8.0,
      alignment: WrapAlignment.start,
      children: const [
        TagChip(
          label: '#trending',
        ),
        TagChip(
          label: '#today',
        ),
        TagChip(
          label: '#sports',
        ),
        TagChip(
          label: '#mbi',
        ),
        TagChip(
          label: '#marketing',
        ),
        TagChip(
          label: '#business',
        ),
        TagChip(
          label: '#bloomberg',
        ),
        TagChip(
          label: '#market',
        )
      ],
    );
  }
}

class TagChip extends StatelessWidget {
  const TagChip({
    Key? key,
    required this.label,
    this.onTap,
  }) : super(key: key);

  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppDimens.size12),
      onTap: onTap ?? () {},
      child: Chip(
        label: Text(label),
      ),
    );
  }
}
