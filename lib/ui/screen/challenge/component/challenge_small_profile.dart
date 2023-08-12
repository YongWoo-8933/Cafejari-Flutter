import 'package:cached_network_image/cached_network_image.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChallengeSmallProfile extends ConsumerWidget {
  final List<String> imageUrls;
  final int participantCount;

  const ChallengeSmallProfile({
    Key? key,
    required this.imageUrls,
    required this.participantCount
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<CachedNetworkImage> images = imageUrls.map((e) {
      return CustomCachedNetworkImage(imageUrl: e, width: 24, height: 24);
    }).toList().sublist(0, 3);

    List<Widget> positionedImages = List.generate(
      images.length,
      (index) => Positioned(
        left: (24 * index) * 0.6,
        top: 0,
        child: images[index]
      ),
    );

    return Row(
      children: [
        SizedBox(
          height: 24,
          width: 60,
          child: Stack(
            children: [
              ...positionedImages
            ],
          ),
        ),
        SizedBox(
          child: Text(
            "+$participantCount명 참가 중",
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColor.grey_600
            )
          ),
        )
      ],
    );
  }
}