import 'package:cafejari_flutter/domain/entity/challenge/challenge.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/cached_network_image.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChallengeInformation extends StatelessWidget {
  final Challenge challenge;
  final VoidCallback onChallengeClick;

  const ChallengeInformation({super.key,
    required this.challenge,
    required this.onChallengeClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: AppPadding.padding_30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(challenge.name, style: TextSize.textSize_bold_16),
              const VerticalSpacer(8),
              Text(
                "${challenge.startAt.toString().substring(0, 11)} ~ ${challenge.finishAt.toString().substring(0, 11)}",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColor.grey_600
                )
              ),
              const VerticalSpacer(16),
              Text(challenge.description, style: TextSize.textSize_14),
            ],
          ),
        ),
        GestureDetector(
          onTap: () async => challenge.url.isEmpty ? null : onChallengeClick(),
          child: CustomCachedNetworkImage(imageUrl: challenge.imageUrl, width: double.infinity)
        ),
        const VerticalSpacer(200)
      ],
    );
  }
}
