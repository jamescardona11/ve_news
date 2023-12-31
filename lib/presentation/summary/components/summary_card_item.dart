import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ve_news/common/presentation/presentation.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/config/theme/text_theme.dart';
import 'package:ve_news/domain/article/article_model.dart';
import 'package:ve_news/domain/summary/export_summary.dart';

class SummaryCardItem extends StatelessWidget {
  const SummaryCardItem({
    Key? key,
    required this.summary,
    this.onEditPressed,
    this.onLanguagePressed,
    this.onActionPressed,
    this.onPlayPressed,
    this.index,
    this.isPlaying = false,
  }) : super(key: key);

  final SummaryArticles summary;
  final int? index;
  final bool isPlaying;
  final ValueChanged<int>? onEditPressed;
  final ValueChanged<LanguageEnum>? onLanguagePressed;
  final VoidCallback? onActionPressed;
  final Function(SummaryArticles)? onPlayPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: height,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: AppDimens.size24,
            left: 0,
            right: 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: summary.isCompleted ? AppColors.grey : AppColors.primaryLight,
                border: Border.all(color: AppColors.black, width: AppDimens.size1),
                borderRadius: const BorderRadius.all(AppDimens.radius10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppDimens.size8),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.pureWhite,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.black),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: AppDimens.defaultPadding),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
                          child: _HeaderWidget(
                            articles: summary.articles,
                            name: summary.name,
                          ),
                        ),
                        if (summary.isNotEmpty) ...[
                          const SizedBox(height: AppDimens.size10),
                          CategoriesList(categories: summary.categories),
                        ],
                        const SizedBox(height: AppDimens.size10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _IconText(
                                    icon: FontAwesomeIcons.newspaper,
                                    label: 'Articles length: ${summary.bodyLength}',
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          _IconText(
                                            icon: FontAwesomeIcons.book,
                                            label: 'Length: ${summary.summaryStr}',
                                          ),
                                          _IconText(
                                            icon: FontAwesomeIcons.solidClock,
                                            label: 'Time: ${summary.summaryTimeStr}',
                                          ),
                                        ],
                                      ),
                                      Text('(${summary.summaryPercentage}%)'),
                                      if (!summary.isCompleted && !summary.textCompleted) _EditDropDownWidget(onEditPressed: onEditPressed)
                                    ],
                                  ),
                                  if (!summary.isCompleted && !summary.textCompleted)
                                    _LanguageDropDownWidget(
                                      language: summary.language,
                                      onEditPressed: onLanguagePressed,
                                    )
                                ],
                              ),
                              if (summary.isCompleted)
                                Padding(
                                  padding: const EdgeInsets.only(left: AppDimens.size20),
                                  child: BounceWrapper(
                                    onPressed: () => onPlayPressed?.call(summary),
                                    child: CircularContainer(
                                      size: AppDimens.size50,
                                      color: isPlaying ? AppColors.primary : AppColors.lightGrey100,
                                      child: Icon(
                                        isPlaying ? Icons.pause : Icons.play_arrow,
                                        size: AppDimens.size30,
                                        color: isPlaying ? AppColors.white : AppColors.black,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppDimens.size10),
                  if (summary.isNotEmpty)
                    Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: AppColors.purple,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(AppDimens.size10),
                            bottomRight: Radius.circular(AppDimens.size10),
                          ),
                          border: Border.all(color: AppColors.black),
                        ),
                        child: ClipRRect(
                          child: RippleEffectWrapper(
                            splashColor: AppColors.primaryLight,
                            onPressed: onActionPressed,
                            child: Padding(
                              padding: const EdgeInsets.all(AppDimens.defaultPadding),
                              child: Row(
                                children: [
                                  FaIcon(
                                    icon,
                                    color: AppColors.black,
                                    size: 18,
                                  ),
                                  const SizedBox(width: AppDimens.size8),
                                  Text(
                                    summary.isCompleted ? 'View Articles' : actionStr,
                                    style: context.textTheme.bodyMedium?.copyWith(color: AppColors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData get icon => summary.isCompleted
      ? FontAwesomeIcons.solidEye
      : summary.textCompleted
          ? FontAwesomeIcons.podcast
          : FontAwesomeIcons.font;

  String get actionStr => summary.textCompleted ? 'Get audio summary' : 'Start text summary';

  double get height => summary.isCompleted
      ? 270
      : summary.isNotEmpty
          ? 290
          : 160;
}

class _EditDropDownWidget extends StatelessWidget {
  const _EditDropDownWidget({
    Key? key,
    this.onEditPressed,
  }) : super(key: key);

  final ValueChanged<int>? onEditPressed;

  static const List<int> possiblePercentages = [90, 80, 70, 60, 50];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppDimens.size4),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          customButton: SizedBox(
            width: 80,
            height: 22,
            child: RoundContainer(
              color: AppColors.primary,
              child: Center(child: Text('Edit', style: context.textTheme.bodyMedium?.copyWith(color: AppColors.white))),
            ),
          ),
          items: possiblePercentages
              .map(
                (item) => DropdownMenuItem<int>(
                  value: item,
                  child: Text(
                    'Max $item% ',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            onEditPressed?.call(value ?? 70);
          },
          dropdownStyleData: DropdownStyleData(
            width: 160,
            padding: const EdgeInsets.symmetric(vertical: AppDimens.size6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimens.size4),
              color: AppColors.pureWhite,
            ),
            offset: const Offset(0, 8),
          ),
          menuItemStyleData: MenuItemStyleData(
            customHeights: List<double>.filled(possiblePercentages.length, 35),
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.size16),
          ),
        ),
      ),
    );
  }
}

class _LanguageDropDownWidget extends StatelessWidget {
  const _LanguageDropDownWidget({
    Key? key,
    this.onEditPressed,
    required this.language,
  }) : super(key: key);

  final ValueChanged<LanguageEnum>? onEditPressed;
  final LanguageEnum language;

  static const List<LanguageEnum> possiblePercentages = [LanguageEnum.en, LanguageEnum.es];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppDimens.size4),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          customButton: SizedBox(
            width: 200,
            height: 30,
            child: RoundContainer(
              color: AppColors.white,
              child: Center(
                child: Text(
                  'Language: ${language.withEmoji}',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          ),
          items: possiblePercentages
              .map(
                (item) => DropdownMenuItem<LanguageEnum>(
                  value: item,
                  child: Text(
                    item.withEmoji,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            onEditPressed?.call(value ?? LanguageEnum.en);
          },
          dropdownStyleData: DropdownStyleData(
            width: 160,
            padding: const EdgeInsets.symmetric(vertical: AppDimens.size6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimens.size4),
              color: AppColors.pureWhite,
            ),
            offset: const Offset(0, 8),
          ),
          menuItemStyleData: MenuItemStyleData(
            customHeights: List<double>.filled(possiblePercentages.length, 35),
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.size16),
          ),
        ),
      ),
    );
  }
}

