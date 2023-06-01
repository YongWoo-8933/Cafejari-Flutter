import 'dart:convert';
import 'package:flutter/services.dart';

/// _none값 전역변수
const String none = "_none";

/// asset/json/ 경로에 위치한 json 파일의 특정 값을 가져 오는 함수로,
/// [fileName]으로 파일 명을,
/// [stringKey]로 읽을 값의 key를 지정 한다.
Future<String> getValueFromJsonFile({required String fileName, required String stringKey}) async {
  final String jsonString = await rootBundle.loadString('asset/json/$fileName');
  return json.decode(jsonString)[stringKey];
}

/// asset/image/[imageName].png 경로를 반환
String getPNGAssetPath(imageName) {
  return "asset/image/$imageName.png";
}