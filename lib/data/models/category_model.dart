import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@immutable
@JsonSerializable()
class CategoryModel {
  final int id;
  final String image;
  final String title;
  final int counter;
  CategoryModel({required this.id, required this.image, required this.title, required this.counter});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
