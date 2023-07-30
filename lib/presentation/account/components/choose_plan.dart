import 'package:flutter/material.dart';
import 'package:ve_news/config/res/res.dart';

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
                style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w200),
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
                    pricing: 'Month\n \$9.99',
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
                    pricing: 'Year\n \$4.9/mo',
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
            child: const Text('Get Premium - \$9.99'),
          ),
        ],
      ),
    );
  }
}
