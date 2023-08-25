
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/widgets.dart';

class CafeNameAddressBlock extends StatelessWidget {
  final String name, address;
  final double nameTextSize;

  const CafeNameAddressBlock({
    super.key, required this.name, required this.address, this.nameTextSize = 20.0});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: nameTextSize,
            fontWeight: FontWeight.w700
          )
        ),
        const VerticalSpacer(8),
        Row(
          children: [
            Image.asset(
              "asset/image/icon_small_pin.png",
              height: 12,
            ),
            const HorizontalSpacer(4),
            Text(
              address,
              style: const TextStyle(
                  color: AppColor.grey_800,
                  fontSize: 12
              )
            )
          ],
        )
      ],
    );
  }
}
