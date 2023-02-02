
import 'package:flutter/material.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import 'package:food_delivery/widgets/my_text_form_field.dart';

class PaymentPage extends StatefulWidget {
  static const ROUTE_NAME = 'PaymentPage';
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  static const TAG = 'PaymentPage';
  late ScrollController scrollController;
  double? offset;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      setState(() {
        offset = scrollController.offset;
      });
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
                    forceElevated: innerBoxIsScrolled,
                    centerTitle: false,
                    expandedHeight: 130.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: false,
                      titlePadding: EdgeInsets.symmetric(horizontal: offset==null?20:(20+offset!*0.2), vertical: 15),
                      title: Text('Credit / Debit card', style: Theme.of(context).textTheme.headline5,),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text('Credit / Debit card', style: Theme.of(context).textTheme.headline1,),
                SizedBox(height: 21,),
                Container(
                  width: double.infinity,
                  height: 240,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(image: AssetImage(Assets.payment.pay1.path),
                          fit: BoxFit.cover)
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(Assets.payment.pay2.path),
                      ),
                      Positioned(
                          top:20,
                          right: 29,
                          child: Image.asset(Assets.payment.pay4.path)),
                      Positioned(
                          top:20,
                          right: 38,
                          child: Image.asset(Assets.payment.pay3.path)),
                      Align(alignment: Alignment.center,
                        child: Text('4747  4747  4747  4747', style: TextStyle(fontSize: 26,
                            fontFamily: 'SFProRegular', fontWeight: FontWeight.normal),),),
                      Positioned(bottom: 31,
                          left: 27,
                          child: Text('alexandra Smith'.toUpperCase(), style: TextStyle(
                              fontSize: 20, fontFamily: 'SFProRegular', fontWeight: FontWeight.w500
                          ),)),
                      Positioned(bottom: 31,
                          right: 29,
                          child: Text('07/21'.toUpperCase(), style: TextStyle(
                              fontSize: 20, fontFamily: 'SFProRegular', fontWeight: FontWeight.w500
                          ),))
                    ],
                  ),
                ),
                SizedBox(height: 24,),
                Container(width: double.infinity,
                  child: Center(child: Image.asset(Assets.payment.camera.path),),),
                SizedBox(height: 13,),
                Text('      Name on card', style: Theme.of(context).textTheme.subtitle2,),
                MyTextFormField(txtInPut: 'Name on card',),
                SizedBox(height: 23,),
                Text('      Card number', style: Theme.of(context).textTheme.subtitle2,),
                MyTextFormField(txtInPut: 'Card number',
                  suffix: Container(
                    width: 50,
                    height: 48,
                    child: Stack(
                      children: [
                        Positioned(
                          right: 17,
                          top:13,
                          child: Container(width: 16, height: 20,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(Assets.payment.pay4.path))
                            ),),
                        ),
                        Positioned(
                          right: 23,
                          top: 13,
                          child: Container(width: 16, height: 20,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(Assets.payment.pay3.path))
                            ),),
                        )
                      ],
                    ),
                  ),),
                SizedBox(height: 23,),
                Container(height: 70,
                  child: Row(children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('      Expiry date',style: Theme.of(context).textTheme.subtitle2,),
                          MyTextFormField(txtInPut: 'Expiry date',),
                        ],
                      ),
                    ),
                    SizedBox(width: 16,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('      CVC',style: Theme.of(context).textTheme.subtitle2,),
                          MyTextFormField(txtInPut: 'CVC',
                              suffix: Padding(
                                  padding: EdgeInsets.only(right: 17),
                                  child: Icon(Icons.payment))
                          )
                        ],
                      ),
                    ),
                  ],),),
                SizedBox(height: 55,),
                ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 56),
                    primary: Color(0xff0acf83),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0), child: Text('use this card'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText2,
                ))

              ],
            ),),
          ),

        ),

      )


    );
  }
}