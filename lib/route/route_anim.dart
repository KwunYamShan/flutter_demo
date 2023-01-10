import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MainPage());

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

late Animation<Offset> animate;
late AnimationController controller;

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    animate = Tween(begin: Offset(0.0, 0.0), end: Offset(-1.0, 0.0))
        .animate(controller); //补间动画
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      "/page2": (_) {
        return Page2();
      }
    }, home: Scaffold(appBar: AppBar(title: Text("标题")), body: MainPage2()));
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
    return SlideTransition(
      position: animate,
      child: RawMaterialButton(
        onPressed: () async{
          print("点击main");
          await Navigator.push(context, PageRouteBuilder(transitionDuration:Duration(milliseconds: 250),pageBuilder:
              (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
            controller.forward(); //启动动画
            return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween(
                          begin: Offset(
                            1.0,
                            0.0,
                          ),
                          end: Offset(0.0, 0.0))
                      .animate(animation),
                  child: Page2(),
                ));
          }));
          controller.reverse();//反向执行动画
        },
        child: Text("按钮按钮按钮按钮按钮按钮按钮",style: TextStyle(backgroundColor: Color(0xff000000),color: Color(0xffffffff)),),
      ),
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Page2"),
      ),
      body: TextButton(
          onPressed: () {
            print("点击page2");
            Navigator.pop(context);
          },
          child: Text("page2")),
    );
  }
}
