
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class CafeNameAddressBlock extends StatelessWidget {
  final String name, address;
  final double nameTextSize, width;

  const CafeNameAddressBlock({
    super.key, required this.name, required this.address, required this.width, this.nameTextSize = 20.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          HtmlWidget(
            name,
            onErrorBuilder: (context, element, error) => Text('$element error: $error'),
            onLoadingBuilder: (context, element, loadingProgress) => const CircularProgressIndicator(),
            renderMode: RenderMode.column,
            textStyle: TextStyle(
              fontSize: nameTextSize,
              fontWeight: FontWeight.w700
            ),
          ),
          const VerticalSpacer(8),
          Row(
            children: [
              Visibility(
                visible: address.isNotEmpty,
                child: Image.asset(
                  "asset/image/icon_small_pin.png",
                  height: 12,
                ),
              ),
              const HorizontalSpacer(6),
              SizedBox(
                width: width - 20,
                child: Text(
                  address,
                  style: const TextStyle(
                    color: AppColor.grey_800,
                    fontSize: 12
                  ),
                  maxLines: 2,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
