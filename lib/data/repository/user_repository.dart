import 'package:cafejari_flutter/data/remote/api_service.dart';

/// user application api와 통신하는 저장소
abstract class UserRepository {
}

/// user repository의 구현부
class UserRepositoryImpl implements UserRepository {
  APIService apiService = APIService();
  final String appLabel = "user";

}
