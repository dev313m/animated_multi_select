import 'package:flutter/material.dart';
import 'package:animated_multi_select/animated_multi_select.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> mainList = [
    "item1",
    "item2",
    "item3",
    "item4",
    "item5",
  ];

  Map<String, Widget> widgetList = {
    'item1': Text('skin: 120', style: TextStyle(color:Color(0xfffff1c1)),),
    "item2": Text('Body: 130', style: TextStyle(color:Color(0xfffff1c1))),
    "item3": Text('Hair: 140', style: TextStyle(color:Color(0xfffff1c1))),
    "item4": Text('Mikiaj: 50', style: TextStyle(color:Color(0xfffff1c1))),
    "item5": Text('Nails: 60', style: TextStyle(color:Color(0xfffff1c1)))
  };

  List<String> selectedList = [
    "item1",
    "item2",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(selectedList.join(" , "), style: TextStyle(color:Color(0xfffff1c1))),
            //
            SingleChildScrollView(
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: MultiSelectChip(
                        reverseScroll: false,
                        introWidget: CircleTransWidget(),
                        introWidgetWidth: 100,
                        color: Color(0xff293462),
                        width: 100,
                        height: 85,
                        borderRadius: BorderRadius.circular(15),
                        borderWidth: 3,
                        mainList: this.mainList,
                        onSelectionChanged: (selectedList) {
                          setState(() {
                            selectedList = selectedList;
                          });
                        },
                        widgetList: widgetList,
                        initialSelectionList: selectedList,
                      )),
                ],
              ),
            ),
            Divider(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('MultiList without intro widget', style: TextStyle(color:Color(0xfffff1c1))),
            ),
            SingleChildScrollView(
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: MultiSelectChip(
                        reverseScroll: false,
                        introWidgetWidth: 100,
                        color: Color(0xff382039),
                        width: 100,
                        height: 200,
                        borderRadius: BorderRadius.circular(30),
                        borderWidth: 1,
                        mainList: this.mainList,
                        onSelectionChanged: (selectedList) {
                          setState(() {
                            selectedList = selectedList;
                          });
                        },
                        widgetList: widgetList,
                        initialSelectionList: selectedList,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleTransWidget extends StatelessWidget {
  final String img;
  CircleTransWidget({Key key, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = 100;
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.red,

          // image: DecorationImage(
          //   fit: BoxFit.fill,
          //   image: AssetImage(
          //     img,
          //   ),
          // ),

          gradient: LinearGradient(
              begin: FractionalOffset.centerLeft,
              end: FractionalOffset.topRight,
              colors: [
                Colors.blue,
                Colors.yellow.withAlpha(9),
              ],
              stops: [
                0.0,
                0.7
              ])
      ),
    );
  }
}
