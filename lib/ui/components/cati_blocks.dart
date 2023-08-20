import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/material.dart';

class CATIBlocks extends StatelessWidget {
  final bool is1stBlockClicked;
  final bool is2ndBlockClicked;
  final bool is3rdBlockClicked;
  final bool is4thBlockClicked;

  const CATIBlocks({super.key,
    required this.is1stBlockClicked,
    required this.is2ndBlockClicked,
    required this.is3rdBlockClicked,
    required this.is4thBlockClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCategoryColumn("개방", "아늑", is1stBlockClicked),
        const HorizontalSpacer(10),
        _buildCategoryColumn("디저트","커피", is2ndBlockClicked),
        const HorizontalSpacer(10),
        _buildCategoryColumn("업무","힐링", is3rdBlockClicked),
        const HorizontalSpacer(10),
        _buildCategoryColumn("여긴","뭘까", is4thBlockClicked),
      ],
    );
  }

  Widget _buildCategoryColumn(String text1,String text2, bool clicked) {
    const double blockHeight = 72;
    const double blockWidth = 64;
    const double cornerRadius = 10;
    return Column(
      children: [
        GestureDetector(
          onTap: () => {},
          child: Container(
            alignment: Alignment.center,
            width: blockWidth,
            height: blockHeight / 2,
            decoration: BoxDecoration(
              color: clicked ? AppColor.secondary : AppColor.unselectedButtonColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(cornerRadius),
                topRight: Radius.circular(cornerRadius),
              ),
            ),
            child: Text(
              text1,
              style: TextStyle(
                fontSize: 12,
                color: clicked ? AppColor.unselectedButtonColor : AppColor.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => {},
          child: Container(
            alignment: Alignment.center,
            width: blockWidth,
            height: blockHeight / 2,
            decoration: BoxDecoration(
              color: !clicked ? AppColor.secondary : AppColor.unselectedButtonColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(cornerRadius),
                bottomRight: Radius.circular(cornerRadius),
              ),
            ),
            child: Text(
              text2,
              style: TextStyle(
                fontSize: 12,
                color: !clicked ? AppColor.unselectedButtonColor : AppColor.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
