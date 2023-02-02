import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import 'package:food_delivery/pages/payment_page.dart';

class ProductDetailPage extends StatefulWidget {
  static const ROUTE_NAME = 'ProductDetailPage';
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _current = 0;
  final List<String> imgList = [
    Assets.productdetail.productdetail1.path,
    Assets.productdetail.productdetail1.path,
    Assets.productdetail.productdetail1.path
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 358,
            width: double.infinity,
            child: Column(
              children: [
                CarouselSlider(items: <Widget>[
                     Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(imgList[0]),
                        fit: BoxFit.cover)
                      ),
                    ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(imgList[1]),
                            fit: BoxFit.cover)
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(imgList[2]),
                            fit: BoxFit.cover)
                    ),
                  )

                ], options: CarouselOptions(
                    height: 358,
                    viewportFraction: 1.0,
                  autoPlay: true,
                  onPageChanged:(index, reason){
                      setState(() {
                        _current = index;
                      });
                  }
                ))
              ],
            )
          )
        ),
        Positioned.fill(
          top: 190,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 70,
              height: 8,
              child: ListView.separated(itemBuilder: (context, index){
                return Container(
                  width: _current == index?18:8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    shape: BoxShape.rectangle,
                    color: _current == index
                        ? Colors.white
                        : Color.fromRGBO(255, 255, 255, 0.5),
                  ),
                );
              }, separatorBuilder: (context, index){
                return SizedBox(width: 8,);
              }, itemCount: 3,
              scrollDirection: Axis.horizontal,),
            )

          ),
        ),
        Positioned.fill(
          top: 230,
          child:  Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 615,
                width: double.infinity,
                child: SingleChildScrollView(
                  child:    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30,),
                      Text('Boston Lettuce', style: Theme.of(context).textTheme.headline4,),
                      SizedBox(height: 16,),
                      Container(
                        height: 44,
                        child: Row(
                          children: [
                            Text('1.10', style: Theme.of(context).textTheme.headline3,),
                            SizedBox(width: 5,),
                            Text('€ / piece', style: Theme.of(context).textTheme.headline2,)
                          ],
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text('~ 150 gr / piece',
                        style: TextStyle(color: Color(0xff06be77), fontSize: 17,
                            fontFamily: 'SFProRegular', fontWeight: FontWeight.normal),),
                      SizedBox(height: 32,),
                      Text('Spain', style: Theme.of(context).textTheme.headline5,),
                      SizedBox(height: 16,),
                      Text('Lettuce is an annual plant of the daisy family, Asteraceae. It is most often grown as a leaf vegetable, but sometimes for its stem and seeds. Lettuce is most often used for salads, although it is also seen in other kinds of food, such as soups, sandwiches and wraps; it can also be grilled.',
                        style: Theme.of(context).textTheme.bodyText1,),
                      SizedBox(height: 56,),
                      Container(
                        height: 56,
                        child: Row(
                          children: [
                            ElevatedButton(onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  minimumSize: Size(MediaQuery.of(context).size.width*0.2, 56),
                                  primary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                          color: Color(0xffd9d0e3),
                                          width: 1
                                      )
                                  )
                              ), child: Icon(Icons.favorite_border,
                                color: Color(0xff9586a8),),),
                            Spacer(),
                            ElevatedButton(onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentPage()));
                            },
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  minimumSize: Size(MediaQuery.of(context).size.width*0.65, 56),
                                  primary: Color(0xff0bce83),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )
                              ), child: Row(
                                  children:[ Icon(Icons.add_shopping_cart,
                                      color: Colors.white),
                                    SizedBox(width: 17,),
                                    Text('add to cart'.toUpperCase(),
                                      style: Theme.of(context).textTheme.bodyText2,)]
                              ),),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                    ],
                  ),
                )
              ),
            ),
          ),
        )

      ],
    ));
  }
}
