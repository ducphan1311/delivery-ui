import 'package:json_annotation/json_annotation.dart';

part 'base_list_model_response.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
  createToJson: false
)
class BaseListModelResponse<T> {
  List<T>? data;
  BaseListModelResponse();
  factory BaseListModelResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$BaseListModelResponseFromJson(json, fromJsonT);
}
