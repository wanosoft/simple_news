import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/source.dart';

part 'source_model.freezed.dart';
part 'source_model.g.dart';

@freezed
class SourceModel with _$SourceModel {
  const SourceModel._();

  const factory SourceModel({
    required String? id,
    required String? name,
    String? description,
  }) = _SourceModel;

  factory SourceModel.fromJson(Map<String, dynamic> json) =>
      _$SourceModelFromJson(json);

  Source toSource() => Source(id: id, name: name);
}
