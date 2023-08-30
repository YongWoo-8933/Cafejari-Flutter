
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case.dart';
import 'package:cafejari_flutter/ui/state/my_cafe_state/my_cafe_state.dart';
import 'package:cafejari_flutter/ui/util/n_location.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';

class MyCafeViewModel extends StateNotifier<MyCafeState> {
  final UserUseCase _userUseCase;
  final GlobalViewModel globalViewModel;
  final MapViewModel mapViewModel;

  MyCafeViewModel({required UserUseCase userUseCase, required this.globalViewModel, required this.mapViewModel})
      :_userUseCase = userUseCase,
        super(MyCafeState.empty());

  refreshUser() async {
    try {
      final User user = await _userUseCase.getUser(accessToken: globalViewModel.state.accessToken);
      state = state.copyWith(user: user);
    } on RefreshTokenExpired {
      globalViewModel.logout();
    } on ErrorWithMessage {
      // 에러 메시지 출력
    }
  }

  // setFavoriteCafe() {
  //   final List<Cafe> cafeList = [];
  //   final Cafe cafe = Cafe(
  //       id: 0,
  //       recentUpdatedFloor: null,
  //       recentUpdatedOccupancyRate: null,
  //       isClosed: false,
  //       name: "스타벅스 신촌오거리점",
  //       address: "서울특별시 마포구 신촌로16길 10",
  //       brandName: "",
  //       brandImageUrl: "",
  //       latLng: NLocation.sinchon().cameraPosition.target,
  //       cafeFloors: [],
  //       openingHour: null,
  //       imageUrls: ["https://cafejari.s3.amazonaws.com/cafe/cafe_image/%EC%8A%A4%ED%83%80%EB%B2%85%EC%8A%A4_%EC%8B%A0%EC%B4%8C%EC%98%A4%EA%B1%B0%EB%A6%AC%EC%A0%90_KakaoTalk_20230804_120411907.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=ASIAXQYFTMAZG5VBFNLI%2F20230827%2Fap-northeast-2%2Fs3%2Faws4_request&X-Amz-Date=20230827T090949Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKX%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaDmFwLW5vcnRoZWFzdC0yIkYwRAIgMyWvSdp6nmsV1GvS59WKnHv4mI9haxCXe0lrZPzC2MkCIFGuDCUcxPP5FG89QNEaZTDMS4ak1ADsXcXQeRjmBqUwKsoFCG4QABoMNTE3MDE4NDQzODI2IgyFPRQNheo0JJmgYzoqpwU%2Bb4zuh%2FwWt6yg49vWMAXBR2NqEHh9t7f%2FglAQ0lF2N3ba91UTAYO%2BCfs7KVoY8LwPf02s7jGp0YU5BrAFAkqmmkSR%2FFv28U5U2hZLR43f3ARR9Bgo%2Bg9W9qkjVllP2zrHJpso9bq6K0DDah6%2B%2BWRqiCZQ0UPQZvikvXWrm%2F8%2FJsfFYZKWGQcpPyqBRGZ9aSiJP2KsK1myG4tXeIU3xyepKeuYaVubTgFMub9F%2F%2FchaaWB36y9IxayGlhqrjiZLpDMeSy8uMys4CJRUSkk2jZZddd5AuZBWJqgndDLPbQdn3UwA4n%2FNyGTauHo9pcBOJH2PP6IJJff1nNVN4TVHrZyZa%2FGmHzy%2B6OT8KvVw0jKSO%2F%2BtMj%2BX9n9reLND75SZE4fwfwiDLbMg1q9OnrKCpkjhd6UBfX5f4hoxHKoOTY3PzBg%2FXP5cyyz73kXTeUL7U4aP93wDZdXeGAbq0w%2FmG%2BohgPOrU%2FjMsnpHmjKRL4f778S%2FWfbQglWsd1dlQvlJvI0DI9t1Rgv8LoC9i98iexzSDBQT49c1veX5IcBW%2Fjnl4DwnoNzThzf5bw7LtXEUIb3j8wlcpyicT7MNH%2Fp6f5URjjI2A0XjvOTNUD5VT40H7WTOJNsq2qj%2FpgMIQlDV9P1wRAf4IhrZB4Vt3xB502mZBGz4yN5FRpwp%2BvaDr8DIRvRtYJADYpZHVz2PssqssqMjEJB%2BTR8YmMLeapys82m1xhaBttah4c8QZADMbEgMqcg4WUlUBXkDvCpbLg97UBtLwGZUgISV8xlAilF9Qj2ZhAdwFvEr%2FwhkKbQN1COw2OG0nmxzeLfLQI3YyOinF2ANXKc9hySusdEbXyHAH9RznMsvrXebFP8JKcpi5k3h8DY0AAQoUUX9j6FY0GrFAOQeEhm9tS%2BMJisq6cGOrIBoyvSDxO60oyf3vupXzcigHD%2BlIoFkzje%2BdXd1kuo3qvatLlYcRwbhpEs0aRbNZ0BFqiKybYLNKweluA9n2nfUbLjJAGzRCFpFh%2BYeMLuXLLzh%2Fa5zSZ4jEzGdNroSahowfUWY8kOknRnYU1AMtU%2FiofdC%2FjbJA5bw1vllrCKCWfuQiIHcD9pQCk43oFlsFZmK3KpDPg1ySbbwr6oz6mc6tQ11KtDtAHecKwwNOOqA7msZQ%3D%3D&X-Amz-Signature=c626564d0c2fd26e17561829979ee064d8ccb797b5e0b4a686a8340d03cc292c"],
  //       vips: []);
  //   cafeList.add(cafe);
  //   state = state.copyWith(favoriteCafe: cafeList);
  // }

}
