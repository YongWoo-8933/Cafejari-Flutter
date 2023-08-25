import 'package:cafejari_flutter/domain/entity/push/push.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PushBlock extends StatelessWidget {
  final Push push;

  PushBlock({
    required this.push
  });

  @override
  Widget build(BuildContext context) {

    final blockWidth = MediaQuery.of(context).size.width-40;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // width: blockWidth,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 55,
            child: push.type.image,
          ),
          Container(
            width: blockWidth-75,
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start ,
                  children: [
                    Text(_convertToFormattedDate(push.pushedAt),
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.unselectedTabBarColor
                        )),
                    HorizontalSpacer(5),
                    Text(_formatTimeDifference(push.pushedAt),
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.unselectedTabBarColor
                        ))
                  ],
                ),
                VerticalSpacer(11),
                Text(push.body, style: TextSize.textSize_14)
              ],
            ),
          )

        ],
      ),
    );
  }
}

String _convertToFormattedDate(DateTime originalDate) {
  String formattedDate = "${originalDate.year.toString().substring(2)}.${originalDate.month.toString().padLeft(2, '0')}.${originalDate.day.toString().padLeft(2, '0')}";
  return formattedDate;
}

String _formatTimeDifference(DateTime targetDate) {
  DateTime now = DateTime.now();

  Duration difference = now.difference(targetDate);

  if (difference.inMinutes < 60) {
    return "${difference.inMinutes}분 전";
  } else if (difference.inHours < 24) {
    return "${difference.inHours}시간 전";
  } else if (difference.inDays < 30) {
    return "${difference.inDays}일 전";
  } else if (difference.inDays < 365) {
    int months = now.month - targetDate.month + (now.year - targetDate.year) * 12;
    return "${months}달 전";
  } else {
    int years = now.year - targetDate.year;
    return "${years}년 전";
  }
}
