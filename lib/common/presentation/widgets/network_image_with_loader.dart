import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ve_news/config/res/res.dart';

import 'skeleton.dart';

class NetworkImageWithLoader extends StatelessWidget {
  final BoxFit fit;

  const NetworkImageWithLoader(
    this.src, {
    Key? key,
    this.fit = BoxFit.cover,
    this.radius = AppDimens.size10,
    this.size = AppDimens.size40,
  }) : super(key: key);

  final String src;
  final double radius;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: CachedNetworkImage(
          fit: fit,
          imageUrl: src,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: fit,
              ),
            ),
          ),
          placeholder: (context, url) => const Skeleton(),
          errorWidget: (context, url, error) {
            return Center(
              child: Image.asset(AppAssets.noPhotoImg, width: 45, height: 45),
            );
          },
        ),
      ),
    );
  }
}
