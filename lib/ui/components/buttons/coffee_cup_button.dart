import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoffeeCupButton extends StatelessWidget { // 크기가 더 작아질시 icon크기 조절 필요
  final bool isAlert;
  final double? buttonSize;
  final Function? onPressed;

  CoffeeCupButton({
    required this.isAlert,
    required this.buttonSize,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Stack( // Stack 위젯을 사용하여 아이콘과 알람 원을 겹쳐서 배치
        children: [
          FloatingActionButton(
            onPressed: () {
              if (onPressed != null) {
                onPressed!(); // 콜백 함수 호출
              }
            },
            backgroundColor: AppColor.primary,
            child: Image.asset(
              "/asset/image/icon_coffeeCup.png",
              width: 15,
              height: 15,
            ),
          ),
          if (isAlert) // 알람이 오면 원을 표시
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.alert, // 알람 원의 색상을 설정
                ),
              ),
            ),
        ],
      ),
    );
  }
}
