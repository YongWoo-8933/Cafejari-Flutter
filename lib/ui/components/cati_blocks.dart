import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CATIBlocks extends StatelessWidget {
  final bool is_clicked;

  CATIBlocks({
    required this.is_clicked
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => {},
          child: Container(
            decoration: BoxDecoration(
              color: is_clicked ? AppColor.secondary : AppColor.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Text("개방", style: TextStyle(fontSize: 12, color: is_clicked ? AppColor.white : AppColor.black)),
          ),
        ),
        GestureDetector(
          onTap: () => {},
          child: Container(
            decoration: BoxDecoration(
              color: is_clicked! ? AppColor.secondary : AppColor.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            ),
            child: Text("아늑", style: TextStyle(fontSize: 12, color: is_clicked! ? AppColor.white : AppColor.black)),
          ),
        ),
      ],
    );
  }
}
