
import 'package:flutter/widgets.dart';

class HorizontalSpacer extends SizedBox {
  const HorizontalSpacer(
    double width, {super.key}
  ):super(
    width: width,
    height: 1
  );
}

class VerticalSpacer extends SizedBox {
  const VerticalSpacer(
    double height, {super.key}
    ):super(
    width: 1,
    height: height
  );
}