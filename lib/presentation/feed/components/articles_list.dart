import 'package:flutter/material.dart';

import 'article_tile_horizontal.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ArticleTileHorizontal(
          title: 'On politics with Lisa Loureniani: Warren’s growing crowds',
          category: 'Politics',
          channelName: 'Euronews',
          imageSrc: 'https://i.imgur.com/O34AfJ8.png',
          time: '1m',
        ),
        ArticleTileHorizontal(
          title: 'Recent commercial real estate transactions in London and Paris',
          category: 'Real Estate',
          channelName: 'Bloomberg',
          imageSrc: 'https://i.imgur.com/88MxwWf.png',
          time: '3m',
        ),
        ArticleTileHorizontal(
          title: 'We answer Trump\'s question: Could you nuke a hurricane?',
          category: 'World',
          channelName: 'The Washington Post',
          imageSrc: 'https://i.imgur.com/OZWIkrX.png',
          time: '7m',
        ),
        ArticleTileHorizontal(
          title: 'MotoGP alters track limits boundary after controversy',
          category: 'Moto News',
          channelName: 'Sports',
          imageSrc: 'https://i.imgur.com/8kj1JWc.png',
          time: '7m',
        ),
        ArticleTileHorizontal(
          title: 'Remembering the magic of a beloved Brooklyn',
          category: 'Culture',
          channelName: 'The New York Times',
          imageSrc: 'https://i.imgur.com/E9YpKFU.png',
          time: '10m',
        ),
      ],
    );
  }
}
