import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ve_news/config/res/res.dart';
import 'package:ve_news/domain/channel/source_model.dart';

class SourceLogo extends StatelessWidget {
  const SourceLogo({
    Key? key,
    required this.source,
    this.onTap,
  }) : super(key: key);

  final SourceModel source;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(AppDimens.size16),
            padding: const EdgeInsets.all(AppDimens.size8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Hero(
              tag: source.id,
              child: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  source.logo.value,
                ),
              ),
            ),
          ),
          Text(
            source.name,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.secondaryTextColor),
          ),
        ],
      ),
    );
  }
}
