import 'package:json_annotation/json_annotation.dart';

part 'base_model_response.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
  createToJson: false
)
class BaseModelResponse<T> {
  T? data;
  BaseModelResponse();
  factory BaseModelResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$BaseModelResponseFromJson(json, fromJsonT);
}
