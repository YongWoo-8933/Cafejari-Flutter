import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:flutter/material.dart';


class CafeFreeEditPart extends StatelessWidget {
  final double width;
  final TextEditingController textEditingController;

  const CafeFreeEditPart({Key? key, required this.width, required this.textEditingController}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: width,
      height: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: TextInputType.text,
        cursorColor: AppColor.primary,
        maxLines: 10,
        onChanged: (value) {},
        textInputAction: TextInputAction.done,
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.white,
          hintText: "여기에 적어주세요",
          hintStyle: const TextStyle(
            color: AppColor.grey_600,
            fontWeight: FontWeight.w400,
            fontSize: 14
          ),
          contentPadding: AppPadding.padding_20,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.grey_400),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.grey_400),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.grey_400),
            borderRadius: BorderRadius.circular(20),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.grey_400),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}