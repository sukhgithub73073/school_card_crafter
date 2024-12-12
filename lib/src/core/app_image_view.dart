import 'dart:io';

import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_tap_widget.dart';
import 'package:flutter/material.dart';

enum ImageType { asset, file, network }

class ImageView extends StatelessWidget {
  final String url;
  final ImageType? imageType;
  final double? size;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double? radius;
  final Color? tintColor;
  final Color? borderColor;
  final EdgeInsets? margin;
  final Function()? onTap;
  final bool hasBorder;

  const ImageView({
    super.key,
    required this.url,
    this.imageType,
    this.size,
    this.height,
    this.width,
    this.fit,
    this.onTap,
    this.radius,
    this.tintColor,
    this.margin,
    this.hasBorder = false,
    this.borderColor,
  });

  ImageProvider image() {
    switch (imageType) {
      case ImageType.network:
        return NetworkImage(url == ""
            ? "https://pinnacle.works/wp-content/uploads/2022/06/dummy-image.jpg"
            : url);
      case ImageType.file:
        return FileImage(File(url));
      default:
        return AssetImage(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Stack(
        children: [
          Container(
            height: size ?? height,
            width: size ?? width,
            decoration: hasBorder
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(radius ?? 0),
                    border: Border.all(color: borderColor!, width: 2))
                : null,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius ?? 0),
              child: Container(
                color: imageType == ImageType.network ? colorCard : null,
                child: Image(
                  image: image(),
                  height: size ?? height,
                  width: size ?? width,
                  fit: fit,
                  color: tintColor,
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox(),
                ),
              ),
            ),
          ),
          Positioned.fill(
              child: TapWidget(
            onTap: onTap,
          ))
        ],
      ),
    );
  }
}
