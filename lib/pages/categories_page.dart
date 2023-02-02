import 'package:flutter/material.dart';
import 'package:food_delivery/gen/assets.gen.dart';

class CategoriesPage extends StatefulWidget {
  static const ROUTE_NAME = 'CategoriesPage';
  final ValueChanged<int> callbackNav;
  final ValueChanged<String> callbackCateName;

  CategoriesPage(this.callbackNav, this.callbackCateName);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late ScrollController scrollController;
  bool _silverCollapsed = false;
  double? offset;


  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      setState(() {
        offset = scrollController.offset;
      });
      // if (scrollController.offset > 150) {
      //   _silverCollapsed = true;
      //   setState(() {});
      // }
      // if (scrollController.offset <= 150) {
      //   _silverCollapsed = false;
      //   setState(() {});
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
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
                                        'Categories',
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
              ),          ];
          },
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.35),
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 20.0,
                      ),
                      itemCount: 30,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            setState(() {
                              widget.callbackNav(3);
                              widget.callbackCateName('Vegetables');
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Color(0xffd9d0e3),
                                    width: 1)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height*0.215,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(Assets.category.media.path),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 5,),
                                        Text(
                                          'Vegetables',
                                          style:
                                          Theme.of(context).textTheme.headline6,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '(43)',
                                          style:
                                          Theme.of(context).textTheme.caption,
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
