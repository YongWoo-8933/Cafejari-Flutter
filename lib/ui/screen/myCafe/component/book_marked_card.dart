import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookMarkedCard extends StatelessWidget {
  final String cafeName;
  final String cafeAdress;
  final VoidCallback? onPressed;
  final String? cafeImage;

  BookMarkedCard({
    required this.cafeName,
    required this.cafeAdress,
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
                image: NetworkImage(cafeImage ?? " ")
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(cafeName, style: TextSize.textSize_bold_14),
          Text(cafeAdress, style: TextSize.textSize_grey_12),
          SizedBox(height: 10),
          TextButton(
            onPressed: () => {}, // 즐겨찾기에서 빼는 동작
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: AppColor.grey_300), // Add a gray border
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(CupertinoIcons.clear),
                Text("취소"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
