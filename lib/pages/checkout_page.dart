
import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/custom_switch.dart';

class CheckoutPage extends StatefulWidget {
  static const ROUTE_NAME = 'CheckoutPage';
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  bool status = false;
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        elevation: 50,
        shadowColor: Colors.black26,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 24),
          child: Column(
            children: [
              Container(
                height: 27,
                  child: Row(
                      children:[
                        Text('Payment method', style: Theme.of(context).textTheme.headline5,),
                        Spacer(),
                        InkResponse(onTap: (){},
                          child: Text('CHANGE', style: Theme.of(context).textTheme.button,),)
                  ])),
              SizedBox(height: 32,),
              Container(height: 24,
              child: Row(children: [
                Icon(Icons.credit_card_outlined, color: Color(0xff2d0c57),),
                SizedBox(width: 26,),
                Text('**** **** **** 4747', style: Theme.of(context).textTheme.subtitle1,)
              ],),),
              SizedBox(height: 48,),
              Container(
                  height: 27,
                  child: Row(
                      children:[
                        Text('Delivery address', style: Theme.of(context).textTheme.headline5,),
                        Spacer(),
                        InkResponse(onTap: (){},
                          child: Text('CHANGE', style: Theme.of(context).textTheme.button,),)
                      ])),
              SizedBox(height: 32,),
              Container(height: 128,
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(Icons.home_outlined, color: Color(0xff2d0c57),),
                SizedBox(width: 28,),
                Container(height: 128, width: 197,
                child: Text('Alexandra Smith Cesu \n31 k-2 5.st, SIA \nChili\nRiga\nLV–1012\nLatvia',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(height: 1.5),),)
              ],),),
              SizedBox(
                height: 48,
              ),
              Container(
                  height: 27,
                  child: Row(
                      children:[
                        Text('Delivery options', style: Theme.of(context).textTheme.headline5,),
                        Spacer(),
                        InkResponse(onTap: (){},
                          child: Text('CHANGE', style: Theme.of(context).textTheme.button,),)
                      ])),
              SizedBox(height: 32,),
              Container(
                height: 160,
                child: ListView.separated(itemBuilder: (context, index){
                  return InkResponse(
                    onTap: (){
                      setState(() {
                        selected = index;
                      });
                    },
                    child: Container(height: 24,
                      child: Row(children: [
                        Icon(Icons.person_outline, color:selected==index?Color(0xff7203ff):Color(0xff2d0c57),),
                        SizedBox(width: 26,),
                        Text('I’ll pick it up myself', style: selected==index?
                        TextStyle(color: Color(
                            0xff7203ff),
                            fontFamily: 'SFProRegular', fontSize: 16, fontWeight: FontWeight.w600):
                        Theme.of(context).textTheme.subtitle1,),
                        Spacer(),
                        selected==index?Icon(Icons.close, color: Color(
                            0xff7203ff),):Container()
                      ],),),
                  );
                },
                    separatorBuilder: (context, index){
                  return SizedBox(height: 40,);
                    }, itemCount: 3,
                physics: NeverScrollableScrollPhysics(),),
              ),
              SizedBox(height: 56,),
              Container(height: 24,
                child: Row(children: [
                  Text('Non-contact-delivery', style: Theme.of(context).textTheme.headline5,),
                  Spacer(),
                  CustomSwitch(
                      value: status, onChanged: (value){
                        setState(() {
                          status = value;
                        });
                  }, activeColor: Color(
                      0xffe2cbff))
                ],),),
            ],
          ),
        ),
      )
    );
  }
}