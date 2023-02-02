import 'package:food_delivery/data/models/category_model.dart';
import 'package:food_delivery/data/models/product_detail_model.dart';
import 'package:food_delivery/data/models/product_model.dart';
import 'package:food_delivery/data/models/sub_category_model.dart';

abstract class AppRepository {

  Future<List<CategoryModel>> getCategoryList();

  Future<List<SubCategoryModel>> getSubCategoryList(int categoryId);

  Future<List<ProductModel>> getProductsBySubCate(int subCategory);

  Future<ProductDetailModel> getProductDetail(String id);

}