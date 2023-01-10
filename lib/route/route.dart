import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MainPage());

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/page2":(_){
          return Page2();
        }
      },
        home: Scaffold(
            appBar: AppBar(title: Text("标题")),
            body: MainPage2()));
  }
}
class MainPage2 extends StatefulWidget {
  const MainPage2({Key? key}) : super(key: key);

  @override
  _MainPage2State createState() => _MainPage2State();
}

class _MainPage2State extends State<MainPage2> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        print("点击main");
        Navigator.pushNamed(context, "/page2");
      },
      child: Text("按钮"),
    );
  }
}


class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar(title: Text("Page2"),),body: TextButton(
        onPressed: () {
          print("点击page2");
          Navigator.pop(context);
        },
        child: Text("page2")),);
  }
}
