import 'package:flutter/material.dart';
import 'package:ve_news/config/res/res.dart';

class PlanCard extends StatelessWidget {
  const PlanCard({
    Key? key,
    required this.pricing,
    required this.details,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  final String pricing;
  final String details;
  final bool isActive;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(AppDimens.defaultPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimens.size12),
            border: Border.all(
              color: isActive ? AppColors.primary : Colors.grey.shade400,
              width: 1,
            )),
        child: Column(
          children: [
            Icon(
              isActive ? Icons.check_circle : Icons.check_circle_outline_rounded,
              color: isActive ? AppColors.primary : Colors.grey.shade400,
              size: 50,
            ),
            Text(
              pricing,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Text(
              details,
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
