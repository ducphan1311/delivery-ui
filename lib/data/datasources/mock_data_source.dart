import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food_delivery/data/models/base_list_model_response.dart';
import 'package:food_delivery/data/models/base_model_response.dart';
import 'package:food_delivery/data/models/category_model.dart';
import 'package:food_delivery/data/models/product_detail_model.dart';
import 'package:food_delivery/data/models/product_model.dart';
import 'package:food_delivery/data/models/sub_category_model.dart';
import 'package:food_delivery/data/repostitory/app_repository.dart';

class MockDataSource extends AppRepository {
  AssetBundle assetBundle;

  MockDataSource(this.assetBundle);

  @override
  Future<List<CategoryModel>> getCategoryList() async {
    var data = await assetBundle.loadString('assets/mock/categories.json', cache: false);
    return BaseListModelResponse<CategoryModel>.fromJson(
        json.decode(data), (json) => CategoryModel.fromJson(json as Map<String, dynamic>)).data!;
  }

  @override
  Future<List<ProductModel>> getProductsBySubCate(int subCategory) async {
    var data = await assetBundle.loadString('assets/mock/products.json', cache: false);
    return BaseListModelResponse<ProductModel>.fromJson(
        json.decode(data), (json) => ProductModel.fromJson(json as Map<String, dynamic>)).data!;
  }

  @override
  Future<List<SubCategoryModel>> getSubCategoryList(int categoryId) async {
    var data = await assetBundle.loadString('assets/mock/sub_categories.json', cache: false);
    return BaseListModelResponse<SubCategoryModel>.fromJson(
        json.decode(data), (json) => SubCategoryModel.fromJson(json as Map<String, dynamic>)).data!;

  }

  @override
  Future<ProductDetailModel> getProductDetail(String id) async {
    var data = await assetBundle.loadString('assets/mock/product_detail.json', cache: false);
    return BaseModelResponse<ProductDetailModel>.fromJson(
        json.decode(data), (json) => ProductDetailModel.fromJson(json as Map<String, dynamic>)).data!;

  }

}