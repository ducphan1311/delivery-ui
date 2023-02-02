import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_detail_model.g.dart';

@JsonSerializable()
@immutable
class ProductDetailModel {
  final int id;//Boston Lettuce
  final String name;//
  final double price;//1.10
  final String unit;
  final String amountPerUnit;// ~ 150 gr / piece
  final String title;
  final String description;
  final bool isFavorite;

  ProductDetailModel(this.id, this.name, this.price, this.unit,
      this.amountPerUnit, this.title, this.description, this.isFavorite);

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailModelToJson(this);

}
