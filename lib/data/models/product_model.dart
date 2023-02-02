import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@immutable
@JsonSerializable()
class ProductModel {
  final int id;//Boston Lettuce
  final String name;//
  final double price;//1.10
  final String unit;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.unit,
  }); //kg,piece
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

}
