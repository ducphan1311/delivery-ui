import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import 'package:food_delivery/pages/product_detail_page.dart';
import 'package:food_delivery/widgets/category_detail_widget.dart';

class CategoryDetailPage extends StatefulWidget {
  static const ROUTE_NAME = 'CategoryDetailPage';
  final String categoryName;

  CategoryDetailPage(this.categoryName);

  @override
  _CategoryDetailPageState createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  late ScrollController scrollController;
  bool _silverCollapsed = false;
  int _currentIndex = 0;
  double? offset;
  double roundDown(int value, int precision) {
    final isNegative = value.isNegative;
    final mod = pow(10.0, precision);
    final roundDown = (((value.abs() * mod).floor()) / mod);
    return isNegative ? -roundDown : roundDown;
  }


  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    // late Animation<Offset> _animation = Tween(
    //   begin: Offset.zero,
    //   end: Offset(0.8, 0.8),
    // ).animate(ScrollAn);
    scrollController.addListener(() {
      print('offset: ' +  offset.toString());
      setState(() {
        offset = scrollController.offset;
      });

      //
      // if (scrollController.offset > 150) {
      //   _silverCollapsed = true;
      //   setState(() {
      //     offset = scrollController.offset;
      //   });
      // }
      // if (scrollController.offset <= 150) {
      //   _silverCollapsed = false;
      //   setState(() {});
      // }
    });

  }

  @override
  Widget build(BuildContext context) {
    print('width: ' + MediaQuery.of(context).size.width.toString());
    // if (scrollController.){
    //   print('offset: ' +  scrollController.offset.toString());
    //
    // }

    return Scaffold(
      body: SafeArea(
        child:
        NestedScrollView(
          controller: scrollController,
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverSafeArea(
                  top: false,
                  sliver: SliverAppBar(
                    expandedHeight: 180,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar.createSettings(
                      currentExtent: 10,
                      child: FlexibleSpaceBar(
                        centerTitle: true,
                        titlePadding: EdgeInsets.only(top: 5, bottom: 5),
                        title: Stack(
                          children: [
                            Align(alignment: Alignment.topRight,
                                child: Image.asset(Assets.categorydetail.vegetable.path)),
                            AnimatedPadding(
                              padding: EdgeInsets.only(
                                top: offset==null?70:(70-offset!*0.32),
                                  left: offset==null?30:(30+offset!*0.2),),
                              duration: const Duration(milliseconds: 1),
                              curve: Curves.fastOutSlowIn,
                              child: Container(
                                height: 90,
                                child: AnimatedDefaultTextStyle(
                                    child: Text(
                                        widget.categoryName,
                                        ),
                                    style: TextStyle(fontSize: offset==null?28:(28-offset!*0.05),
                                        fontWeight: FontWeight.w600, color: Colors.black),
                                    duration: Duration(milliseconds: 400))

                              ),
                            ),
                            AnimatedPadding(
                              padding: EdgeInsets.only(left: offset==null?0:(offset!*1.25),
                                top: offset==null?120:(120-offset!*0.65),
                              ),
                              duration: const Duration(microseconds: 1),
                              curve: Curves.fastOutSlowIn,
                              child: AnimatedContainer(
                                width: offset==null?MediaQuery.of(context).size.width:(MediaQuery.of(context).size.width-offset!*0.5),
                                duration: Duration(seconds: 1),
                                curve: Curves.fastOutSlowIn,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20),
                                child: TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(left: 25, right: 21),
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.black,
                                        size: 22,
                                      ),
                                    ),
                                    hintText: 'Search',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                CategoryDetailWidget(0),
                SizedBox(height: 20,),
                CategoryDetailWidget(2),
                SizedBox(height: 30,),
                Expanded(
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(0),
                    separatorBuilder: (context, index){
                      return SizedBox(height: 40,);
                    },
                    itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.only(right: 17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(Assets.categorydetail.categorydetail.path,
                            width: MediaQuery.of(context).size.width*0.45,
                            height: MediaQuery.of(context).size.height*0.17,),
                          SizedBox(width: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width*0.37,
                            height: MediaQuery.of(context).size.height*0.17,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Boston Lettuce',
                                    style: Theme.of(context).textTheme.headline6),
                                Container(
                                  child: Row(
                                      children:[
                                        Text('1.10',
                                          style: Theme.of(context).textTheme.subtitle1,),
                                        SizedBox(width: 2,),
                                        Text('€ / piece',
                                          style: Theme.of(context).textTheme.subtitle1,),
                                      ]),
                                ),
                                Container(
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(child:
                                      ElevatedButton(onPressed: (){},
                                        style: ElevatedButton.styleFrom(
                                            minimumSize: Size(MediaQuery.of(context).size.width*0.1,
                                                MediaQuery.of(context).size.height*0.07),
                                            primary: Color(0xffffffff),
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8),
                                                side: BorderSide(
                                                    color: Color(0xffd9d0e3)
                                                )
                                            )
                                        ),
                                        child: Icon(Icons.favorite_border,
                                          color: Color(0xff9586a8),),),),
                                      SizedBox(width: 16,),
                                      Expanded(child: ElevatedButton(onPressed: (){
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context)=>ProductDetailPage()));
                                      },
                                        style: ElevatedButton.styleFrom(
                                            minimumSize: Size(MediaQuery.of(context).size.width*0.1,
                                                MediaQuery.of(context).size.height*0.07),
                                            primary: Color(0xff0bce83),
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8)
                                            )
                                        ),
                                        child: Icon(Icons.add_shopping_cart,
                                          color: Color(0xffffffff),),)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }, itemCount: 30,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}