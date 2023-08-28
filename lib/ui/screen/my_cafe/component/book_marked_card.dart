import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookMarkedCard extends StatelessWidget {
  final Cafe cafe;
  final VoidCallback? onPressed;

  BookMarkedCard({
    required this.cafe,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // 원 모양의 배경 색상 또는 이미지를 설정할 수도 있습니다.
              color: Colors.blue, // 예시 색상, 필요에 따라 변경해주세요.
            ),
            child: ClipOval(
              child: CustomCachedNetworkImage(imageUrl: cafe.imageUrls[0]),
              // cafe.imageUrls.isNotEmpty ? CustomCachedNetworkImage(imageUrl: cafe.imageUrls[0]) : Image.asset('asset/image/testimage.png'),
            ),
          ),
          SizedBox(height: 10),
          Text(cafe.name, style: TextSize.textSize_bold_14),
          SizedBox(height: 5),
          Text(cafe.address, style: TextSize.textSize_grey_12),
          ElevatedButton(
            onPressed: () {
              onPressed;
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: AppColor.grey_300),
              ),
              backgroundColor: AppColor.white,
              elevation: 0,
              minimumSize: Size(0, 30),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "삭제",
                  style: TextSize.textSize_12,
                ),
                Icon(
                  CupertinoIcons.clear,
                  size: 12,
                  color: AppColor.black,
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
