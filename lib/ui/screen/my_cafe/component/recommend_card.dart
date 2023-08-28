import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendCard extends StatelessWidget {
  final String cafeName;
  final String? cafeCrowded;
  final String? cafePlug;
  final VoidCallback? onPressed;
  final String? cafeImage;

  RecommendCard({
    required this.cafeName,
    this.cafeCrowded,
    this.cafePlug,
    this.onPressed,
    this.cafeImage
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppPadding.padding_7,
      padding: AppPadding.padding_10,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColor.grey_300.withOpacity(0.5), // Shadow color and opacity
            blurRadius: 5, // Spread of the shadow
            offset: Offset(1, 1),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CustomCachedNetworkImage(imageUrl: "https://cafejari.s3.amazonaws.com/cafe/cafe_image/%EC%8A%A4%ED%83%80%EB%B2%85%EC%8A%A4_%EC%8B%A0%EC%B4%8C%EC%98%A4%EA%B1%B0%EB%A6%AC%EC%A0%90_KakaoTalk_20230804_120411907.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=ASIAXQYFTMAZG5VBFNLI%2F20230827%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20230827T090949Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaDmFwLW5vcnRoZWFzdC0yIkYwRAIgMyWvSdp6nmsV1GvS59WKnHv4mI9haxCXe0lrZPzC2MkCIFGuDCUcxPP5FG89QNEaZTDMS4ak1ADsXcXQeRjmBqUwKsoFCG4QABoMNTE3MDE4NDQzODI2IgyFPRQNheo0JJmgYzoqpwU%2Bb4zuh%2FwWt6yg49vWMAXBR2NqEHh9t7f%2FglAQ0lF2N3ba91UTAYO%2BCfs7KVoY8LwPf02s7jGp0YU5BrAFAkqmmkSR%2FFv28U5U2hZLR43f3ARR9Bgo%2Bg9W9qkjVllP2zrHJpso9bq6K0DDah6%2B%2BWRqiCZQ0UPQZvikvXWrm%2F8%2FJsfFYZKWGQcpPyqBRGZ9aSiJP2KsK1myG4tXeIU3xyepKeuYaVubTgFMub9F%2F%2FchaaWB36y9IxayGlhqrjiZLpDMeSy8uMys4CJRUSkk2jZZddd5AuZBWJqgndDLPbQdn3UwA4n%2FNyGTauHo9pcBOJH2PP6IJJff1nNVN4TVHrZyZa%2FGmHzy%2B6OT8KvVw0jKSO%2F%2BtMj%2BX9n9reLND75SZE4fwfwiDLbMg1q9OnrKCpkjhd6UBfX5f4hoxHKoOTY3PzBg%2FXP5cyyz73kXTeUL7U4aP93wDZdXeGAbq0w%2FmG%2BohgPOrU%2FjMsnpHmjKRL4f778S%2FWfbQglWsd1dlQvlJvI0DI9t1Rgv8LoC9i98iexzSDBQT49c1veX5IcBW%2Fjnl4DwnoNzThzf5bw7LtXEUIb3j8wlcpyicT7MNH%2Fp6f5URjjI2A0XjvOTNUD5VT40H7WTOJNsq2qj%2FpgMIQlDV9P1wRAf4IhrZB4Vt3xB502mZBGz4yN5FRpwp%2BvaDr8DIRvRtYJADYpZHVz2PssqssqMjEJB%2BTR8YmMLeapys82m1xhaBttah4c8QZADMbEgMqcg4WUlUBXkDvCpbLg97UBtLwGZUgISV8xlAilF9Qj2ZhAdwFvEr%2FwhkKbQN1COw2OG0nmxzeLfLQI3YyOinF2ANXKc9hySusdEbXyHAH9RznMsvrXebFP8JKcpi5k3h8DY0AAQoUUX9j6FY0GrFAOQeEhm9tS%2BMJisq6cGOrIBoyvSDxO60oyf3vupXzcigHD%2BlIoFkzje%2BdXd1kuo3qvatLlYcRwbhpEs0aRbNZ0BFqiKybYLNKweluA9n2nfUbLjJAGzRCFpFh%2BYeMLuXLLzh%2Fa5zSZ4jEzGdNroSahowfUWY8kOknRnYU1AMtU%2FiofdC%2FjbJA5bw1vllrCKCWfuQiIHcD9pQCk43oFlsFZmK3KpDPg1ySbbwr6oz6mc6tQ11KtDtAHecKwwNOOqA7msZQ%3D%3D&X-Amz-Signature=c626564d0c2fd26e17561829979ee064d8ccb797b5e0b4a686a8340d03cc292c",),
              // cafe.imageUrls.isNotEmpty ? CustomCachedNetworkImage(imageUrl: cafe.imageUrls[0]) : Image.asset('asset/image/testimage.png'),
            ),
          ),
          SizedBox(height: 6),
          Text("#대표태그", style: TextSize.textSize_grey_12),
          Text(cafeName, style: TextSize.textSize_bold_16),
          SizedBox(height: 10),
          Row(
            children: [
              Image.asset("asset/image/icon_people4_black.png"),
              Text(" 혼잡도 ", style: TextSize.textSize_grey_12),
              Text(cafeCrowded ?? "정보없음", style: TextSize.textSize_bold_12),
            ],
          ),
          Row(
            children: [
              Image.asset("asset/image/icon_plug.png"),
              Text(" 콘센트 ", style: TextSize.textSize_grey_12),
              Text(cafePlug ?? "정보없음", style: TextSize.textSize_bold_12),
            ],
          ),
        ],
      ),
    );
  }
}
