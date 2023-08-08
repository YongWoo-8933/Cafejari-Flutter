import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookMarkedCard extends StatelessWidget {
  final String cafeName;
  final String cafeAddress;
  final VoidCallback? onPressed;
  final String? cafeImage;

  BookMarkedCard({
    required this.cafeName,
    required this.cafeAddress,
    this.onPressed,
    this.cafeImage
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('asset/image/cafe_icon_2.png')
                // NetworkImage(cafeImage ?? " ")
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(cafeName, style: TextSize.textSize_bold_14),
          Text(cafeAddress, style: TextSize.textSize_grey_12),
          SizedBox(height: 10),
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
