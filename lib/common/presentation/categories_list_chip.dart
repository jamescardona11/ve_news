import 'package:flutter/material.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/config/theme/text_theme.dart';
import 'package:ve_news/domain/article/article_model.dart';

import 'widgets/bounce_wrapper.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width,
      height: AppDimens.size24,
      child: ListView.builder(
        itemCount: categories.take(4).length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = categories[index];
          if (category.singleLabel.isEmpty) return const SizedBox.shrink();

          return CategoryChip(
            label: category.singleLabel,
            isActive: true,
            onPressed: null,
          );
        },
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    Key? key,
    required this.label,
    this.isActive = false,
    this.onPressed,
  }) : super(key: key);

  final String label;
  final bool isActive;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return BounceWrapper(
      onPressed: onPressed,
      scale: 0.1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.size12, vertical: AppDimens.size2),
        margin: const EdgeInsets.only(right: AppDimens.size4),
        decoration: const BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.all(AppDimens.radius25),
        ),
        child: Center(
          child: Text(
            label,
            style: context.textTheme.bodySmall!.copyWith(
              // color: isActive ? AppColors.primary : AppColors.secondaryTextColor,
              color: AppColors.white,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
