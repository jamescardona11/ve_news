import 'package:flutter/material.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/config/theme/text_theme.dart';

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
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text('Free - 12 Days Left'),
            ],
          ),
          // User Picture
          CircleAvatar(
            child: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                // child: const NetworkImageWithLoader('https://i.imgur.com/TMxSwfM.png'),
                child: Image.asset('assets/logo.png')),
          )
        ],
      ),
    );
  }
}
