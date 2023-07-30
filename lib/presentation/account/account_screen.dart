import 'package:flutter/material.dart';

import 'components/account_settings_tile.dart';
import 'components/choose_plan.dart';
import 'components/user_info.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// User Info
          const UserInfo(),

          const Divider(height: 30),

          /// Plan Choose
          const ChoosePlanSection(),

          const Seperator(),

          /// User Details
          Column(
            children: const [
              AccountSettingsTile(
                leadingText: 'Full Name',
                trailingText: 'Gabriel Matusov',
              ),
              AccountSettingsTile(
                leadingText: 'Email',
                trailingText: 'gabmatus@gmail.com',
              ),
              AccountSettingsTile(
                leadingText: 'Country',
                trailingText: 'Finland',
                trailingIcon: Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ),
              AccountSettingsTile(
                leadingText: 'City',
                trailingText: 'Helsinki',
                trailingIcon: Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ),
            ],
          ),

          const Seperator(),

          /// Others
          Column(
            children: const [
              AccountSettingsTile(
                leadingText: 'Favourite Channels',
                trailingText: '17',
                trailingIcon: Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ),
              AccountSettingsTile(
                leadingText: 'Bookmarks',
                trailingText: '386',
                trailingIcon: Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ),
            ],
          ),

          const Seperator(),

          /// Others
          Column(
            children: const [
              AccountSettingsTile(
                leadingText: 'Newsletters',
                trailingText: '',
                trailingIcon: Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ),
              AccountSettingsTile(
                leadingText: 'Settings',
                trailingText: '0',
                trailingIcon: Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ),
            ],
          ),

          const Seperator(),

          /// Log out
          const AccountSettingsTile(
            leadingText: 'Logout',
            trailingText: '',
            trailingIcon: Icon(Icons.arrow_forward_ios_rounded, size: 16),
          ),

          const Seperator(),
        ],
      ),
    );
  }
}

class Seperator extends StatelessWidget {
  const Seperator({
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
