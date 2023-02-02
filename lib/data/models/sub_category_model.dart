import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sub_category_model.g.dart';

@immutable
@JsonSerializable()
class SubCategoryModel {
  final int id;
  final String image;
  final String title;
  final int counter;
  SubCategoryModel({required this.id, required this.image, required this.title, required this.counter});

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryModelToJson(this);
}
