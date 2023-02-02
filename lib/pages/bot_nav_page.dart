
import 'package:flutter/material.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import 'package:food_delivery/pages/categories_page.dart';
import 'package:food_delivery/pages/category_detail_page.dart';
import 'package:food_delivery/pages/checkout_page.dart';

class BotNavPage extends StatefulWidget {
  static const ROUTE_NAME = 'BotNavPage';
  @override
  _BotNavPageState createState() => _BotNavPageState();
}

class _BotNavPageState extends State<BotNavPage> {
  late ScrollController scrollController;
  int _currentTabIndex = 0;
  String _cateName = '';
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          CategoriesPage((currentNav){
            setState(() {
              _pageController.jumpToPage(currentNav);
            });
          }, (cateName){
            setState(() {
              _cateName = cateName;
            });
          }),
          CheckoutPage(),
          CategoriesPage((currentNav){
            setState(() {
              _pageController.jumpToPage(currentNav);
            });
          },(cateName){
            setState(() {
              _cateName = cateName;
            });
          }),
          CategoryDetailPage(_cateName),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
        height: 80,
        decoration: BoxDecoration(
            border: Border(top: Divider.createBorderSide(context))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _currentTabIndex = 0;
                  _pageController.jumpToPage(0);
                });
              },
              child: _currentTabIndex == 0
                  ? Image.asset(Assets.category.grid.path)
                  : Image.asset(Assets.category.grid2.path),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _currentTabIndex = 1;
                  _pageController.jumpToPage(1);
                });
              },
              child: _currentTabIndex == 1
                  ? Image.asset(Assets.category.grid.path)
                  : Image.asset(Assets.category.grid2.path),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _currentTabIndex = 2;
                  _pageController.jumpToPage(2);
                });
              },
              child: _currentTabIndex == 2
                  ? Image.asset(Assets.category.grid.path)
                  : Image.asset(Assets.category.grid2.path),
            )
          ],
        ),
      ),
    );
  }
}
