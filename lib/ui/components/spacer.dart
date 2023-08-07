
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:flutter/widgets.dart';

class HorizontalSpacer extends StatelessWidget {
  final double width;

  const HorizontalSpacer(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          width: width,
          height: constraints.maxHeight,
          color: AppColor.transparent,
        );
      },
    );
  }
}

class VerticalSpacer extends StatelessWidget {
  final double height;

  const VerticalSpacer(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          width: constraints.maxWidth,
          height: height,
          color: AppColor.transparent,
        );
      },
    );
  }
}