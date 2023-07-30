import 'package:flutter/material.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/config/theme/text_theme.dart';

import 'plan_card.dart';

class ChoosePlanSection extends StatefulWidget {
  const ChoosePlanSection({
    Key? key,
  }) : super(key: key);

  @override
  State<ChoosePlanSection> createState() => _ChoosePlanSectionState();
}

class _ChoosePlanSectionState extends State<ChoosePlanSection> {
  int selectedCard = 0;
  final plan = [
    'Month \$12.99',
    'Year \$6.9/mo',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
      child: Column(
        children: [
          // Headline
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Choose your plan',
                style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w200),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.info_outlined)),
            ],
          ),

          // Plan Card
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: PlanCard(
                    pricing: plan[0].split(' ').join('\n'),
                    details: 'Billed Every Month',
                    isActive: selectedCard == 0,
                    onTap: () {
                      setState(() {
                        selectedCard = 0;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: PlanCard(
                    pricing: plan[1].split(' ').join('\n'),
                    details: 'Billed Every 12 Month',
                    isActive: selectedCard == 1,
                    onTap: () {
                      setState(() {
                        selectedCard = 1;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          /// Get Premium Button
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Get Premium - ${plan[selectedCard].split(' ').last}',
            ),
          ),
        ],
      ),
    );
  }
}
