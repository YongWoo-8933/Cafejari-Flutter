import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:flutter/widgets.dart';

class PageViewDotIndicator extends StatelessWidget {
  final int dotCount;
  final int selectedDotIndex;
  final Color? selectedDotColor;

  const PageViewDotIndicator({
    super.key,
    required this.dotCount,
    required this.selectedDotIndex,
    this.selectedDotColor = AppColor.grey_100
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        for(int i = 0; i < dotCount; i++)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: i == selectedDotIndex ? selectedDotColor : AppColor.grey_300.withOpacity(0.6),
            )
          ),
      ]
    );
  }
}