class _IconText extends StatelessWidget {
  const _IconText({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.size4),
      child: Row(
        children: [
          FaIcon(
            icon,
            color: AppColors.black,
            size: 18,
          ),
          const SizedBox(width: AppDimens.size8),
          Text(label, style: context.textTheme.bodyMedium?.copyWith(color: AppColors.black)),
          const SizedBox(width: AppDimens.size8),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({
    Key? key,
    required this.articles,
    this.name,
  }) : super(key: key);

  final List<ArticleModel> articles;
  final String? name;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final sources = articles.take(5).map((e) => e.source).toList();

    if (sources.isEmpty) {
      return Row(
        children: [
          Text(
            'No Articles yet',
            textAlign: TextAlign.start,
            style: textTheme.titleMedium,
          ),
        ],
      );
    }

    return SizedBox(
      height: AppDimens.size40,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: sources.length == 1 ? 40 : sources.length * AppDimens.size20,
            child: Stack(
              alignment: Alignment.topLeft,
              fit: StackFit.loose,
              children: sources.map(
                (source) {
                  final index = sources.indexOf(source);
                  return Positioned(
                    top: 0,
                    left: index * AppDimens.size12,
                    child: SourceLogo(
                      source: source,
                      size: AppDimens.size40,
                      showName: false,
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          const SizedBox(width: AppDimens.size2),
          if (name != null && name!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Text(
                '$name - ',
                style: textTheme.titleMedium,
              ),
            ),
          Text(
            '${articles.length} articles',
            style: name == null || name!.isEmpty ? textTheme.titleMedium : textTheme.bodySmall,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
