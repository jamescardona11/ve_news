import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/account_settings_tile.dart';
import 'components/choose_plan.dart';
import 'components/user_info.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserInfo(),
              Divider(height: 30),
              ChoosePlanSection(),
              Separator(),
              Column(
                children: [
                  AccountSettingsTile(
                    leadingText: 'Email',
                    trailingText: 'No connected yet',
                  ),
                  AccountSettingsTile(
                    leadingText: 'Country',
                    trailingText: 'U.S',
                    trailingIcon: FontAwesomeIcons.chevronRight,
                  ),
                  AccountSettingsTile(
                    leadingText: 'Preferred Language',
                    trailingText: 'English',
                    trailingIcon: FontAwesomeIcons.chevronRight,
                  ),
                ],
              ),
              Separator(),
              AccountSettingsTile(
                leadingText: 'Favorite Topics',
                trailingText: '17',
                trailingIcon: FontAwesomeIcons.chevronRight,
              ),
              AccountSettingsTile(
                leadingText: 'Favorite Categories',
                trailingText: '3',
                trailingIcon: FontAwesomeIcons.chevronRight,
              ),
              AccountSettingsTile(
                leadingText: 'Bookmarks',
                trailingText: '386',
                trailingIcon: FontAwesomeIcons.chevronRight,
              ),
              Separator(),
              AccountSettingsTile(
                leadingText: 'Settings',
                trailingText: '0',
                trailingIcon: FontAwesomeIcons.chevronRight,
              ),
              Separator(),
            ],
          ),
        ),
      ),
    );
  }
}

class Separator extends StatelessWidget {
  const Separator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 8,
      height: 30,
      color: Colors.grey.shade200,
    );
  }
}
