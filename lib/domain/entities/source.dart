import 'package:freezed_annotation/freezed_annotation.dart';

part 'source.freezed.dart';

@freezed
class Source with _$Source {
  const factory Source({
    required String? id,
    required String? name,
    String? description,
  }) = _Source;
}
