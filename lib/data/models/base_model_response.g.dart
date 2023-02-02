// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModelResponse<T> _$BaseModelResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) {
  return BaseModelResponse<T>()
    ..data = _$nullableGenericFromJson(json['data'], fromJsonT);
}

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);
