
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';

/// page 모델
@freezed
class Pagination<T> with _$Pagination {
  factory Pagination(
      {required final int count,
        required final String? nextPageUrl,
        required final String? previousPageUrl,
        required final List<T> results}) = _Pagination;
}
