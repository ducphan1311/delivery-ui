import 'package:flutter_test/flutter_test.dart';
import 'package:food_delivery/data/datasources/mock_data_source.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  test('Mock Data Source Test', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    var mockDataSource = MockDataSource(rootBundle);
    expect((await mockDataSource.getCategoryList()).length, 6);
    expect((await mockDataSource.getSubCategoryList(1)).length, 5);
    expect((await mockDataSource.getProductsBySubCate(1)).length, 3);
    expect((await mockDataSource.getProductDetail('1')).title, 'Spain');
  });


}