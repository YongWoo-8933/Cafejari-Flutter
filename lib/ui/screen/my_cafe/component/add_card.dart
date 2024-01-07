import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';

class AddCard extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback? onPress;

  const AddCard({
    super.key,
    required this.width,
    required this.height,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      strokeWidth: 3.0,
      color: AppColor.grey_300,
      borderType: BorderType.RRect,
      dashPattern: const [10.0, 10.0],
      radius: const Radius.circular(30),
      child: SizedBox(
        width: width,
        height: height,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.add_circled,
              color: AppColor.grey_300,
            ),
            Text("자주가는 카페를\n등록해보세요!", textAlign: TextAlign.center)
          ],
        )
      ),
    );
  }
}
