import 'package:flutter/material.dart';
import 'package:ve_news/common/presentation/presentation.dart';
import 'package:ve_news/config/res/res.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Text('Premium - 12 Days'),
            ],
          ),
          // User Picture
          CircleAvatar(
            child: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: const NetworkImageWithLoader('https://i.imgur.com/TMxSwfM.png'),
            ),
          )
        ],
      ),
    );
  }
}
