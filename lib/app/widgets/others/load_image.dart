import 'package:cached_network_image/cached_network_image.dart';
import 'package:coba/app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadImage extends StatelessWidget {
  const LoadImage({
    super.key,
    required this.height,
    required this.width,
    required this.imageUrl,
  });

  final double height;
  final double width;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      fit: BoxFit.fill,
      imageUrl: imageUrl ?? 'https://i.ibb.co/S32HNjD/no-image.jpg',
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: width,
          height: height,
          color: AppColors.whiteColor,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
