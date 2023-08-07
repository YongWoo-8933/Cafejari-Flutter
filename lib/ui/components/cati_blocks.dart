import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:flutter/material.dart';

class CATIBlocks extends StatelessWidget {
  final bool is_clicked_1;
  final bool is_clicked_2;
  final bool is_clicked_3;
  final bool is_clicked_4;

  CATIBlocks({
    required this.is_clicked_1,
    required this.is_clicked_2,
    required this.is_clicked_3,
    required this.is_clicked_4,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildCategoryColumn("개방", "아늑", is_clicked_1),
        SizedBox(width: 10),
        _buildCategoryColumn("디저트","커피", is_clicked_2),
        SizedBox(width: 10),
        _buildCategoryColumn("업무","힐링", is_clicked_3),
        SizedBox(width: 10),
        _buildCategoryColumn("여긴","뭘까", is_clicked_4),
      ],
    );
  }

  Widget _buildCategoryColumn(String text1,String text2, bool clicked) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => {},
          child: Container(
            alignment: Alignment.center,
            width: 53,
            height: 32,
            decoration: BoxDecoration(
              color: clicked ? AppColor.secondary : AppColor.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: Text(
              text1,
              style: TextStyle(
                fontSize: 12,
                color: clicked ? AppColor.white : AppColor.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => {},
          child: Container(
            alignment: Alignment.center,
            width: 53,
            height: 32,
            decoration: BoxDecoration(
              color: !clicked ? AppColor.secondary : AppColor.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Text(
              text2,
              style: TextStyle(
                fontSize: 12,
                color: !clicked ? AppColor.white : AppColor.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
