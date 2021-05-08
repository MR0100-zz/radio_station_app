import 'package:flutter/material.dart';

/// ignore: must_be_immutable
class CustomImageView extends StatelessWidget {
  final String imageUrl;
  final bool isFromAssets;
  final double height;
  final double width;
  final BoxFit fit;

  const CustomImageView(
      {Key key,
      this.imageUrl,
      this.isFromAssets,
      this.height,
      this.width,
      this.fit})
      : assert(imageUrl != "" && imageUrl != null);

  @override
  Widget build(BuildContext context) {
    return Image(
      image:
          isFromAssets ?? true ? AssetImage(imageUrl) : NetworkImage(imageUrl),
      height: height ?? null,
      width: width ?? null,
      fit: fit ?? BoxFit.contain,
    );
  }
}
