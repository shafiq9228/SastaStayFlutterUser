import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import '../utils/custom_colors.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Color? color;
  final double? borderRadius;
  final bool showProgress;
  const CustomNetworkImage(
      {super.key,
      required this.imageUrl,
      this.fit = BoxFit.contain,
      this.width,
      this.height,
      this.color,
      this.borderRadius,
      this.showProgress = true,
      });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        cacheKey: imageUrl,
        width: width,
        height: height,
        color: color,
        progressIndicatorBuilder: (context, url, loadingProgress) => Center(
            child: Visibility(
          visible: showProgress,
          child: width == null || height == null ? CircularProgressIndicator(
            color: CustomColors.secondary,
            backgroundColor: CustomColors.primary,
            value: loadingProgress.progress,
          ) : FadeShimmer(
              height: height ?? 10,
              width: width ?? 10,
              radius: borderRadius ?? 0,
              millisecondsDelay: 100,
              highlightColor: Colors.grey.shade200,
              baseColor:Colors.white,
            ),
        )),
        errorWidget: (context, url, error) =>  Icon(
          Icons.error,
          color: CustomColors.primary,
          size: 48.0,
        ),
      ),
    );
  }
}
