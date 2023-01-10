import 'package:flutter/material.dart';
import 'package:flutter_demo/route/route.dart';

/**
 * 自定义router跳转动画
 * SlideTrasition + PageRouteBuilder
 */
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
      home: Scaffold(
        appBar: AppBar(
          title: Text("第一个页面"),
        ),
        body: MyPage(),
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print("点击事件");
        Navigator.push(context, PageRouteBuilder(transitionDuration:Duration(milliseconds: 500),pageBuilder:
            (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
          //FadeTransition渐变动画  SlideTransition平移动画  屏幕左上角是0.0
          return FadeTransition(opacity: animation,child: SlideTransition(
            position: Tween(
                begin: Offset(
                  1.0,
                  0.0,
                ),
                end: Offset(0.0, 0.0))
                .animate(animation),
            child: Page2(),
          ),);
        }));
      },
      child: Text("按钮"),
    );
  }
}
