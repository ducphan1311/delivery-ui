import 'package:flutter/material.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import 'package:food_delivery/pages/bot_nav_page.dart';

class SplashPage extends StatefulWidget {
  static const ROUTE_NAME = 'SplashPage';
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
          decoration: BoxDecoration(
            color: Color(0xffa259ff),
            image: DecorationImage(
                image: AssetImage(Assets.splash.splashbackground.path), fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 20, top: 30),
                child: Align(
                  alignment: Alignment.topLeft,
                    child: Image.asset(Assets.splash.splashlogo.path)),),
                SizedBox(height: 30,),
                ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    child: Container(
                      width: double.infinity,
                      color: Color(0xfff6f5f5),
                      child: Column(
                        children: [
                          SizedBox(height: 64,),
                          Image.asset(Assets.splash.splashicon.path),
                          SizedBox(height: 24,),
                          Container(
                            height: 80,
                            width: 326,
                            child: Center(
                              child: Text(
                                'Non-Contact Deliveries',
                                style: Theme.of(context).textTheme.headline4,
                                maxLines: 2,
                                textAlign: TextAlign.center,),
                            ),
                          ),
                          SizedBox(height: 25,),
                          Container(
                            height: 79,
                            width: 374,
                            child: Center(
                              child: Text(
                                'When placing an order, select the option “Contactless delivery” and the courier will leave your order at the door.',
                                style: Theme.of(context).textTheme.bodyText1,
                                textAlign: TextAlign.center,),
                            ),
                          ),
                          SizedBox(height: 48,),
                          ElevatedButton(onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> BotNavPage()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff0bce83),
                            elevation: 0,
                            minimumSize: Size(374, 56),
                          ),
                            child: Text('order now'.toUpperCase(),
                          style: Theme.of(context).textTheme.bodyText2,),),
                          SizedBox(height: 32,),
                          InkResponse(
                            onTap: (){},
                            child: Text('dismiss'.toUpperCase(),
                              style: TextStyle(color: Color(0xff9586a8), fontSize: 15, fontFamily: 'SFProBold',
                              fontWeight: FontWeight.normal)),),
                          SizedBox(height: 54,)
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),

    );
  }
}