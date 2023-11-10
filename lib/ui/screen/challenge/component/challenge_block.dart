import 'package:cafejari_flutter/domain/entity/challenge/challenge.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
import 'package:cafejari_flutter/ui/components/cached_network_image.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_small_profile.dart';
import 'package:flutter/material.dart';

class ChallengeBlock extends StatelessWidget {
  final List<String> smallProfileImageUrls;
  final Challenge challenge;
  final bool available;
  final VoidCallback? onPressed;

  const ChallengeBlock({
    super.key,
    required this.smallProfileImageUrls,
    required this.challenge,
    required this.available,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: available ? onPressed : () {},
      child: Container(
        decoration: BoxDecoration(
          boxShadow: AppShadow.box,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: AppColor.white,
            width: 280,
            child: Stack(
              children: [
                Visibility(
                  visible: !available,
                  child: Container(
                    color: AppColor.transparentBlack_700,
                  )
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomCachedNetworkImage(imageUrl: challenge.imageUrl, width: 280, height: 280),
                    const Divider(height: 1),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "총 ${challenge.totalPoint}포인트 지급",
                            style: const TextStyle(
                                color: AppColor.secondary, fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          const VerticalSpacer(8),
                          Text(
                            "${challenge.name} (${challenge.challengerUserIds.length}/${challenge.participantLimit})",
                            style: const TextStyle(
                                color: AppColor.primary, fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const VerticalSpacer(8),
                          Visibility(
                            visible: challenge.challengerUserIds.isNotEmpty,
                            child: ChallengeSmallProfile(
                              imageUrls: smallProfileImageUrls,
                              participantCount: challenge.challengerUserIds.length
                            ),
                          ),
                          const VerticalSpacer(4),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
