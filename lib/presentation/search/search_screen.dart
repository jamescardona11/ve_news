import 'package:flutter/material.dart';
import 'package:ve_news/config/res/res.dart';

import 'components/article_square_widget.dart';
import 'components/tags_widget.dart';
import 'components/title_with_action_bar.dart';

List<ArticleSquareWidget> _articleList = const [
  ArticleSquareWidget(
    title: 'How China uses LinkedIn to recruit spies abroad',
    time: '2m',
    category: 'Politics',
    imageSrc: 'https://i.imgur.com/rWQnfJf.png',
  ),
  ArticleSquareWidget(
    title: 'A chance to bond on a perilous hiking trail in Iceland',
    time: '6m',
    category: 'Health',
    imageSrc: 'https://i.imgur.com/2VlIEGl.png',
  ),
  ArticleSquareWidget(
    title: 'Why tourists are flocking to the Black Sea',
    time: '3m',
    category: 'Travel',
    imageSrc: 'https://i.imgur.com/kpE9QIJ.png',
  ),
  ArticleSquareWidget(
    title: 'The uniformity of brands has actually become a negative',
    time: '7m',
    category: 'Lifestyle',
    imageSrc: 'https://i.imgur.com/DRLFJaD.png',
  ),
  ArticleSquareWidget(
    title: 'Lions escape from Kruger park in South Africa',
    time: '7m',
    category: 'World',
    imageSrc: 'https://i.imgur.com/omFuFxJ.png',
  ),
  ArticleSquareWidget(
    title: 'Sanya in six days: our selection for a perfect trip',
    time: '7m',
    category: 'Lifestyle',
    imageSrc: 'https://i.imgur.com/xz59qWj.png',
  ),
];

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            SearchBar(),
            Divider(
              height: 30,
            ),
            // Top Channels
            TopChannelsSection(),
            Divider(
              height: 30,
            ),

            /// Popular TAGS
            PopularTagsSection(),
            Divider(),

            HotNewsSection()
          ],
        ),
      ),
    );
  }
}

class HotNewsSection extends StatelessWidget {
  const HotNewsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.defaultPadding),
      child: Column(
        children: [
          TitleWithActionBar(title: 'Hot News', onTap: () {}),
          GridView.builder(
              itemCount: _articleList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                childAspectRatio: 2 / 3.3,
              ),
              itemBuilder: (context, index) {
                return _articleList[index];
              }),
        ],
      ),
    );
  }
}

class TopChannelsSection extends StatelessWidget {
  const TopChannelsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
      child: Column(
        children: [
          TitleWithActionBar(
            title: 'Top Channels',
            onTap: () {},
          ),
          // const ChannelsRow(),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: 'Search...',
          prefixIcon: Icon(Icons.search_rounded),
        ),
      ),
    );
  }
}

class PopularTagsSection extends StatelessWidget {
  const PopularTagsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
      child: Column(
        children: [
          TitleWithActionBar(
            title: 'Popular Tags',
            onTap: () {},
          ),
          const Tags(),
        ],
      ),
    );
  }
}
