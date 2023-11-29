import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/components/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileImageSelectGrid extends StatelessWidget {
  final List<({int profileImageId, String imageUrl})> defaultProfileImages;
  final String currentProfileImageUrl;
  final Function(int) onSelect;

  const ProfileImageSelectGrid({
    super.key,
    required this.defaultProfileImages,
    required this.currentProfileImageUrl,
    required this.onSelect
  });

  @override
  Widget build(BuildContext context) {
    final ({int profileImageId, String imageUrl}) selectedProfileImage = defaultProfileImages.firstWhere((e) {
      return e.imageUrl == currentProfileImageUrl;}, orElse: () => (profileImageId: 0, imageUrl: "")
    );

    return GridView.builder(
      padding: AppPadding.padding_20,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 120,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1
      ),
      itemCount: defaultProfileImages.length,
      itemBuilder: (BuildContext context, int index) {
        final ({int profileImageId, String imageUrl}) currentProfileImage = defaultProfileImages[index];
        final bool isSelected = currentProfileImage.profileImageId == selectedProfileImage.profileImageId;
        return ElevatedButton(
          onPressed: () { onSelect(index); },
          style: ElevatedButton.styleFrom(
              backgroundColor: isSelected? AppColor.grey_100 : AppColor.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: BorderSide(
                color: isSelected? AppColor.primary : AppColor.transparent,
                width: 2,
              )
          ),
          child: CustomCachedNetworkImage(imageUrl: currentProfileImage.imageUrl),
        );
      },
    );
  }
}
