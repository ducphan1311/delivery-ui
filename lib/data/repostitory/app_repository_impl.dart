import 'package:food_delivery/data/datasources/mock_data_source.dart';
import 'package:food_delivery/data/models/category_model.dart';
import 'package:food_delivery/data/models/product_detail_model.dart';
import 'package:food_delivery/data/models/product_model.dart';
import 'package:food_delivery/data/models/sub_category_model.dart';
import 'package:food_delivery/data/repostitory/app_repository.dart';

class AppRepositoryImpl extends AppRepository {

  MockDataSource dataSource;

  AppRepositoryImpl(this.dataSource);

  @override
  Future<List<CategoryModel>> getCategoryList() {
    return dataSource.getCategoryList();
  }

  @override
  Future<List<ProductModel>> getProductsBySubCate(int subCategory) {
    return dataSource.getProductsBySubCate(subCategory);
  }

  @override
  Future<List<SubCategoryModel>> getSubCategoryList(int categoryId) {
    return dataSource.getSubCategoryList(categoryId);
  }

  @override
  Future<ProductDetailModel> getProductDetail(String id) {
    return dataSource.getProductDetail(id);
  }

}