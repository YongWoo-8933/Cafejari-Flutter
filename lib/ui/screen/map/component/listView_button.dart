import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ListViewButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: Text("목록보기", style: TextStyle(color: AppColor.black),),
      icon: Icon(CupertinoIcons.list_bullet),
      onPressed: onPressed,
      backgroundColor: AppColor.white,
    );
  }
}