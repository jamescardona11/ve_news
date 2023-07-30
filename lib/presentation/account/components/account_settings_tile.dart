import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ve_news/config/res/res.dart';

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
  final IconData? trailingIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Text(
        leadingText,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
          if (trailingIcon != null)
            FaIcon(
              trailingIcon!,
              size: AppDimens.size16,
              color: AppColors.black,
            ),
        ],
      ),
    );
  }
}
