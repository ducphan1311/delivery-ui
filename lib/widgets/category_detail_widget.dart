import 'package:flutter/material.dart';

class CategoryDetailWidget extends StatefulWidget {
  static const ROUTE_NAME = 'CategoryDetailWidget';
  final int index;

  CategoryDetailWidget(this.index);

  @override
  _CategoryDetailWidgetState createState() => _CategoryDetailWidgetState();
}

class _CategoryDetailWidgetState extends State<CategoryDetailWidget> {
  List<String> list = ['Сabbage and lettuce', 'Сucumbers and tomatoes',
    'Oinons and garlic', 'Peppers', 'Potatoes and carrots'];
  List<Tab> tabs = [
    Tab('Сabbage and lettuce (8)', false),
    Tab('Сucumbers and tomatoes (8)', false,),
    Tab('Oinons and garlic (8)', false),
    Tab('Peppers (8)', false),
    Tab('Potatoes and carrots (8)', false),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      child: ListView.separated(
          separatorBuilder: (context,index) {
            return SizedBox(width: 8,);
          },
          itemBuilder: (context, index){
            int _index = index + widget.index;
            return InkWell(
              onTap: (){
                setState(() {
                  tabs[_index].selected = !tabs[_index].selected;
                });
              },
              child: tabs[_index].selected?Container(
                height: 34,
                padding: EdgeInsets.only(left: 19, right: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Color(0xffe2cbff)
                ),
                child: Row(
                    children:[
                      Icon(Icons.close,
                        color: Color(0xff6c0ee4),),
                      SizedBox(width: 12,),
                      Text(tabs[_index].name, style: TextStyle(
                        color: Color(0xff6c0ee4),
                      ),),]),
              ):Container(
                padding: EdgeInsets.symmetric(horizontal: 15,
                vertical: 8),
                height: 34,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white
                ),
                child: Center(child: Text(tabs[_index].name,
                style: Theme.of(context).textTheme.subtitle2,),),
              )
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: 3),
    );
  }
}
class Tab {
  String name;
  bool selected;

  Tab(this.name, this.selected);

}