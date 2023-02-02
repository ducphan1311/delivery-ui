// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailModel _$ProductDetailModelFromJson(Map<String, dynamic> json) {
  return ProductDetailModel(
    json['id'] as int,
    json['name'] as String,
    (json['price'] as num).toDouble(),
    json['unit'] as String,
    json['amountPerUnit'] as String,
    json['title'] as String,
    json['description'] as String,
    json['isFavorite'] as bool,
  );
}

Map<String, dynamic> _$ProductDetailModelToJson(ProductDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'unit': instance.unit,
      'amountPerUnit': instance.amountPerUnit,
      'title': instance.title,
      'description': instance.description,
      'isFavorite': instance.isFavorite,
    };
