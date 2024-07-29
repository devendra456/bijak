import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../configs/app_constants.dart';

class ImageLoaderWidget extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit boxFit;
  final Color? color;

  const ImageLoaderWidget({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
    this.boxFit = BoxFit.contain,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final extension = imagePath.split('.').last.toLowerCase();
    final isNetworkImage = AppConsts.urlRegex.hasMatch(imagePath);

    return isNetworkImage
        ? _buildNetworkImage(extension)
        : _buildAssetImage(extension);
  }

  Widget _buildNetworkImage(String extension) {
    switch (extension) {
      case "svg":
        return SvgPicture.network(
          imagePath,
          width: width,
          height: height,
          fit: boxFit,
          colorFilter:
              color != null ? ColorFilter.mode(color!, BlendMode.src) : null,
          placeholderBuilder: (context) =>
              kDebugMode ? const Placeholder() : const SizedBox(),
        );
      default:
        return CachedNetworkImage(
          imageUrl: imagePath,
          height: height,
          width: width,
          fit: boxFit,
          progressIndicatorBuilder: (context, url, progress) => Center(
            child: CircularProgressIndicator.adaptive(
              value: progress.progress,
            ),
          ),
          errorWidget: (context, _, dyn) => const Center(
            child: Icon(Icons.error_outline_rounded),
          ),
        );
    }
  }

  Widget _buildAssetImage(String extension) {
    switch (extension) {
      case "svg":
        return SvgPicture.asset(
          imagePath,
          width: width,
          height: height,
          fit: boxFit,
          colorFilter:
              color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
          placeholderBuilder: (context) =>
              kDebugMode ? const Placeholder() : const SizedBox(),
        );
      default:
        return Image.asset(
          imagePath,
          height: height,
          width: width,
          fit: boxFit,
          color: color,
          errorBuilder: (context, _, stackTrace) =>
              kDebugMode ? const Placeholder() : const SizedBox(),
        );
    }
  }
}
