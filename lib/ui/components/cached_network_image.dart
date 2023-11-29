
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomCachedNetworkImage extends CachedNetworkImage {
  CustomCachedNetworkImage({
    super.key,
    required super.imageUrl,
    super.width,
    super.height,
    BoxFit? fit
  }): super(
    placeholder: (context, url) => LoadingAnimationWidget.hexagonDots(color: AppColor.black, size: 20),
    errorWidget: (context, url, error) => const Icon(CupertinoIcons.exclamationmark_circle),
    fit: fit ?? BoxFit.cover
  );
}