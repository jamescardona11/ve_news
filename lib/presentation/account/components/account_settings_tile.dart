import 'package:flutter/material.dart';

class AccountSettingsTile extends StatelessWidget {
  const AccountSettingsTile({
    Key? key,
    required this.leadingText,
    required this.trailingText,
    this.trailingIcon,
    this.onTap,
  }) : super(key: key);

  final String leadingText;
  final String trailingText;
  final Widget? trailingIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        onTap: () {},
        leading: Text(
          leadingText,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(trailingText),
            if (trailingIcon != null) const SizedBox(width: 8),
            if (trailingIcon != null) trailingIcon!,
          ],
        ),
      ),
    );
  }
}
