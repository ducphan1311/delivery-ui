// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_list_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseListModelResponse<T> _$BaseListModelResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) {
  return BaseListModelResponse<T>()
    ..data = (json['data'] as List<dynamic>?)?.map(fromJsonT).toList();
}
